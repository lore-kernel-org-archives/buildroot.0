Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE2BC678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 09:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E5D61035;
	Tue,  7 Mar 2023 09:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E5D61035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_n45Pofl0zi; Tue,  7 Mar 2023 09:35:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3394C60BF0;
	Tue,  7 Mar 2023 09:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3394C60BF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8531BF255
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3623560BF0
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3623560BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo7h5qbAA_pR for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 09:35:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 901D760797
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 901D760797
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 09:35:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,240,1673884800"; d="scan'208";a="223280789"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2023 17:35:14 +0800
IronPort-SDR: ndsIkxVRgNVm0R3fteiSiK4cMagiHqqwBU+91uZRRHjXfl5zv8rhVuuklS8pE7fEpBPFZwx2vC
 O88uBXTQfoIY7asAD/FTfPG5ZjDSYVWZy+1qSRy9vnc5XPER40OQ6ah8EjgHXZB+8wh4q8JSh3
 MWGsRyRfAf8KpvjcnumvtLS8+wshfNkMfuPd+36BYiv7uOO3j2j7Hg6a8qJ40a58Z+hB5sclxL
 1Lo8Yl2wmZPU7FXqAqhniVj5qpV34oscbDk7zQhkFvh9EyDS3PhvAxB51x0QxeAhQ/jGu40015
 SaU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Mar 2023 00:46:12 -0800
IronPort-SDR: P58gClN8y30kUPElix/qI4lG2H/9jSZJiEdMM960wiFtvXfFqHn98sbLx6yMPeG5YojCtE03BF
 w791TSX6rLTDYihDP7MEnIyJQNXJyARBsitqGUF5jVZlt7YwiCugJ8KClpoQfG27LAmphEGr9r
 f+lnTIVTrGHY5SRFe74h+w9ZRClqcq442gtweGBqzfwj0rj1ux71Xu/oGsO5vzTaOyTubr71Y9
 KnwIN7tVMV/DGB9+iE9/ve7fr93PI7oG6zuGQgepwwnOtKMrSWJX/l80azKttdB7cd/YMXFxWg
 7lI=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.41])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Mar 2023 01:35:13 -0800
To: buildroot@buildroot.org
Date: Tue,  7 Mar 2023 10:35:01 +0100
Message-Id: <20230307093504.3611941-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678181717; x=1709717717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w+kkNGHqWBGvnGr0fgpHcjnl/NAOg/o22NBbsLPYmKw=;
 b=DRVWQTxO09CJyVwe9FGcfcpjjseEyZQLaudnp8jgv5n2FcftFb5hhErw
 dT7Fm9RZGIX/JF0mFEuYBthO63jSUgwwenk9A2mYM3fRbruqPbgic2Okf
 E6zDptrgxktgGjpS9RuqBkARcIrmECbXcQju16Aa2s8Mwq5RtWMH8lFhO
 B0MW8otUp3/Ry/RbXyZxt9JW+NBNXrJ9WdwTz6qp1HGU8waqsZ5NKS++Z
 A95s/Cv7cJOnD5A3X/Ud8lq7ooNj4DKdhgQmBwDGevCxqOyF9Ti4Q6jX0
 iRVv1jUIq1J51oNm7BECarOTngNnM73eNQo+gIDn4vG1MFWkADyilhBqW
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=DRVWQTxO
Subject: [Buildroot] [PATCH v3 0/3] misc aarch64-sbsa cleanups
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpIZXJlIGNvbWUgc29tZSBzbWFsbCBhYXJjaDY0LXNic2EgY2xlYW51cHMuClBsZWFz
ZSBjb25zaWRlciBmb3IgaW5jbHVzaW9uLgoKQ2hhbmdlcyBzaW5jZSB2MjoKLUtlZXAgdGhlIGtl
cm5lbCBjb25maWcgb25seSB1c2VkIGJ5IHRlc3RfZWRrMi5weSwgYnV0IG1vdmUgaXQgdG8gYSBu
ZXcKIHN1YmRpcmVjdG9yeSB0byBtYWtlIGl0IG1vdmUgb2J2aW91cyB0aGF0IGl0IGlzIG9ubHkg
dXNlZCBieSB0ZXN0X2Vkay5weS4KClRoYW5rcyBhIGxvdCB0byBWaW5jZW50IFN0ZWhsw6kgZm9y
IHRlc3RpbmcgdGhlIHByZXZpb3VzIHZlcnNpb25zIGluIGdpdGxhYiBDSS4KCgpLaW5kIHJlZ2Fy
ZHMsCk5pa2xhcwoKTmlrbGFzIENhc3NlbCAoMyk6CiAgYm9hcmQvcWVtdS9hYXJjaDY0LXNic2E6
IHVzZSBQQVJUTEFCRUwgdG8gc3BlY2lmeSByb290CiAgYm9hcmQvcWVtdS9hYXJjaDY0LXNic2E6
IHVzZSB0aGUgZGVmYXVsdCBjb25zb2xlIHNwZWNpZmllZCBieSBBQ1BJCiAgc3VwcG9ydC90ZXN0
aW5nOiBtb3ZlIHRoZSBrZXJuZWwgY29uZmlnIG9ubHkgdXNlZCBieSB0ZXN0X2VkazIucHkKCiBi
b2FyZC9xZW11L2FhcmNoNjQtc2JzYS9ncnViLmNmZyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIucHkgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vdGVzdGluZy90ZXN0cy9ib290L3Rlc3Rf
ZWRrMn0vbGludXguY29uZmlnICAgICAgICAgICAgICAgICAgfCAwCiAzIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSB7Ym9hcmQvcWVtdS9hYXJj
aDY0LXNic2EgPT4gc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyfS9saW51eC5j
b25maWcgKDEwMCUpCgotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
