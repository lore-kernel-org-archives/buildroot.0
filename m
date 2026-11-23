Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23484606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hLIQbwzX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=a3Zleomm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A6480DA8;
	Mon, 23 Nov 2026 09:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwYY_8lGiDt3; Mon, 23 Nov 2026 09:35:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C02380D7F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795426550;
	b=qPIdpZNSieWBwQOSSdlyGPJ09PaQranOUawgJ7FVDQcaZdJYet+ATM80hRVgoIGl3Gt+
	 uFSDBCTGUC2hLniBo7764qA+bM75DkYYjy4IsyugCvTx3hqxVZVmY2uVXnB1Q+9u2syqr
	 FJz1ZFQ7NKx2RrejN9MRuILEayEBrQDngBgG/bCs5H5cN5NXmIZyvhlzz9uk/CKpWnELT
	 m0SIkgbPEE6oJPq3pYMJXbSAamsYiodSsZaidKJhiiyw6H5Akf1sTNJ6fuw6RYQHdEveb
	 KfwsozlTcl2LhIVMXiXsKcDJsewhyIeC516H8ndKvrCVz9cKVX7cjGX08hJ3+c13v1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795426550;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Patchwork-Hint:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kbdtxOXjopvyliGRJKHqZFpEnQezTvBeFiihGKbotYs=;
	b=nBfGsS6DAuFMlGawgBs6OpGXHZ8s2BUYjePTHrH10nlDhxRJFo5vIUoWscpJJv6NDOG/
	 uIfDN1ReTqvT3hnCyrjy7CpTYZ3OQ4N1BT5Zf9x0huXoqdcR+UXt+bc1bPNz+foXRoVoh
	 3f3+N/+zuabYPxKlNxDC1tXMwLN1pDqjyQLU8KwBNt6Dp+//m75s6D5JtoM0bNViDnmrU
	 I8ux0vAz/ynMFYgvJs/WkQY4XxHGrDSjPUsekYqOHyhDAZrmv/tf9jEbZNdCCMLBeW8G2
	 eGS5ZtPXcKVrWQIbDQ6563vameCrXN8U1J+A1zvLHSIztwNYEe0haG4a8x1BiQLK36w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795426550;
	bh=kbdtxOXjopvyliGRJKHqZFpEnQezTvBeFiihGKbotYs=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hLIQbwzXidi2qBeRBN/i6gOq5FfO50wX55H5+e2aE8phGEjaFjzc/4wOmUOtX9469
	 dldmtiLyn7v7kIX7cRA/XOF4ay5TYqLBnPXLXIeQyVoTdQDyICPs3B5CVCnvCWFLPF
	 BRTQ07oYpT8zYQtSKI8la0QudCpjYG6KqkjpM/+Mnfga/Z8spptoiDcIgY2kWju4LF
	 i0OgUaAwjx26pUKfWvm079ORU6yMBjcJtfB51ml3eeSkMWmjQbSEMnhDduw03EhYLV
	 xMEF5iFoKvJcJWU2D/MwlEWkdfJs6Se4tDGq8EY3kWbVgYOwRrP8qpWBC19Jxy7vRU
	 2WBjV588WAzmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C02380D7F;
	Mon, 23 Nov 2026 09:35:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 795251AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76DBC40567
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQCh8Qyns43W for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:35:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3911A40556
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.126.237
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=a3Zleomm
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3911A40556
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1795426548; x=1826962548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NfkVrTIuIjHip1dAOOc+R5iO2GVWQJ7gak7uoVymZG0=;
 b=a3ZleommCJB0ce8YPdd3vBeJiIYyTrEbfz4H0i7RvwpLQ9kdgoR1nZYA
 Jl2xR8tqkifoYRHYiBA0yejJxiJwbGGH6JQjph+sy/WqaMyNOrZVeVkwx
 tMOfp/rc/2DLfZyVX8rkAn8ayi4y69Df7hXAEQB2RUJDyPfGcvRcKBULz
 Ww2NNoF+Ry6WuQj0d+XMT6qQSTy/GblCibwG16IZsjZCeYtIutv07QUZz
 lFQMghk5kzwBAz5TvwNpQf5/hvuMUliEoOPCxmxnHKdfESCaREEC4FcZA
 2A35VMb6wMxV6keObxTNcvNkrRbRQjAuamyPNVHarHowqNxKzH13onhMr g==;
X-CSE-ConnectionGUID: 7M1fuAHRRuGDdKEIJYOKwA==
X-CSE-MsgGUID: LBFhB83eRxC/nm721vD+Jg==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Nov 2026 10:35:45 +0100
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:35:45 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56;
 Mon, 23 Nov 2026 10:35:43 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Nov 2026 10:35:43 +0100
X-CSE-ConnectionGUID: owKjiplbTJ+PJqeQWq2aDg==
X-CSE-MsgGUID: kYL3LsMpTZG5BnkMi8m4Ug==
X-IronPort-AV: E=Sophos;i="6.27,227,1787004000"; d="scan'208";a="497416216"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 23 Nov 2026 10:35:43 +0100
Message-ID: <cover.1795426541.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 0/4] packages: some version bumps in a few
 container-related packages
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CgpIZWxsbyBBbGwh
CgpUd28gc2VjdXJpdHkgYnVtcHMsIHR3byBub3JtYWwgYnVtcHMuIEFsdGhvdWdoIG9uZSBtYXkg
YXJndWUgdGhhdCBhbGwKYnVtcHMgYXJlIHNlY3VyaXR5IGJ1bXBzIG5vd2FkYXlzLi4gwq9cXyjj
g4QpXy/CrwoKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdCAzZWYzYmVjNmM0NWVhYjhjYTlkNDUzNGUyNTRlNDIwNGE3N2NmZjYzCgog
IHBhY2thZ2UvanE6IGlnbm9yZSBDVkUtMjAyNi00NDc3NyAoMjAyNi0xMS0yMiAxMzo0NjozNiAr
MDEwMCkKCgphcmUgYXZhaWxhYmxlIGFzIHBhdGNoZXMgaW4gdGhpcyBtYWlsIHNlcmllcywKCmZv
ciB5b3UgdG8gYXBwbHkgcGF0Y2hlcyB1cCB0byBlZGRhYzAyNWExZWY3MjMwYTYyNWYwYjBmODI1
OWRhN2IwNmNiZjZiCgogIHBhY2thZ2UvZG9ja2VyLWNyZWRlbnRpYWwtZ2NyOiBidW1wIHRvIHZl
cnNpb24gMi4yLjIgKDIwMjYtMTEtMjMgMTA6MzU6MjggKzAxMDApCgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpZYW5uIEUu
IE1PUklOICg0KToKICAgICAgcGFja2FnZS9kaXN0cmlidXRpb24tcmVnaXN0cnk6IHNlY3VyaXR5
IGJ1bXAgdG8gdmVyc2lvbiAzLjEuMgogICAgICBwYWNrYWdlL3Nrb3Blbzogc2VjdXJpdHkgYnVt
cCB0byB2ZXJzaW9uIDEuMjUuMgogICAgICBwYWNrYWdlL2FtYXpvbi1lY3ItY3JlZGVudGlhbC1o
ZWxwZXI6IGJ1bXAgdG8gdmVyc2lvbiAwLjEzLjAKICAgICAgcGFja2FnZS9kb2NrZXItY3JlZGVu
dGlhbC1nY3I6IGJ1bXAgdG8gdmVyc2lvbiAyLjIuMgoKIHBhY2thZ2UvYW1hem9uLWVjci1jcmVk
ZW50aWFsLWhlbHBlci9hbWF6b24tZWNyLWNyZWRlbnRpYWwtaGVscGVyLmhhc2ggfCAyICstCiBw
YWNrYWdlL2FtYXpvbi1lY3ItY3JlZGVudGlhbC1oZWxwZXIvYW1hem9uLWVjci1jcmVkZW50aWFs
LWhlbHBlci5tayAgIHwgMiArLQogcGFja2FnZS9kaXN0cmlidXRpb24tcmVnaXN0cnkvZGlzdHJp
YnV0aW9uLXJlZ2lzdHJ5Lmhhc2ggICAgICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvZGlzdHJp
YnV0aW9uLXJlZ2lzdHJ5L2Rpc3RyaWJ1dGlvbi1yZWdpc3RyeS5tayAgICAgICAgICAgICAgICAg
fCAyICstCiBwYWNrYWdlL2RvY2tlci1jcmVkZW50aWFsLWdjci9kb2NrZXItY3JlZGVudGlhbC1n
Y3IuaGFzaCAgICAgICAgICAgICAgIHwgMiArLQogcGFja2FnZS9kb2NrZXItY3JlZGVudGlhbC1n
Y3IvZG9ja2VyLWNyZWRlbnRpYWwtZ2NyLm1rICAgICAgICAgICAgICAgICB8IDIgKy0KIHBhY2th
Z2Uvc2tvcGVvL3Nrb3Blby5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCiBwYWNrYWdlL3Nrb3Blby9za29wZW8ubWsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgotLQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19fX19fX19fX19fCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLTogICAgICAgXyAgICA6LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwgQVNDSUkgUklC
Qk9OIHwKfCAgICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAgXy8gLSAvJyAg
IHwgXCAvIENBTVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0tLS0tLS0tLS0t
LS0tLTogKF8gICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9yaW4gKGF0KSBv
cmFuZ2UuY29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlMICAgIHwKJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19fXzotLS0tLS0t
LS0tLS0tLS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVu
aXIgZGVzIGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5l
IGRvaXZlbnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2Fu
cyBhdXRvcmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwg
dmV1aWxsZXogbGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNp
IHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50
IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25z
YWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4g
TWVyY2kuDQoNClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNv
bmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3Rl
ZCBieSBsYXc7DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVk
IHdpdGhvdXQgYXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwg
aW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2Fn
ZSBhbmQgaXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2Ug
aXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5n
ZWQgb3IgZmFsc2lmaWVkLg0KVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
