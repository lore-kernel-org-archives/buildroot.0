Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278CBC27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D5CD41803;
	Thu,  6 Jun 2024 19:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFdE_zfZ_rGg; Thu,  6 Jun 2024 19:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 986C54180B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 986C54180B;
	Thu,  6 Jun 2024 19:29:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64B691BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 515634046B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivOEUyH_PIQ2 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 589444042F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 589444042F
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ED6A87D72; Thu,  6 Jun 2024 19:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 21:26:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 671b8f4c57dee15a65110c2f64873fc4fe104f05
X-Git-Newrev: 311bb82c9e3a27f36639a1c93d8d5bc8e7eb034f
X-Patchwork-Hint: ignore
Message-Id: <20240606192953.3ED6A87D72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: fix libcurl build
 without C++
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=311bb82c9e3a27f36639a1c93d8d5bc8e7eb034f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following libcurl build failure without C++ raised since bump to
version 4.7.1 in commit 105f0398c76f3288b2668e0b3ec722b2ebe55a0b and
https://github.com/syslog-ng/syslog-ng/commit/86feed7bff068a48be477a5b702ca24abc441d70:

configure: error: C++ support is mandatory when the cloud-auth module is enabled.

Fixes: 105f0398c76f3288b2668e0b3ec722b2ebe55a0b
 - http://autobuild.buildroot.org/results/cf36fb119224ba50a768dbe363d4c381f76eb476

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/syslog-ng/syslog-ng.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 4f9a455e81..57ee46ce05 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -61,8 +61,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SYSLOG_NG_DEPENDENCIES += libcurl
-SYSLOG_NG_CONF_OPTS += --enable-http --enable-cloud-auth
+SYSLOG_NG_CONF_OPTS += --enable-http
 SYSLOG_NG_CONF_OPTS += --with-libcurl="$(STAGING_DIR)/usr"
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+SYSLOG_NG_CONF_OPTS += --enable-cloud-auth
+else
+SYSLOG_NG_CONF_OPTS += --disable-cloud-auth
+endif
 else
 SYSLOG_NG_CONF_OPTS += --disable-http --disable-cloud-auth
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
