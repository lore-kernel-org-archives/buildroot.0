Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AED606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z5xUVQJx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A795607A0;
	Fri, 30 Oct 2026 14:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7QPKhxDlrdx; Fri, 30 Oct 2026 14:06:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD716607AC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369180;
	b=FZDou1EPiMqtZJZhM6FQ5J2yk1Z/TsGKkNEzJyhyE+FBJvR/QwsfXgw78Uc3WQJib4PA
	 9Nq+LKhZfX8JHKuj1KSWwv6vHyZrBJ7Trkmd900s5Ky3+4GyMuQ5K3bicxR+bEBTTE9t8
	 av9TXumMq38X7SrCiGCNs0zDernf3ByZk2Mfo9TLYr0MFd1dzNWJok+N03nzWh2V0BbHJ
	 runobwQZp3IQPJLSWQ9+P1Cnk1sTtr+PPk9J+Nxr2s4uNR1sY9TxV1pPq1PmlHeYWs4fx
	 XutIE9rxAXbfDKPpRD3eG4FdRqwaceBRWpNk71uypMATGsm/MrrHUuFbrC/JlQH9obA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369180;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Yfkz8+9Zn43SCNm1SxOunekY921YC4dNgtdRuFYs3Uw=;
	b=KbpQ9UjPN77UrNoTWHwEOgJcq7yNEsdE7x8lVusS2/tDIwU1IOwFe2h8r3GDnQVdQgQu
	 +QwWRM4TaUW5j5ovRWMA8ZeOlgbvAUHjLR83jLyJ19G+LKriV3vbwq8hkWePjb2xHSkZe
	 ewG3HBrPkS5ZB1krNrOwNIwf0aKUGEPp3FWt3Z/voqcADPrctSpA5yWsELhWgtuKSHKC0
	 Y4siGHD+lDUduNV7d6GOTSPMvCzBz/G52xQ3XL4eZ1r7ogFSztm5DOAvIpehaCHYwaGS2
	 1EVDITemxDOeI6qx4KNn+4gJ+W1nkColaFyiBXVHpsuizaR9sSsHk3vruY6qx9Ulj8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369180;
	bh=Yfkz8+9Zn43SCNm1SxOunekY921YC4dNgtdRuFYs3Uw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z5xUVQJxY4zrhRRbsonBpMrBaXAvyaOCrHBNRnfN52qVUo5ms6bjQb14l9cm/aKQP
	 bwjg9znc6R2Knb/XEiQzkzzktubNaUiMnqS2Xp3SzcIAWTNjpW4lPUA2ESSLcyiGxx
	 sBwTH43h351d+36fp2t7bpRd2C/YnVuXNUizpaIV/7bWP4y0lJkX++yEQjPrknaINH
	 IRNt9HnyL9iPTHYOVsdOsokqIV9Y5KbscNB3xeGuSaqMacCYu4ymIXG2feHH8b78Vf
	 Ot1nTDGwUfEGeTzKOCDBu35SAfQhs9JyzVLE4XPO8kb338Kxl1QhWXu2w4QoU4pYu7
	 kkpesedzjHniQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD716607AC;
	Fri, 30 Oct 2026 14:06:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92253362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75DA8400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MV4IBCtY27s for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8B37C40530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=c6yhk82E1lL7dT2OH9wxP4S/Le/GptuQujDO95EH4v6QPUwz/aSM2ob1Ds2aLO8LsEc/
 tZjyr4C4ZjURgtrXB2078P9avkiDZNRIySyFQ+2yy/izUBnFZrnM3GGlZVkabWXSrBdPd
 8+MQG1ysfwmq7gjSY3LwyHzOr2HFGgcm/0CnByAEELhGk7Ahktdcq93c1b/ytFIZorEE/
 Yqo12V3RGM4gthhWtUszg+YkWPkhr9rUCbkpzGWBKaOfiO9H3S1HGgaoMSAP2E+MNkMXE
 cCcsx2fZGOOjRwsaSHnsIvfRiROIVdSjXjDmlJ2rfYKOFddYpJTypga3Mr7YuYsuO5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F1nU3mpye3SAGDjbSp5V5Kwv1cBkkHUAiFwRZIYC05g=;
 b=nLVV0bwhfzyBTXwX1ZqV4s8b24pGiZ4n1/bSSpBPmIiU4nEcUmTnLHnSp0eQbY5UFmoa
 iXwQB31bY2wKFXFunq9xOsaEn6Yqd+LxuhMMTNrll+H4hNCB9kqEmM7F+0oe57mE+Kziv
 yhjp7GoGj5hHOaWoxVCv9swO7jYYaVgX6PLFLScyI9FJpuHGeFiSU9SbqdXo0vDNmApXb
 KzVeC8xN1zdC7Hp/xd9nuDTUinNxMu58nA4e+7SBzviTDc6MCxhGqTOIiwS9T657YwrlQ
 MQZPjkMN+TwasENqNEVzzEeXtWaIyGNuq6usXyUq3LXb12yW5X6vII4SKvCPfuv727g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B37C40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EC6D9D389; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7fb8c76c155caa489f39ab5e7154512a4406579c
X-Git-Newrev: e33bd0d2f2a2a39a266a453db330a78476016c62
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.9EC6D9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: security bump
 to version 1.27.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2791158366993334716=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2791158366993334716==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e33bd0d2f2a2a39a266a453db330a78476016c62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://go.dev/doc/devel/release#go1.27.3
https://groups.google.com/g/golang-announce/c/66pojueaQek/m/tmWX2Pq9AgAJ

Fixes CVE-2026-111943.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4e0cd646932be3631f87f37ee08e5d6c09e2565f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6a4b03ad35..828f809395 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
-sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
-sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
-sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
-sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
-sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
-sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
+sha256  6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb  go1.27.3.src.tar.gz
+sha256  cfc243057c03dd131413b91269d16b5061f87f312059c1ed78681cbb95d6afbf  go1.27.3.linux-386.tar.gz
+sha256  65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40  go1.27.3.linux-amd64.tar.gz
+sha256  a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49  go1.27.3.linux-arm64.tar.gz
+sha256  d6f4e11dd7157030d7ac11c51c8f73201a2db932d593c3106b1da11cc32bfdf8  go1.27.3.linux-armv6l.tar.gz
+sha256  f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5  go1.27.3.linux-ppc64le.tar.gz
+sha256  62e109a6280a073c9025e1b51ea298ec1d3575d3ce62238721311f5ff2c854e6  go1.27.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index df6f0049bf..88b4163ce1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.2
+GO_VERSION = 1.27.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache

--===============2791158366993334716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2791158366993334716==--
