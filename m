Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98797C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 09:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95FF8400B5;
	Thu, 23 Dec 2021 09:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kaMTQZ74jWEf; Thu, 23 Dec 2021 09:08:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4039340600;
	Thu, 23 Dec 2021 09:08:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 385911BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 09:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 271A860B79
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 09:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xegeTYdBk_5C for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 09:08:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB17760ADF
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 09:08:06 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u22so8011550lju.7
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 01:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDygQRvzpMh4TH5dS+jOa3/YHZN6cMd+wYcpUgikZ+E=;
 b=YwlFNJjcDshi7y/pOtl9tb3vIgJ+he6GQQmtu59Xvp9LM8vBhFGseqVNhZmhFU3xis
 6YTkmUarGRtnciKP8BBgkArfUOiKZX87Ywyo3OKm2O2plfKWTMLUgzckpyOc5P0PauDZ
 PwfW0I0M/ZjNTIpm/OxiHNWr14qAUbV+8T9VzodtR/DAjuyN19HCKR8gF/KU7T/bsi6a
 yfEBgwrk1PG3ZnmJqfBGOXsXqY2jfSDelK5jWy9DVvgEH+jli+Z66NP2xnairQVAZE9A
 2R0Id+21JVbrBKBvbV2t6pGdqEZQJ4DthEgR+9d7hLLzJ4lrNfRmQfGMglkXkGFmty1b
 CeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDygQRvzpMh4TH5dS+jOa3/YHZN6cMd+wYcpUgikZ+E=;
 b=MEhodSYdGWVbC+005esudn56lfzXiZL3aTvUkjE/sSv7NfifDkSvDDVpgynXrH3zby
 QGNSSREkX9dt7UZMwIQOLGkmZlHizMw0cbWSjiCRz9d5njJoQO0gcd6QgBHKGKAhTiyb
 S3//Rm5j7k3duwm4ZuivoOofzrDK+Hv/+TdApM2ZHCENqq8wjyCNLHwcutJCb0dg+C/3
 oNfPquAO8r5gOaFbALIIazemNByo+4Kc7n6GBaVdDJJlTktcr9gI7XBFKWoFCAVqmFxs
 pWf0pjmW62O+ZQCMNbiU5kCOMTfxChCI6pnj8fD/ImqXlNSpVCFG9SR8NTbpmukVcV+A
 kWzw==
X-Gm-Message-State: AOAM531JwWuN+Mk6NQYK+YaDPQ7twl2Jj/QRe6ylGvtdwewSDB9SfFhT
 s/TnXQkPCXYpLwf32fQGBTMRtuEgVp/heA==
X-Google-Smtp-Source: ABdhPJy6G113qWIHQ2+MF/3YQ85AcqinUkxSU0lmxXUSi7bsmIFB1KmKY5DgRTpmj6pLKNG4ZxY25A==
X-Received: by 2002:a2e:bf27:: with SMTP id c39mr1049649ljr.27.1640250484410; 
 Thu, 23 Dec 2021 01:08:04 -0800 (PST)
Received: from localhost.localdomain ([98.128.186.122])
 by smtp.gmail.com with ESMTPSA id br39sm446854lfb.243.2021.12.23.01.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 01:08:04 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 10:07:58 +0100
Message-Id: <20211223090800.1716321-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223090800.1716321-1-troglobit@gmail.com>
References: <20211223090800.1716321-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/makedevs: allow recursive on
 directory with dangling symlinks
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using BR2_ROOTFS_DEVICE_TABLE to change ownership of /etc, like so:

  /etc        r  -1 root     wheel     - - - - -

makdevs fails due to it trying to chown() a dangling symlink:

  makedevs: chown failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc/mtab: No such file or directory
  makedevs: line 25: recursive failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc: No such file or directory
  make[2]: *** [fs/ext2/ext2.mk:63: /src/myLinux/output/images/rootfs.ext2] Error 1
  make[1]: *** [Makefile:84: _all] Error 2
  make[1]: Leaving directory '/src/myLinux/buildroot'

This patch changes chown() to lchown() in two cases in makedevs.c when
the argument can be a symlink, dangling or not.

In case the recursive operation includes a chmod() as well, explicitly
exclude symlinks that are dangling, because chmod() always operates on
the link target.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/makedevs/makedevs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index c57b964f5c..2796cd5e78 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -440,11 +440,13 @@ void bb_show_usage(void)
 int bb_recursive(const char *fpath, const struct stat *sb,
 		int tflag, struct FTW *ftwbuf){
 
-	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
+	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {
 		bb_perror_msg("chown failed for %s", fpath);
 		return -1;
 	}
-	if (recursive_mode != -1) {
+
+	/* chmod() is optional, also skip if dangling symlink */
+	if (recursive_mode != -1 && tflag == FTW_SL && access(fpath, F_OK)) {
 		if (chmod(fpath, recursive_mode) < 0) {
 			bb_perror_msg("chmod failed for %s", fpath);
 			return -1;
@@ -628,7 +630,7 @@ int main(int argc, char **argv)
 				if (mknod(full_name_inc, mode, rdev) < 0) {
 					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
-				} else if (chown(full_name_inc, uid, gid) < 0) {
+				} else if (lchown(full_name_inc, uid, gid) < 0) {
 					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
 				} else if (chmod(full_name_inc, mode) < 0) {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
