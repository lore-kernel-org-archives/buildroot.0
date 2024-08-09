Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E20EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A20441365;
	Fri,  9 Aug 2024 11:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snPduQp4Rr8s; Fri,  9 Aug 2024 11:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AE3241374
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE3241374;
	Fri,  9 Aug 2024 11:41:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54A501BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 422494049C
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuERaKuXZkqW for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AA140163
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33AA140163
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:41:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F0AB84D86; Fri,  9 Aug 2024 11:41:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 13:38:40 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ee8bc6384075c4d2097c7451d8a733b5c1415a36
X-Git-Newrev: c8eeb96df2d2a3e76537e88768d7fce4e1dfce6b
X-Patchwork-Hint: ignore
Message-Id: <20240809114120.1F0AB84D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/octave: add
 optional libsndfile support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c8eeb96df2d2a3e76537e88768d7fce4e1dfce6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

GNU Octave supports the --with-sndfile configure option since v4.0.0.

For reference, commit 40ea68b4b2 "package/octave: new package"
introduced the package at v7.1.0.

This commits adds this optional support.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a5ce48fe456d790612c9b63990f0a4f3e2faa554)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index e5b1b2607d..f050546709 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -43,6 +43,13 @@ else
 OCTAVE_CONF_OPTS += --without-curl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+OCTAVE_CONF_OPTS += --with-sndfile
+OCTAVE_DEPENDENCIES += libsndfile
+else
+OCTAVE_CONF_OPTS += --without-sndfile
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OCTAVE_CONF_OPTS += --with-openssl=yes
 OCTAVE_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
