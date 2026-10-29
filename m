Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD6606A31D
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mEdvZTxz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 048E260A79;
	Thu, 29 Oct 2026 20:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKAMN63_J2e3; Thu, 29 Oct 2026 20:23:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1642B60A78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305419;
	b=NfLRTt3ayFcuS4yZPUc37zDLaQZ/shKgqR8n0XSJXHFaR9WhMSzLfPYqS9/DcfvIPPv2
	 Pm+bky0ig8IT21e1KVjc5hB6hnITCblYrh28qqlNzOl+zPdGLyLUy8SC14qCxkWPVYTxM
	 nhDno1wGDHoeGtMLqwpu4tt2nqVQW0MgH5llfCHrTGzatS1gcjj3zKL9S4Njx5asO8gWs
	 kiGIk/AXnGqbE+9CaTcYBPYX/NiKYJG3tIIyOM4cQJEaiLSfb9BkxJExeZ4pjD68jFNl1
	 k+pa3ZKxTSU5pOxnFlpkMx9w5+aP6J3gSqcSqszdV5gD4PGrW7/1H/7IjDrTuJlMzRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4wyzVg5HQRj51sBvQ1Z6mziU07yb5/N9dCPWK8p/z98=;
	b=irrWHrANFZrV0hC0nu8ppgkuiZjU2m0qVQutjAAx+B9UaGqhz1ghEtLG7X4rkJPqid/M
	 sDZSwjEl8xHDMUitCKZlTv1FqeUg550UgVMtYfHhVtZnKdF4TvniM36Yh1ZRnPP8cC0Xx
	 MPpX36JPJYVlSOL3F4mbcDiPNzKtkUiQIDv0+wJJRjA2hZQeW06KE817iRSAvAY8s3w7m
	 rI6kwlNq+gLt2xvKVh7D8SNG97rJnPWVsfRM4kipPXXM3YRxCvNoEazqe9BC8g5G0TO+h
	 +ycUAYBisz+wbOLIELWTdZgkBcyGcQpPrInYcrWjRubh939d0sNJe6n8kYTjSU3uNJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305419;
	bh=4wyzVg5HQRj51sBvQ1Z6mziU07yb5/N9dCPWK8p/z98=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mEdvZTxzJwgh5DqCvy9cMRtiJRUMvYn04CjiSIE9nX2Jyp/ml646KPW9L8AqCNNLC
	 9sDMNvNjFLDD6qCRlqdU24Enh4tQSlMpc3T/5tjOpuRlKOwiG7fekCq5+k5pycRlTt
	 4JZ2jbYL26EWuXPVsBhQ64vtPZvkf4eO4L+TYpB1LTtqFmA4IkOAToB5pZ02/zsKAL
	 4gY3hvTpTyhclhJ7MX4h6k/X2jN2vSMx0OZ1CUTzd83GZsQpZ1sVx0igcFjltB8NQq
	 yhhyXARo81/x4MmPt7YN2aoQG+4pJpIJMcipK/55GWKKyP9RspT2AaUFbkRSfLFF46
	 GuBuGbKby5tow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1642B60A78;
	Thu, 29 Oct 2026 20:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DAE93A7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D69C40A67
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ON9Lzp_fttds for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 296BA40A5B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305401;
 b=K4648qSwlut21Ai5SVohSBWJRPzhVpeqjV8g/na/g0+ePPRgGnVNuFiOEjFfz0HHf+a5
 Dv+Eh3mqROVtPpZ7yBP5vWsvHYcRd+u82roP4J2rTPAev4/RUytdPrhNKvZ+LTAnUncwS
 x6WVLkibA44720OKVZEqQuy9ZR3SDfRiPpWDQQJqX/UOMviUrHBUTBk63jFRDG/Lfaj4x
 5KwigMXfAakMJykeLms+MqSCEMnCrWdcJsxauNSJgG98UcK9RPQCF4Szhy8GzmsxgKW4Z
 r8jo+bAK9Gsxn9T431f4/hyg0N5ra8fdJPklrSwd3q381OGuqal8M4KOWVUh5Wp0Dcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305401;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4MhC4+JYMiED5hjuJ3tF31GXNr2Afg5xI6DuFKT4D2Y=;
 b=K+1GpLS9JR7H6Juu+8yciQvpDBw24ujt3uXlO1B8PKfW0UUM5oOFyjv0b3BEgycgp+jz
 kA9USzxsn7ErGWAKe++mGi8W0Evq1QVhX+ic0d5q6kMIyspoW7zVx4ZWKQJ+dzcvhCEDn
 riIE3nNICf1s+8o26XdBDossRDAgepzwkJn6+FVK2OX5jyY5AX6+BycxRXLlYJ8RRaUG2
 e4l2nCdayvkuWkF5e9/l6wbzY3hRAeRjOBgaW4tuPf1cb7b0Q7MSbwr4fTtM2x2M6zspr
 L2y7ZEJcMlYHpMPMyv91adunYSMGqtVDZeBtDwDLTud69C0SdAEiUHCtPrC0JOENaxA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 296BA40A5B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94F269D2E2; Thu, 29 Oct 2026 20:21:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0eff71017c9dca10514f4a6096a30036e451f12
X-Git-Newrev: 1694e57fc9071ac614253ddd705179f26b5bfdd9
X-Patchwork-Hint: ignore
Message-Id: <20261029202153.94F269D2E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-waipu: bump version to
 22.10.2-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1694e57fc9071ac614253ddd705179f26b5bfdd9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replaced dependency rapidjson with nlohmann-json:
https://github.com/flubshi/pvr.waipu/commit/5d74289b7501625ab2d9098ac16af0f66b8b4b98

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-waipu/Config.in           | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-waipu/Config.in b/package/kodi-pvr-waipu/Config.in
index ee0cc2bdad..855e4ddc5f 100644
--- a/package/kodi-pvr-waipu/Config.in
+++ b/package/kodi-pvr-waipu/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_WAIPU
 	bool "kodi-pvr-waipu"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Waipu.tv PVR Plugin for Kodi
 
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 96cfeb940b..08a15e9f84 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80e4723a228b27447fe6e83c9e2aa4e9ebfc0d2a3618fbe0491b6d2440124b64  kodi-pvr-waipu-21.12.6-Omega.tar.gz
+sha256  dad83d50c2cc4584139a1e3b6def77c23ef800f69e5b4ccff70c54376e14476a  kodi-pvr-waipu-22.10.2-Piers.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 177c1236b1..5f86322f65 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.6-Omega
+KODI_PVR_WAIPU_VERSION = 22.10.2-Piers
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-KODI_PVR_WAIPU_DEPENDENCIES = kodi rapidjson
+KODI_PVR_WAIPU_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
