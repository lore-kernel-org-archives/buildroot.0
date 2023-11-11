Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B290AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 11:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE2F61013;
	Sat, 11 Nov 2023 11:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE2F61013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEJUlr7eU7d1; Sat, 11 Nov 2023 11:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 811BA60DF0;
	Sat, 11 Nov 2023 11:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811BA60DF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 276231BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F39C560DF0
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39C560DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btuLdpUTgnYI for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 11:23:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2119060BE4
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 11:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2119060BE4
Received: from fli4l.lan.fli4l (p4fd6c5aa.dip0.t-ipconnect.de [79.214.197.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4E40A4C012C
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 12:23:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35722)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r1m5B-0001ru-22
 for buildroot@buildroot.org; Sat, 11 Nov 2023 12:23:21 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 12:23:21 +0100
Message-Id: <20231111112321.2663157-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699701801;
 bh=eMvUxSaiPesU4MH5w7EkVVG0+jaaj01KE0ArqiC0WLk=;
 h=From:To:Subject:Date:From;
 b=wOKHKaKTQvnMCu2N8v1LlFwOtW83Hfe4aBOmrNiMXscFFdarBLamCywV3FYkW9xRQ
 bXQrOMHcXP06zT6m33kU5mDqVekxKvN6I3yffFQfFdxENkY+KMGPK2WqLruEAA5XiX
 AFoRm77U6hgzcEqIGWTuWGnlF9CT0Ssy9B2M2yrepDazlo5gFkKYiIv+ktnwOCZL2w
 xFf2dP+ILrn38YpxTaLSZ37stZ5R+6wzgqZWXiK9eTPcnDKkuB1g/sAzjMTaRU04vq
 HowpfA98eNjfiSosBeUl546HcsWmJAnt6upOHYkETZ+5MM8G0ktj/BZgbJ9mPQz/8k
 Wdy3wglrEkY0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=wOKHKaKT
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.6.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-46849 & CVE-2023-46850.

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index b4fd3a9646..f4b39bfbc9 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  3b074f392818b31aa529b84f76e8b5e4ad03fca764924f46d906bceaaf421034  openvpn-2.6.6.tar.gz
+sha256  ee9877340b1d8de47eb5b52712c3366855fa6a4a1955bf950c68577bd2039913  openvpn-2.6.7.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 619a22c3b3..f8fc7e0744 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.6
+OPENVPN_VERSION = 2.6.7
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
