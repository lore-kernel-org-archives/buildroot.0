Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768B3C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:14:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432F661037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 432F661037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1676381029;
	Wed,  4 Aug 2021 01:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBxP5LA6zILw; Wed,  4 Aug 2021 01:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6578683C12;
	Wed,  4 Aug 2021 01:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1479D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CF4C40477
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIeSlE6moqfv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D6E240F52
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 82A45878C2; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 18:05:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b1fce2f871c472de1acf25ae2a663e61f4e921f1
X-Git-Newrev: c5b016c618dfc64532e4b431b014900d68905041
X-Patchwork-Hint: ignore
Message-Id: <20210803211028.82A45878C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/refpolicy: fix build
 with ftp
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c5b016c618dfc64532e4b431b014900d68905041
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure raised since commit
61a47bb1037ac20772f4e0106aab956adffeee12

Fixes:
 - http://autobuild.buildroot.org/results/bde34d81a04b5ea96722dc56249089dce7e65b74

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...modules-services-ftp-te-make-ssh-optional.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
new file mode 100644
index 0000000000..9269c7aff8
--- /dev/null
+++ b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
@@ -0,0 +1,44 @@
+From f26d4bc1b2a7b781c67891cb3bf4579c6582d630 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 30 Jul 2021 22:40:20 +0200
+Subject: [PATCH] policy/modules/services/ftp.te: make ssh optional
+
+Make ssh optional to avoid the following build failure:
+
+ Compiling targeted policy.30
+ env LD_LIBRARY_PATH="/home/fabrice/buildroot/output/host/lib:/home/fabrice/buildroot/output/host/usr/lib" /home/fabrice/buildroot/output/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
+ policy/modules/services/ftp.te:484:ERROR 'type ssh_home_t is not within scope' at token ';' on line 92051:
+ 	allow sftpd_t ssh_home_t:dir { open read getattr lock search ioctl add_name remove_name write };
+ #line 484
+ checkpolicy:  error(s) encountered while parsing configuration
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ policy/modules/services/ftp.te | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/policy/modules/services/ftp.te b/policy/modules/services/ftp.te
+index 0d84da71cf..5686b22581 100644
+--- a/policy/modules/services/ftp.te
++++ b/policy/modules/services/ftp.te
+@@ -481,10 +481,6 @@ tunable_policy(`sftpd_full_access',`
+ 	files_manage_non_auth_files(sftpd_t)
+ ')
+ 
+-tunable_policy(`sftpd_write_ssh_home',`
+-	ssh_manage_home_files(sftpd_t)
+-')
+-
+ tunable_policy(`use_samba_home_dirs',`
+ 	fs_list_cifs(sftpd_t)
+ 	fs_read_cifs_files(sftpd_t)
+@@ -496,3 +492,9 @@ tunable_policy(`use_nfs_home_dirs',`
+ 	fs_read_nfs_files(sftpd_t)
+ 	fs_read_nfs_symlinks(ftpd_t)
+ ')
++
++optional_policy(`
++	tunable_policy(`sftpd_write_ssh_home',`
++		ssh_manage_home_files(sftpd_t)
++	')
++')
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
