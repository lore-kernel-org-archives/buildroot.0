Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02D5C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A919404F5;
	Thu, 28 Jul 2022 21:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A919404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbWq1WlnPl0f; Thu, 28 Jul 2022 21:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB8BB40327;
	Thu, 28 Jul 2022 21:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8BB40327
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5001BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4647782F11
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4647782F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8g30QaKNlcJD for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EBC580D9A
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EBC580D9A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 54C7B8680C; Thu, 28 Jul 2022 20:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:00:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b573a7029523925746efbe056f7ff02b63edbb7f
X-Git-Newrev: dba42986c0197eb26386ebdb8a4de8e506e2c002
X-Patchwork-Hint: ignore
Message-Id: <20220728204710.54C7B8680C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: add more cache variables for
 TRY_RUN
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

commit: https://git.buildroot.net/buildroot/commit/?id=dba42986c0197eb26386ebdb8a4de8e506e2c002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that zsh has a number of additional TRY_RUN calls. We
already set a few with cache variables, add a few more. They are found
based on reading the configure.ac, aczsh.m4, and the configure output.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zsh/zsh.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 4897620a00..688c6366e8 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -14,6 +14,14 @@ ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 ZSH_CPE_ID_VENDOR = zsh
 
+# zsh uses TRY_RUN to determine these
+ZSH_CONF_OPTS += \
+	zsh_cv_long_is_64_bit=$(if $(BR2_ARCH_IS_64),yes,no) \
+	zsh_cv_off_t_is_64_bit=yes \
+	zsh_cv_64_bit_type='long long' \
+	zsh_cv_64_bit_utype='unsigned long long' \
+	zsh_cv_printf_has_lld=yes
+
 ifeq ($(BR2_PACKAGE_GDBM),y)
 ZSH_CONF_OPTS += --enable-gdbm
 ZSH_DEPENDENCIES += gdbm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
