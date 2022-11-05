Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8428DC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3252981A9C;
	Sat,  5 Nov 2022 22:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3252981A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSOavJ7Vl-nP; Sat,  5 Nov 2022 22:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD64818DC;
	Sat,  5 Nov 2022 22:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD64818DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D82911BF86D
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4338404B5
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4338404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARxyb0OB_Nmi for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:35:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8617040153
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8617040153
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7326E87F48; Sat,  5 Nov 2022 22:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:35:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3391056553d29c545f9d4a6b742f230da4400328
X-Git-Newrev: 37648d90ca5420ab5199848ac20da0d95f7d09be
X-Patchwork-Hint: ignore
Message-Id: <20221105223529.7326E87F48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-xlib: drop
 useless SOURCE variable
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37648d90ca5420ab5199848ac20da0d95f7d09be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

package/python-xlib/python-xlib.mk:8: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlib/python-xlib.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 3ce1c5fdb0..32f16e5d66 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PYTHON_XLIB_VERSION = 0.32
-PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.gz
 PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/4d/cf/a29ecb43a5c84a65ffd726e3b28806f56b3bc5e796ddb533ff52af107dcf
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
