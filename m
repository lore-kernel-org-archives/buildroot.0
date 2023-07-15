Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F4BEB64DC
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 10:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9415460B1A;
	Sat, 15 Jul 2023 10:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9415460B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYhFSYsg4n7J; Sat, 15 Jul 2023 10:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C86F860A99;
	Sat, 15 Jul 2023 10:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86F860A99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23D961BF301
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 10:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A53E60A99
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 10:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A53E60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WQMEe6drtFF for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 10:25:11 +0000 (UTC)
X-Greylist: delayed 00:07:25 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D42360A4F
Received: from zimbra.gangsto.cz (pyroxene.gangsto.org [78.46.142.91])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D42360A4F
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 10:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.gangsto.cz (Postfix) with ESMTP id 73B376A6A8
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 12:17:43 +0200 (CEST)
Received: from zimbra.gangsto.cz ([127.0.0.1])
 by localhost (zimbra.gangsto.cz [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BeJxy7rnNHYl for <buildroot@buildroot.org>;
 Sat, 15 Jul 2023 12:17:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.gangsto.cz (Postfix) with ESMTP id AEB8B6A6A7
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 12:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.gangsto.cz AEB8B6A6A7
X-Virus-Scanned: amavisd-new at gangsto.cz
Received: from zimbra.gangsto.cz ([127.0.0.1])
 by localhost (zimbra.gangsto.cz [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QblPr0MkHJM9 for <buildroot@buildroot.org>;
 Sat, 15 Jul 2023 12:17:40 +0200 (CEST)
Received: from audun-yoga.localnet (unknown [136.158.100.109])
 by zimbra.gangsto.cz (Postfix) with ESMTPSA id 1D4CB6B658
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 12:17:39 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 18:17:36 +0800
Message-ID: <14204500.ZvbfcPJBoq@audun-yoga>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=gangsto.org; 
 s=19307520-F6A0-11EC-9341-E84B7535AF77; t=1689416260;
 bh=D4KCdK7ZzMyhXEF6NvQ/woIRX4byqAR2nsRyNVGa2pw=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=bb4IALS/03i+0JFQb7brOlLH6WqPj8/mF0SEm1Aj805qBnPjH5MlmfN6PiX6yKebi
 VUSZJ4p/5s20RSGoXBMxEd8xA504CaMHDnGHOMcrpgtbu5nA31uYs8OK8RkErbcfm0
 pWFxpdVXpFecgV98kDjzbeFH5yEFuMHhr/MrFxrVgjaxp1N+6xuJbgKLgKrOSPb/1y
 qpMUDtdcTyX0XUJ6K9EGIGM7KB0uQp/oPMJ/5a63NAf+s9Ef6U+JGC22NCjlhsb3Wl
 agfz9RGB90tgdtWEmbYR/EnxOlmDLSw4+5dZLDI44IuU4KaKkFaK7dDJHjnnZTOBUm
 gUnsHtD/1WpGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gangsto.org header.i=@gangsto.org
 header.a=rsa-sha256 header.s=19307520-F6A0-11EC-9341-E84B7535AF77
 header.b=bb4IALS/
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: optionally include
 zfs graphdriver
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
From: =?utf-8?q?Audun-Marius_Gangst=C3=B8_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: Audun-Marius =?ISO-8859-1?Q?Gangst=F8?= <audun@gangsto.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Since zfs is in buildroot now, I thought it would be good to enable the =

graphdriver in docker-engine.

Thank you


Signed-off-by: Audun-Marius Gangst=F8 <audun@gangsto.org>
---
 package/docker-engine/docker-engine.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/
docker-engine.mk
index f904793a..0647a560 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -23,7 +23,7 @@ DOCKER_ENGINE_LDFLAGS =3D \
        -X $(DOCKER_ENGINE_GOMOD)/dockerversion.InitCommitID=3D"" \
        -X $(DOCKER_ENGINE_GOMOD)/dockerversion.Version=3D"$
(DOCKER_ENGINE_VERSION)"
 =

-DOCKER_ENGINE_TAGS =3D cgo exclude_graphdriver_zfs
+DOCKER_ENGINE_TAGS =3D cgo
 DOCKER_ENGINE_BUILD_TARGETS =3D cmd/dockerd cmd/docker-proxy
 =

 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
@@ -56,6 +56,12 @@ else
 DOCKER_ENGINE_TAGS +=3D exclude_graphdriver_vfs
 endif
 =

+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_ZFS),y)
+DOCKER_ENGINE_DEPENDENCIES +=3D zfs
+else
+DOCKER_ENGINE_TAGS +=3D exclude_graphdriver_zfs
+endif
+
 # create the go.mod file with language version go1.19
 # remove the conflicting vendor/modules.txt
 # https://github.com/moby/moby/issues/44618#issuecomment-1343565705



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
