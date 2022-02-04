Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D22C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2241F60E5F;
	Fri,  4 Feb 2022 15:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pilx5vy3ds7z; Fri,  4 Feb 2022 15:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67BCB60E5C;
	Fri,  4 Feb 2022 15:37:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 561641BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 451D5832B3
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-X_ri2zEvVZ for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:37:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E21C8329A
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989037;
 bh=J7J+E6N3+zl7qC9eSzgO68XdIRljoT3r8ndQiyKKOzo=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=DATwIWNjI+IVO6rwdQHIZsXvO0CitFEGJJ/zfAVoovuO87X9ilfjzypmDuF74Pm25
 8aWEd1WIG4tmhfHRVq5xduMvnbT4X2aI0jdVraDntO55oKME4KurKfGtlsAEZodM6a
 J+2U78Wx7J1UxqumT7jfJFwFunR+J/aAP8B7Wipg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MNbox-1ms1sl3HD9-00P7qG for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:37:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:37:15 +0100
Message-Id: <20220204153715.15481-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:JcP1eP0hJjYjgDfZmA7QbJ8KbbtzDT44BcatznqmH8CSjz9Nlvy
 dIFysY7W01sl2tzEBfBj1BWgj8w6o6XED7tv7TvhmzuCaFxPB66Izh2e5yO3H3C5Mb1hSt3
 M+LCF19SrJbXSMp5spg6LjdQU6EqaLIu4QlrygD5mG69oWJPENfqe60JHdlIeD5+vxppbA+
 US2kCD6pbF99g5SGSCZlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fl/YBGTQbNo=:42q8ON4Rii0/quZLX3/3cW
 7XV/3CGYgMjTmfcYQsiTXN/aWXQ9LVkFBhUsf5gdu6/AdCZe5QsZfeNJUtLGiK66J9L+IDmw8
 LW1iuG3n6dAQmGU86DNaJClldF4H2SUh2hzaHM6YRZb/n3N9rHDDZ4rjvZt9bwzrOXrl3uEhK
 d57rXN7sWtr3u3KvDhLuJDCd7+Nd9/eXrPco9V8XSrOEWVVHLfqhCHuCX9QtJADDja1sL/hM4
 HRzMTg00hr0DLCxbW+QArOUqhDEUdCuO5/mGA/m8zznrZovusmIk3tgwBhS8394rUlw/BDcKM
 LpIzU8erkIv2NDsr5j9v4wh4QfPHHXkR5+7qSI0avVrUO1cQPweZvm3zMM/w1r9xYrydKBhYf
 b4oKsJ6ogEzOJlr/XR4PuBF5xLhkVilmZ9cb7AB2Q0eEa074RLIJLRQz2glL/Og8+L/sQg9Ax
 Z5GxWT9OOOeQ9CjWA70AgbLucYOoDfQhSgw/FF6YEYtoulxGkQ7TuADiMQPeQDe5u/vW143cK
 Fs1hkwr5y28cnxX7ya4QovOfS1Vc7bSEGARmpKKgX3k5KEk7ZNAp6Od5to/rFxnS3ctcRCqL7
 4EFHLD0HzGCAlnG/Z5+yIwqsdhgAGADfJo1JRDKizcqiu4ZtxazEr06hqc0+dRizNT4ZlG/rf
 1psSDB9kVU6mcelg6O2bWfafecJXgeyepC+asb35x6I+22kAtEmpxS4C4sYj3vlxq6nwc77fJ
 licYyWRvJ2tCX9tLwNt8wPCImawobH35D3ndKUqtSRlUXH1eZt3oAQbxmo7iXhmfJ0pAejDXL
 gvaCdPshAf6K21432FHWX429gh9puNQ+QJZaLKQRkXoluaWmmAQ4P0T3aiD56HmL777dMssKh
 eBu98jfiKarNoSc7jsHEPNhqP5zT4eivKoGF60h4qheQljVDuH0bYm0j8MpNomkAm3CfBdqHp
 m3mgIrIJdgoRJm95tpfWPyOu8TZK8tFwqwgKz8KFURmoLO4kzK09ReDr9ygPXV73GbE46LXPN
 TenOb+R9JeGb7QLf9FU9fIKlu/Ipkb/roVUXYbN6jjt/DSaO2LAlKZnHy/dFkCjIzmgk/NLyW
 +7uAT1t+ff8vIM=
Subject: [Buildroot] [PATCH v1] package/findutils: bump version to 4.9.0
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

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00003.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/findutils/findutils.hash | 2 +-
 package/findutils/findutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index 26dbe59181..0284c0e7b2 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164  findutils-4.8.0.tar.xz
+sha256  a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe  findutils-4.9.0.tar.xz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 3237e5502a..9731a35047 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.8.0
+FINDUTILS_VERSION = 4.9.0
 FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
