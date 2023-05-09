Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28BCC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33A5142B67;
	Tue,  9 May 2023 20:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33A5142B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjP_tiUAGa0G; Tue,  9 May 2023 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC37404A1;
	Tue,  9 May 2023 20:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC37404A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADB721BF20B
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E7784290E
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7784290E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WhiPyC9bm5Sk for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:59:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98C7042013
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98C7042013
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83769862C4; Tue,  9 May 2023 20:59:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 22:02:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f228f98f8a0e30829eb43b7c963efd511c2bc43e
X-Git-Newrev: 03bb1a514652f6c3db51ab92683b5161a08f8ab4
X-Patchwork-Hint: ignore
Message-Id: <20230509205911.83769862C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=03bb1a514652f6c3db51ab92683b5161a08f8ab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages, like libselinux, use pip to perform the installation step
of their python bindings. Those packages do have to use our host python
when building, so that it matches the target python.

So we need to have a host variant of pip that is usable with our host
python.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pip/python-pip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 8cf3aaa3ec..35ad7bede2 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -14,3 +14,4 @@ PYTHON_PIP_CPE_ID_VENDOR = pypa
 PYTHON_PIP_CPE_ID_PRODUCT = pip
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
