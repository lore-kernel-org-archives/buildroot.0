Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62720C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D03204091E;
	Mon, 21 Mar 2022 16:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mKtfgPmMw5E; Mon, 21 Mar 2022 16:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A14C40905;
	Mon, 21 Mar 2022 16:19:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98CF61BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9426240913
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVQdPsUL2vTw for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:18:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9746240283
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:18:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B12688492A; Mon, 21 Mar 2022 16:09:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:15:58 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 548921598db5fad0f517934c78048f0effcc1d35
X-Git-Newrev: 14a8b811e57bbc6b04cfd13b0ceef214d1414048
X-Patchwork-Hint: ignore
Message-Id: <20220321160948.B12688492A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wireplumber: fix
 introspection build
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

commit: https://git.buildroot.net/buildroot/commit/?id=14a8b811e57bbc6b04cfd13b0ceef214d1414048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

introspection needs host-doxygen and host-python-lxml since the addition
of the package in commit c9a3c10417aadce9ee4922e30235776409ce8eb3 and
https://gitlab.freedesktop.org/pipewire/wireplumber/-/commit/2e5b13f970fe3dd28a4ce75868d46403034c6822

../output-1/build/wireplumber-0.4.8/docs/meson.build:14:0: ERROR: python3 is missing modules: lxml

Doxygen is required to build just the bare minimal (not the full
documentation) since
https://gitlab.freedesktop.org/pipewire/wireplumber/-/commit/93c2e7d686ba678991185e711533ce29826b5374

Fixes:
 - http://autobuild.buildroot.org/results/24c524d86a3e2e67305f698644be9b15d4562488

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3e1de2ef067575ee33b55cfe02ffed09f7e3fe6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireplumber/wireplumber.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 2dab6042ea..37a8de5364 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -17,7 +17,7 @@ WIREPLUMBER_CONF_OPTS = \
 	-Dsystem-lua-version=
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-WIREPLUMBER_DEPENDENCIES += gobject-introspection
+WIREPLUMBER_DEPENDENCIES += host-doxygen host-python-lxml gobject-introspection
 WIREPLUMBER_CONF_OPTS += -Dintrospection=enabled
 else
 WIREPLUMBER_CONF_OPTS += -Dintrospection=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
