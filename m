Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD00CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 21:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B95FF8448B;
	Thu, 25 Sep 2025 21:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyBzQX3xLMNv; Thu, 25 Sep 2025 21:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C44838448A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C44838448A;
	Thu, 25 Sep 2025 21:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75F50177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 626CC84481
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 21:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIUhRKuN0V6F for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 21:26:09 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 25 Sep 2025 21:26:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 102A88447C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 102A88447C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.37.156;
 helo=8.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN> 
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net
 [46.105.37.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 102A88447C
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 21:26:07 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.254.198])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4cXmmd3bHsz5vsq;
 Thu, 25 Sep 2025 21:18:57 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Thu, 25 Sep
 2025 23:18:57 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ef9e822c-c964-4fac-a733-d6b3c3475a96@kaod.org>
Date: Thu, 25 Sep 2025 23:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, Joel Stanley <joel@jms.id.au>
References: <20250923135223.1062683-1-clg@kaod.org>
 <8d3ee63fa1e851699b49b789cfb5da9e@free.fr>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Language: en-US, fr
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <8d3ee63fa1e851699b49b789cfb5da9e@free.fr>
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 48dbaf67-b28f-4d4f-ac0a-0dbec1348145
X-Ovh-Tracer-Id: 12808518815743118301
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFjUx94KucYm083EjqT/bL8f9cBSQ9OWVxuZhOfjqQy5zbI5U8tvc76d9k3QjefwDNb8sca1eodISAvlMRXxZmhvW7bKIPo1dsBfRWpLzeSX2xUWIEA+YdesOqlVW6+x62KIW6fu4X4lzTu4sm4xHQZhSf3uzw/zjDAST1+hCLeQO2iJhyzvVNq2nScbtwIzOrbTiPYB1v1gWEZzgi0WyBM1aDDQV+HGG+UBe0I+XPrvUETGVxU+M5tpwhNJrTDnH81TQdrcJzZI2e79SDIrymdQ0npkWa3GFsQtLEPlZmGTMGgIMigSmkkS6P2MoYYBPryXaAEFNq6aFITv89Nx6CkpuKxSbE0ZDzJ9ktFtd/ANZPfACBt1vZRuDBKaPu4c2qZOSB//jOmaufw7kWPpGnDcjxFvJmaMmmoksQRdFT9al1/srLj4GHLhhv7plikpllmXPj2QAuqPBx7u6bK511iWzkxZ5+9JlmQ4UfsnVXDjcpyUsyTXCCvWkZSNA5Yqe55r0lAuG6nU3N/TXDZZNtCaYF7Slui7hFw97fQ5/SRJoQBdmURbo5zchmSjf52dAhKDkqbIjnprKc3WrGClvtpnPIpsbCLjSbFaqaTjM/kJzy5Zv0XPBs2F1cyqS0iWo+YU8J7BqcJcSxiVXs83JmxT7Gkr6ujUWE9gYWitePTKg
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=ElJBuNYQ+QJP0BGlpe4EZgzJCEN5oylJzPcuic0Q4to=; 
 c=relaxed/relaxed; d=kaod.org; h=From; s=ovhmo393970-selector1;
 t=1758835138; v=1;
 b=lPJFidXMOsOiIx4jtH8Fzay+ggbIyu0UmDiqKtcVElnieF4WoDvUppMIuISbGUze1gMPp729
 eYFfXy1mNybQPWKMo/DMxC5Uuu039IM56Auv4uHt8UbcXdXM5RbkThwYWzfgsBmGEFSJYSkC2cL
 rcY8Kb9wQ4YRKgmePP258nUPIhqjMz3ey5fwuErTGqOl6KosD2UQKQtXRSCCOnak8Tgg8sn8SE+
 91YAOCrmYdDTswMjz2pLJFInMXNySPsjaA67rSsn5VTcMuxnSxQXGhTsFe3OjCZDwTJY/3JUJKy
 fhnLcIv2Qw/TIPjwUboUiCveUFaXPO7bqcCdEaSyfVUQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kaod.org header.i=@kaod.org header.a=rsa-sha256
 header.s=ovhmo393970-selector1 header.b=lPJFidXM
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0044d15bc62-be20-479b-ae1c-286ddf35692b,
 430B70353558F8354C2EE2D8074F991CFFE72556) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed_ast2500evb: check hashes,
 use bootlin toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS8yNS8yNSAyMTo0MiwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkgQ8OpZHJpYywgSm9l
bCwgQWxsLAo+IAo+IE9uIDIzLzA5LzIwMjUgMTU6NTIsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3Rl
Ogo+PiBUaGlzIGNvbW1pdCBhZGRzIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eSBh
bmQKPj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY2X0VBQklIRl9HTElCQ19T
VEFCTEU9eSBpbiB0aGUKPj4gZGVmY29uZmlnLCBidW1wcyBrZXJuZWwgdG8gNi4xNi43LCBhbmQg
YWRkcyBjdXN0b20gaGFzaCBmaWxlcyBhbmQKPj4gcmVtb3ZlcyB0aGUgZXhjZXB0aW9uIGVudHJ5
IGluIC5jaGVja3BhY2thZ2VpZ25vcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUg
R29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4+IC0tLQo+IFsuLi5dCj4+IGRpZmYgLS1naXQgYS9jb25m
aWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBl
dmJfZGVmY29uZmlnCj4+IGluZGV4IDY0NjY2Y2MzZDcwNC4uY2E2YTFlZjNkMzhlIDEwMDY0NAo+
PiAtLS0gYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwo+PiArKysgYi9jb25m
aWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwo+PiBAQCAtMSwxMiArMSwxNiBAQAo+PiDC
oEJSMl9hcm09eQo+PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE2
PXkKPj4gK0JSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+PiArQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOPXkKPj4gK0JSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WNl9FQUJJ
SEZfR0xJQkNfU1RBQkxFPXkKPiAKPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBjaGVjayBmYWls
dXJlLiBTZWU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy8xMTQ4MTIzODM0MQo+IAo+IFdBUk46IGRlZmNvbmZpZyAuL2NvbmZpZ3MvYXNwZWVkX2Fz
dDI1MDBldmJfZGVmY29uZmlnIGNhbid0IGJlIHVzZWQ6Cj4gIMKgwqDCoMKgwqAgTWlzc2luZzog
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY2X0VBQklIRl9HTElCQ19TVEFCTEU9
eQo+IAo+IFRoaXMgZGVmY29uZmlnIGRvZXMgbm90IHNlbGVjdCBhbnkgQ1BVLCBzbyBpdCBkZWZh
dWx0cyB0bzoKPiBCUjJfYXJtOTI2dD15Cj4gCj4gQWNjb3JkaW5nIHRvIHRoZSBLZXJuZWwgZHRz
Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJs
ZS9saW51eC5naXQvdHJlZS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc1LmR0c2k/
aD12Ni4xNi43I240MAo+IAo+IENwdSBzZWVtcyB0byBiZSAiYXJtMTE3Nmp6Zi1zIi4KCml0IGlz
LgoKPiAKPiBJbiB0aGF0IGNhc2UsIHRoaXMgZGVmY29uZmlnIHNob3VsZCBhZGQ6Cj4gQlIyX2Fy
bTExNzZqemZfcz15CgpvawogIAo+IENvdWxkIHlvdSBjb25maXJtIGl0IGlzIHRoZSBjYXNlIGFu
ZCBzZW5kIGEgcGF0Y2ggZml4aW5nIHRoZSBpc3N1ZSwKPiBwbGVhc2U/CgpXaWxsIGRvLiBIb3cg
Y29tZSBJIGRpZG4ndCBzZWUgYW55IGJ1aWxkIGZhaWx1cmVzID8KClRoYW5rcywKCkMuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
