Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB040CEFD01
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D3E60C09;
	Tue,  6 Jan 2026 20:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qi8QS-Bcl57X; Tue,  6 Jan 2026 20:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D92ED6062C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767731529;
	bh=GQsur9uv04iRSFUkpnWSLQLvs2pQZCjKO2XwVwxULeU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ev4+QQW1KLleRMQFibetz5i+k854rQWEZ70/cboS3qcTcPjk1e44oaKHucoV5IjoH
	 /stnr3ztBCcDEcFrkMAOp/09mQ3JANUP6aZ0oZyzzdUd8Dzjx2domGkQH41vl5cPk0
	 F8SM+VS/KSmDpzn/DZOEy8Us3VrDoIQ5IV6ts7PHqhUcq9woJFBr/unTeTsSgfbn9s
	 bg4d4u+U0148y1R0kG3e6MYV/OOKOuVPk0XXfR1ssXeOjW+W044ET2wnJT3WhJLyKk
	 +GE2Dpw8BfQSaCp12zcTPERWc9LHOhYVOTSk89Pvlm3DnDzA0V63+c1OX/ugOJ0Ofz
	 UzAf8OODNjjmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92ED6062C;
	Tue,  6 Jan 2026 20:32:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FF842A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3676560BEA
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ACYpLLJpY8Q for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3761D60631
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3761D60631
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26A23882F7; Tue,  6 Jan 2026 20:32:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 21:30:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb401b574ae03b41f9ee518f01d395acaec64dbd
X-Git-Newrev: e45ba467210b85ff2dc6406411cce178b03ee280
X-Patchwork-Hint: ignore
Message-Id: <20260106203207.26A23882F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 6.0.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e45ba467210b85ff2dc6406411cce178b03ee280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
http://www.gnuplot.info/ReleaseNotes_6_0_4.html

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index bac1cb9d2d..17211ab7dc 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/
-md5  c897ca69062010e2cf5f7483e39e5acc  gnuplot-6.0.3.tar.gz
-sha1  b31779d6760f432f57136600fc0c2bf65f4d4013  gnuplot-6.0.3.tar.gz
-sha256  ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab  gnuplot-6.0.3.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.4/
+md5  3a42b32f5d5a003bb88717fce350c3fd  gnuplot-6.0.4.tar.gz
+sha1  b199107483eaa70273d644f1cba259c19e64a178  gnuplot-6.0.4.tar.gz
+sha256  458d94769625e73d5f6232500f49cbadcb2b183380d43d2266a0f9701aeb9c5b  gnuplot-6.0.4.tar.gz
 # Locally computed
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index efdc08deae..487985c5a1 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.3
+GNUPLOT_VERSION = 6.0.4
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
