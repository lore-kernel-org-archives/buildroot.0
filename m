Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF715C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D6E24022B;
	Fri,  9 Aug 2024 11:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjRFwvjU6RdX; Fri,  9 Aug 2024 11:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D4C34049C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D4C34049C;
	Fri,  9 Aug 2024 11:42:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11BFC1BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0050660AD5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBlEO_avPO-g for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3181F608F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3181F608F7
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:42:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C6C284DD4; Fri,  9 Aug 2024 11:42:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 13:38:49 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 3cf303f91666207a5a259866e6ecc05b21afae05
X-Git-Newrev: c4f8ae4a1a6bed2b1abfb2b7148ee95c3013b713
X-Patchwork-Hint: ignore
Message-Id: <20240809114238.2C6C284DD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/octave: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4f8ae4a1a6bed2b1abfb2b7148ee95c3013b713
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
index 42227045f6..5ed5ed8d2d 100644
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
