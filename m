Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C0606A32D
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RGUPOoOx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=gSE/skv1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB686065F;
	Sat, 14 Nov 2026 14:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkAz7CC37-ie; Sat, 14 Nov 2026 14:01:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4AF286066C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794664874;
	b=eKZxw8gXY92cfDX6CljtnqB4RqwHGo1JD8dpb8GNJjkEBxz40ggDFtK1vlnfXqLSlVDe
	 8B8W7upNANzfLMlm9e6jg9I4HCnaFhWd/WdqoFfd9XqO21PuOnRBSiT64FkDSU5pcgqKL
	 299JgHukfqW/0AnftG7In4buY3NvwXG/y2wn4Mr+8I2m4/rhoVtLYeuBgSCxe8YjsSvPq
	 sw94+UAVCY7Hw8MDjkvCo9cGgjOfD/0OuwCCeW9lYSQd0/BcByh5tjWF3CjoDtWrWu+Xo
	 ucllp1m1SdEBTQH8rDCVJcaKGSEsmtl7HRNtYy7EoU4Qf+wBjpFhWiVQ5eaN41f3Etg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794664874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=A2XCHWjGjragc59ZJvTSbH1QG8WOfO09tZmVcSC7Zsg=;
	b=mG2avkEgRIBUnJ6FkMeO+LjtI0j8rKfPibLAJq2nen1V6Os+KVrN5yVIVBpPlQVofrzm
	 me57oaeBSsqxtkl20cBhYXKa9xtG7Yczg5l/xlQgmt0E53sOkVOt862ig5DQo5ps2yT1a
	 LxybaeZJCBvbFB92VL9H0iPr6rfvVBDVujSwbDUsFrgoMKHXezoX4Oyj2ZLU0k7ousr+9
	 lN/wcA/ASTHv18J+otAi8MNFfBzJxgYJQWbYUrhE+MOCtjMl4ZnFz0VW491IPAl+0Gmsj
	 ismmY6GVvbppc2TVYFXEgVD6mIYLJbFhcU9rHZqyr1dVdDNeKlg6WffJGiRY56KcBqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794664874;
	bh=A2XCHWjGjragc59ZJvTSbH1QG8WOfO09tZmVcSC7Zsg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RGUPOoOxe4bd/6p8T8BbpanAhFkRRXVJ1KUF3E4F9YPd5oGwTiIFp0CzUAJlrmycz
	 k4WzlMjljeCCPptmx79IFug19R6Wj3gFYGFroiic5Ad0I4ju1iYtvvcLHaKlnZm3T4
	 WuygFEHdkpg9AzBiwBdeoXaVPzB9uvhOh/KIw50elOSBHYbHwDkp6e/Nc8q/vpDELq
	 /YIMw96lWt02DtwhBy/nuw4wFalaWDwmhUYdTx44m+aXu04LhDmiilKbqFsNSwdcDt
	 vj/q99fK1eA30SVSEg0Sp3XA9py5uCAeZRfenqC+jf83qS9JweprSjwmS0BMp2ybsh
	 oxq7eDqlxwAyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF286066C;
	Sat, 14 Nov 2026 14:01:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF5D2169
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D029816A3
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZ9Fkwl__wOa for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 14:01:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8DB8781509
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=gSE/skv1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DB8781509
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 14:01:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=gSE/skv1wWoVxrK1KF/mG4P7yHE9LiDEeOHsTJrL54P5DolodAFk2SPK0Q5jv4R0oj0Xm1bm8hBr3se7KQntSvF43kMme8gVmg2bV3RvrUbyBb5y+ulDADNZ0BxB+nKjMliodd7ZfMnbBwWPckAFtLriCwQI3uS7q5eZzVZ9exCR91U1aZIcsPrr3zomyLiEF5TpZ8HQKXoOEQwBEZpxAWz5ZCetTRsm68v7OstwqYsy4sKT5quoDPMuy09rfELdBMNXIiM/eYhOs22vwsXhnlqpmTGKov/ukWnnOQwo2ZuCHYsxKu7Yw0Jph59/ngmAz0OfH1UkhSULtB53GCzKtg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=mK9PupSow16K2W4P23eJpkmXLRUv+hm402Dc2lqJqsk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 220899069; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Nov 2026 14:00:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSEJE-00000006E20-1ize;
 Sat, 14 Nov 2026 15:00:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261113092630.1245957-1-sebastian.michel@oss.othermo.de>
 (Sebastian Michel's message of "Fri, 13 Nov 2026 10:26:29 +0100")
References: <20261113092630.1245957-1-sebastian.michel@oss.othermo.de>
Date: Sat, 14 Nov 2026 15:00:48 +0100
Message-ID: <87bj7r8qcv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wireguard-tools: switch to
 git-based source download
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pj4+Pj4gIlNlYmFzdGlhbiIgPT0gU2ViYXN0aWFuIE1pY2hlbCA8c2ViYXN0aWFuLm1pY2hlbEBv
c3Mub3RoZXJtby5kZT4gd3JpdGVzOgoKID4gVXBzdHJlYW0gd2lyZWd1YXJkLXRvb2xzIGhhcyBy
ZXBsYWNlZCBwdWJsaXNoZWQgcmVsZWFzZQogPiB0YXJiYWxscyBpbiB0aGUgcGFzdCwgY2F1c2lu
ZyBCdWlsZHJvb3QncyBoYXNoIHZhbGlkYXRpb24gdG8gZmFpbAogPiBkZXNwaXRlIHRoZSB2ZXJz
aW9uIGJlaW5nIHVuY2hhbmdlZC4KCkFoaCwgYXMgdGhlIGF1dGhvciBvZiBjZ2l0LCBKYXNvbiB3
b3VsZCBwcm9iYWJseSBsaWtlIHRvIGtub3cgYWJvdXQKdGhhdC4gRGlkIHlvdSBjb250YWN0IGhp
bT8KCkkganVzdCBkaWQgYSB0cnkgaGVyZToKCndnZXQgaHR0cHM6Ly9naXQuengyYzQuY29tL3dp
cmVndWFyZC10b29scy9zbmFwc2hvdC93aXJlZ3VhcmQtdG9vbHMtMS4wLjIwMjYwMjIzLnRhci54
egotLTIwMjYtMTEtMTQgMTQ6NTc6MjctLSAgaHR0cHM6Ly9naXQuengyYzQuY29tL3dpcmVndWFy
ZC10b29scy9zbmFwc2hvdC93aXJlZ3VhcmQtdG9vbHMtMS4wLjIwMjYwMjIzLnRhci54egpSZXNv
bHZpbmcgZ2l0Lnp4MmM0LmNvbSAoZ2l0Lnp4MmM0LmNvbSkuLi4gNDUuNzcuNjcuNjQsIDIwMDE6
MTlmMDo2YzAxOjE3NGE6OTI1YTo4ZmY6ZmU3ODo5ZWFlCkNvbm5lY3RpbmcgdG8gZ2l0Lnp4MmM0
LmNvbSAoZ2l0Lnp4MmM0LmNvbSl8NDUuNzcuNjcuNjR8OjQ0My4uLiBjb25uZWN0ZWQuCkhUVFAg
cmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiAyMDAgT0sKTGVuZ3RoOiB1bnNwZWNp
ZmllZCBbYXBwbGljYXRpb24veC14el0KU2F2aW5nIHRvOiDigJh3aXJlZ3VhcmQtdG9vbHMtMS4w
LjIwMjYwMjIzLnRhci54euKAmQoKd2lyZWd1YXJkLXRvb2xzLTEuMC4yMDI2MDIyMy50YSAgICAg
WyA8PT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBd
ICA5OC4xMksgIC0tLi1LQi9zICAgIGluIDAuMDZzCgoyMDI2LTExLTE0IDE0OjU3OjMzICgxLjY2
IE1CL3MpIC0g4oCYd2lyZWd1YXJkLXRvb2xzLTEuMC4yMDI2MDIyMy50YXIueHrigJkgc2F2ZWQg
WzEwMDQ3Ml0KCnNoYTI1NnN1bSB3aXJlZ3VhcmQtdG9vbHMtMS4wLjIwMjYwMjIzLnRhci54egph
ZjQ1OTgyN2I4MGJmZDMxYjgzYjA4MDc3ZjRiNTg0M2FjYjdkMThhZDlhMzNhMmVmNTMyZDMwOTBm
MjkxZmJmICB3aXJlZ3VhcmQtdG9vbHMtMS4wLjIwMjYwMjIzLnRhci54egoKV2hpY2ggbWF0Y2hl
cyB3aGF0IHdlIGhhdmUgaW4gdGhlIC5oYXNoIGZpbGU/CgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
