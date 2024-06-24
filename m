Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D5CC2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC0A2811EF;
	Mon, 24 Jun 2024 06:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrSqdO8hiPG5; Mon, 24 Jun 2024 06:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 750B281799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 750B281799;
	Mon, 24 Jun 2024 06:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6670E1BF951
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54666811EF
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDuxZ0TCji42 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA9F4810F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA9F4810F6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA9F4810F6
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:50:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1shF7V2xn4-00aSFy; Mon, 24
 Jun 2024 08:50:51 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:50:51 +0200
Message-ID: <20240624065051.14499-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:gbQ+xjfUvGjow1vjp6MKos++KSJAoBav4X6KNtxoh6/dZNQH95G
 r0VGPm8sOHcSQ2n5omDtdx6ND5hBQE3rGSqaSi03MwjVDmyPiHJvcX5DKI/v4iW5jMGlZyA
 aupmlSZVXjapGXiNqlwTHsnLWgbBX7Ij8fhbzXcqmY37O6pASS6WYhIq6LUFIC990pgt/Xx
 RH0FjMP9FED6Z5EDWZceQ==
UI-OutboundReport: notjunk:1;M01:P0:QEIwijS/l9g=;CHiwxxljjCcPg2rOuYJI2AlNFMN
 WANGiafqJ0QpzfkoqLYKcn/1kLHST9v3fg9Yfqto7Pd7/tAmYLnaHmuwQqVSQRCasHxsh5QQ6
 x+6Ssf5xfSZqQACnRupizRF7EFgLCaoGZeMD0/go2Zo+uEzA/aEdLbYhWE8ls07Wab3AGTVw8
 Wgvm4TjQtXfNsDheBLJy5BLjTwFjL5PyH43qG4K+XK2SNJ3JJV455KXY5NWH34ANnEvytxuX5
 kt8CgEYOKdmilLpU99htlVRAhdJrI0Tbal+bXtuwXwi4fTjjszw8pJWT6HRguMEr2FuVi+926
 kXCtQL0YF67mfVtADSSS1Q6tPig2io3oKTd6E8I4N/gc3F10939sI5P/Lbv8gFZvv70S5LeOO
 5klSd/7yBL1KR1iUzHzgx3L0MZkSe4kyowCO3FoZo2M4W7C8PBOaa03aOYFX2M2ir5s74JILx
 Rjj9I96z9X7TuA9Cy0ouM0H47aKS4jVy4Y0U3yfSPMIgy573VCpHJtmmL7zsJ1aAOUgEN884U
 R36TR2i9yGCMc6xhee32Reyi2/NJbwtfwFJdrtiYsEm6wwqcIFCrWIZHlI0ZymNOMYSpLGokJ
 b7Ay4K/pQPjb5FAkSFhfSBU4BXYF3Gu1XdX59mOWMW0kCfiqBH1UpPlvafkFmflA3eTbWhIFv
 jd6AU8I/A3WHKkoYtfDOYnxi88IN8tCRH0SQuprA+1IrbqK0JM9JpVn0QidERtVtY/sYcElup
 FW77F3PiCx7ne2hdmQ2lTwCkFP783Rq2Ds8HilG6SuY/xeED99jpH8RAi9KpfTSrXvnmnOC6M
 CsSEIn7GgiiWM1GZWj3WFk7njS4ggUGfYzr/8wa8r4C0U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719211851; x=1719816651; i=ps.report@gmx.net;
 bh=gNfDzUl4DtH9OINzClAbpngZnqQSnvgbU3V7gztdsU8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dRAiQNUI3dLjUF+YvyafSW96d8hV4Au2GbNz2ViZu1o+69jbtL8Rv36ejSvvyVLK
 oF1e94GcHyUWpcaj7ns32Vdh+NhBo+Enqt75Kc76ott0oaRCdqeeCGmf3+IBRL5c1
 bEjs+T2+dTeM6w7MDUgVdi1nnwOAS4dsKRkFKVKhRTVkkSW4HfHZ/tat9AGlfA2A+
 1pODBRkKR2d+Zhs6bzg9rs0JWyp4DKiUavEL/ZPDv5KLPe60F9JDb2GR+/TFY46tr
 pCbua7PPXz+hXqzJ+PLTGdfSUAMaIOhhhukG3xQmEgraWkTo+Lrz0VGXBDyK2MfbG
 s61m6B/nZrrm1EVynQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dRAiQNUI
Subject: [Buildroot] [PATCH v1] package/dcron: switch site and bump version
 to 1f53001
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- switch site to https://github.com/ptchinster/dcron (as advised by
  latest commit [1] on legacy site) and update home page URL accordingly

- bump version to 1f53001 (one commit behind latest v4.6 tag to gain
  latest fix [2])

- remove 0001-main.c-add-newline-to-logfile-openning-error-message.patch
  (upstream applied [3])

- remove 0002-system-crontab.patch
  (upstream applied [4])

[1] https://github.com/ptchinster/dcron
[2] https://github.com/ptchinster/dcron/commit/1f53001f2e8d1064287c97ec41498b614acab67b
[3] https://github.com/ptchinster/dcron/commit/0579cd042dbe710f5faaf61b33710bd84b0b85c7
[4] https://github.com/ptchinster/dcron/commit/a13330c139942ec93444e0229b540b8447bfba70

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ne-to-logfile-openning-error-message.patch | 27 ------------------
 package/dcron/0002-system-crontab.patch       | 28 -------------------
 package/dcron/Config.in                       |  2 +-
 package/dcron/dcron.hash                      |  2 +-
 package/dcron/dcron.mk                        |  4 +--
 5 files changed, 4 insertions(+), 59 deletions(-)
 delete mode 100644 package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
 delete mode 100644 package/dcron/0002-system-crontab.patch

diff --git a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
deleted file mode 100644
index 6abc3105e4..0000000000
--- a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2710bc67cd920323da9b23a3d60193577bd43d71 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Sat, 20 Jul 2019 00:27:31 -0300
-Subject: [PATCH] main.c: add newline to logfile openning error message
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
-[Upstream status: https://github.com/dubiousjim/dcron/pull/22]
----
- main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/main.c b/main.c
-index 0eba280..2606db8 100644
---- a/main.c
-+++ b/main.c
-@@ -261,7 +261,7 @@ main(int ac, char **av)
- 				dup2(fd, 2);
- 			} else {
- 				int n = errno;
--				fdprintf(2, "failed to open logfile '%s', reason: %s", LogFile, strerror(n));
-+				fdprintf(2, "failed to open logfile '%s', reason: %s\n", LogFile, strerror(n));
- 				exit(n);
- 			}
- 		}
--- 
-2.18.1
-
diff --git a/package/dcron/0002-system-crontab.patch b/package/dcron/0002-system-crontab.patch
deleted file mode 100644
index ac29368727..0000000000
--- a/package/dcron/0002-system-crontab.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1fd99b71b063b1573beaf9f6b801ec5be2fbe24f Mon Sep 17 00:00:00 2001
-From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
-Date: Fri, 2 Sep 2022 23:20:14 +0200
-Subject: [PATCH] Make @hourly, @daily, ... work again
-
-closes #15
-
-Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
-Upstream: https://github.com/dubiousjim/dcron/pull/35
----
- database.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/database.c b/database.c
-index 37cf17a..6ec720e 100644
---- a/database.c
-+++ b/database.c
-@@ -455,6 +455,8 @@ SynchronizeFile(const char *dpath, const char *fileName, const char *userName)
- 							line.cl_Days[j] = 1;
- 						for (j=0; j<12; ++j)
- 							line.cl_Mons[j] = 1;
-+						for (j=0; j<7; ++j)
-+							line.cl_Dow[j] = ALL_DOW;
- 					}
- 
- 					while (*ptr == ' ' || *ptr == '\t')
--- 
-2.35.1
diff --git a/package/dcron/Config.in b/package/dcron/Config.in
index d7f66bdb7d..b17d8e5d5c 100644
--- a/package/dcron/Config.in
+++ b/package/dcron/Config.in
@@ -20,4 +20,4 @@ config BR2_PACKAGE_DCRON
 	  group, while crontab executable is owned by root:crontab
 	  with sgid bit enabled.
 
-	  http://www.jimpryor.net/linux/dcron.html
+	  https://github.com/ptchinster/dcron
diff --git a/package/dcron/dcron.hash b/package/dcron/dcron.hash
index 35b02eb78b..5309cbd6b0 100644
--- a/package/dcron/dcron.hash
+++ b/package/dcron/dcron.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5a53930ba27b57c06c3b03635788cf569990283bde8ea9c1ee820e13f988288d  dcron-1ba33c3325df48de46263276a43ed76cf9d81518.tar.gz
+sha256  89b5842cf7fbfcafc12a8ce46ec7455d116c97626dc816e7e51bb98646473d18  dcron-1f53001f2e8d1064287c97ec41498b614acab67b.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  COPYING
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index f0c3efbf8f..9afcb9bbb0 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DCRON_VERSION = 1ba33c3325df48de46263276a43ed76cf9d81518
-DCRON_SITE = $(call github,dubiousjim,dcron,$(DCRON_VERSION))
+DCRON_VERSION = 1f53001f2e8d1064287c97ec41498b614acab67b
+DCRON_SITE = $(call github,ptchinster,dcron,$(DCRON_VERSION))
 DCRON_LICENSE = GPL-2.0+
 DCRON_LICENSE_FILES = COPYING
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
