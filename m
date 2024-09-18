Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C9ECDD548
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FAC6411B6;
	Wed, 18 Sep 2024 16:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWz3q0g1Zdob; Wed, 18 Sep 2024 16:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5399411B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5399411B8;
	Wed, 18 Sep 2024 16:50:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 196FB1BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 084FF40D47
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXdJxb3IVSWF for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB9F4188A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAB9F4188A
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5263181019; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:48:41 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4fd3639ea3b062b2ee2ba4408128f04abe8e4abb
X-Git-Newrev: a733300f8f52f9b54b4fc2d896744fec5a50ff4f
X-Patchwork-Hint: ignore
Message-Id: <20240918165043.5263181019@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/sofia-sip: fix
 build with gcc 14.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=a733300f8f52f9b54b4fc2d896744fec5a50ff4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit d3f47c2486069fa6ee843f39a790d9bbde5de6f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-incompatible-pointer-type-in-sip_basic-c.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch b/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch
new file mode 100644
index 0000000000..7f890fd27b
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch
@@ -0,0 +1,27 @@
+From 46b02f0655af0a9594e805f09a8ee99278f84777 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tomi=20L=C3=A4hteenm=C3=A4ki?= <lihis@lihis.net>
+Date: Mon, 19 Feb 2024 09:06:20 +0200
+Subject: [PATCH] Fix incompatible pointer type in sip_basic.c
+
+Closes #248
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/249
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/sip/sip_basic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsofia-sip-ua/sip/sip_basic.c b/libsofia-sip-ua/sip/sip_basic.c
+index 3444fb25..82e824e3 100644
+--- a/libsofia-sip-ua/sip/sip_basic.c
++++ b/libsofia-sip-ua/sip/sip_basic.c
+@@ -2901,7 +2901,7 @@ issize_t sip_identity_d(su_home_t *home, sip_header_t *h, char *s, isize_t slen)
+       ext = strchr(ppt, ';');
+ 
+       if (ext) {
+-          msg_param_t *params = su_alloc(home, sizeof(msg_param_t));
++          msg_param_t const *params = su_alloc(home, sizeof(msg_param_t));
+           if (msg_params_d(home, &ext, &params) >= 0) {
+               id->id_info_params = params;
+           }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
