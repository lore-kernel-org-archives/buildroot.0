Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 833AB60A8D;
	Thu, 20 Jan 2022 21:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVABbpM4zNIj; Thu, 20 Jan 2022 21:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65A360ED6;
	Thu, 20 Jan 2022 21:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3C4E1BF2B5
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A05EC80BF2
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnmwucNubnYN for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 21:43:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DD0680BBB
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 21:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642714981;
 bh=F6MINQ/iXKO2uOtTaFA2nFbDbpGFbpGvSLUmJcGTrcw=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Y4GgmBfobDZM1OmZe7gZ59bYf9NgU3iRnmOAnG0LlujIsIDNaH4hSkQLjR6DdfLWZ
 WuVbNtWbwzQ1UKuHVFeOIpyFz7mpjTof30r6TmoqcC4N97prmC2EKCQiijlKgVIj57
 tEaQLKlExyVaUgWUaDIVbYZSBDFZljy+iHkUfc/k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MtwUw-1mIZ7R0Bhs-00uMYd for <buildroot@buildroot.org>; Thu, 20 Jan 2022
 22:43:01 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 22:43:00 +0100
Message-Id: <20220120214300.8626-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:hGkUCHuOkGtzPyU1AbYVlduVxMD2gbJNlZOiRqG80k0xGB7mvMD
 4dxefS2oxKYElK8PQu6pL8ey/+szP5hbgcOklQ7kNINhW70yRG0mjSRVolBUE8i31VuM8dK
 zZcs+q6mfJ+/3n0qlqgOwkmEoS0R/OYC00VVY+9kEqNxRDwAn9IYymFKIV6AIMjyB1k2ye2
 PxjlHl8IZhDns4iEUQyyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ebToXgMISkE=:0Xdl+vjwBwf/JYByuBiiqj
 idhpEAgVLXGKXNwwq+T8cdZ3Pim9a/89rLLCZfOCtI3DyMf6+6h4R9tbUi//r5ANyhHNy5Ie5
 LKrYZPoxrlva3PGOBprKIACNSXaZFwlK2jEDieV7fz7Qrk4uPU/FBZa3igqLeeR2ssW0oqwxa
 atEsCWbOLJMX86w76AJd++FqddXrnQaaTjmTsg1+VdcSKcAecfuSPEs98/y5bAKnBR29cGyTj
 6n4emnkl0VCVZ1jCkFmOgPU/fdqrw9YVYFK1RRdbCqcaIaRex2O2q4d1ziPbIO5acaJdEmip7
 r3yBZdRmkA8bNFnDWCPbHI2e1wkmZcDGTcKEqcGswCkpdGiSgLlkMEC7r1MKiOiP7DCGanfa7
 5IFSadAPMhX7T/ERti3He1C04ZbcEz7aDbEUWhamJOknlxaXqetcFY7HwOmLmuyGJQXb83N1x
 m0aJ3Mfdl5EuI5xkv1ikZDC7yJV3MpCN8r2tyEPVfYs55Js7G5kneghqcXvvqgfL/8Pm/huZ/
 kDdvsKny/ON34yIj6R7QhapayE+JxDnwcX4s4Gpo2I3VNEtjmkBREmZND9RFGXQq+OG87e/DD
 wWlJg+/wDQsYN8KVOOlGUddLjlTElbok+CKLykwuJBpN7s9luY36Uf//lAxT25ii4tWDKJ8jq
 FfVWNEtGncxt7bD+d1p0aTq767XwzXTTTQbUQ+DkxD/7tEhiT3FQ42lBdN2v6Ao8b6dx+DfW2
 hqA/2pjP0ocTlWXjSapfrTESlGiF4n/fGBumODdzVhD9E8qKXwiiGfw6Slu3W7SoAS/sWQNqP
 BGtoFaozZxQdu04+1CbFJFwxJ+PBxaOWqcHsWc097FTJ89CXtd+QdF2AQMyojuh7NUIBnPENY
 16DgH7+Jqw9te5zdrcIszUFHD+U6QhPNCLY12mgX4v2QRw3umNMt/4nIHBZiqKDaCxfIU3Wcj
 +hMQOy092x3o0BIhr+rPkl/X3TUEJRkseIUmK1RaV2Vs2JWCGcSOPDgIwoBmhp82Am/8/vTOa
 ZIDvoUb9RWi9op+RNScO16Ooi7Ld1EOeOi+8Wllj2W/LfxbUJ60Yohvj7Hdm/pEpeH0BVobdL
 faHbZ3Fd5IAfDY=
Subject: [Buildroot] [PATCH v1] package/readline: bump version to 8.1.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] http://git.savannah.gnu.org/cgit/readline.git/log

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/readline/readline.hash | 5 +++--
 package/readline/readline.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/readline/readline.hash b/package/readline/readline.hash
index 63172f1121..b0530a2d72 100644
--- a/package/readline/readline.hash
+++ b/package/readline/readline.hash
@@ -1,5 +1,6 @@
-# Locally calculated after checking pgp signature
-sha256  f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02  readline-8.1.tar.gz
+# Locally calculated after checking pgp signature from
+# https://ftp.gnu.org/gnu/readline/readline-8.1.2.tar.gz.sig
+sha256  7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6  readline-8.1.2.tar.gz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 06a96b67a8..b1fd181b78 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-READLINE_VERSION = 8.1
+READLINE_VERSION = 8.1.2
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses host-autoconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
