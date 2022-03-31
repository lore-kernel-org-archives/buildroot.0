Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46640C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DDD41D5C;
	Thu, 31 Mar 2022 06:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMsEmH06tgvy; Thu, 31 Mar 2022 06:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AB3341D58;
	Thu, 31 Mar 2022 06:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3D001BF321
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB8B940BFA
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sx39htVYkOVH for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C94640BF9
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A7F8886016; Thu, 31 Mar 2022 06:41:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 08:47:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0a5119afa0eceaf03493142d89b8bf2407f9b983
X-Git-Newrev: 6439b8dbe01b2a80f8cd7202277b8ccd822cc7e9
X-Patchwork-Hint: ignore
Message-Id: <20220331064151.A7F8886016@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jack2: explicitly
 {dis, en}able opus and readline
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

commit: https://git.buildroot.net/buildroot/commit/?id=6439b8dbe01b2a80f8cd7202277b8ccd822cc7e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Explicitly disable or enable opus and readline which have been added by
commits 055cf588427b40533da74d16df1830e483c5618e and
f658b1934f91e8c416fd7519c9f7e3ab86dca076

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 618a23100fe5ff54b90ada1a8f23453f6c5a77dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/jack2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 127c99eed1..6939aac9a6 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -21,10 +21,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
+JACK2_CONF_OPTS += --opus=yes
+else
+JACK2_CONF_OPTS += --opus=no
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 JACK2_DEPENDENCIES += readline
+JACK2_CONF_OPTS += --readline=yes
+else
+JACK2_CONF_OPTS += --readline=no
 endif
 
 ifeq ($(BR2_PACKAGE_JACK2_LEGACY),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
