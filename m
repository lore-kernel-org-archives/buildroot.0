Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3046EC44501
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 078B24114F;
	Fri,  3 Jul 2026 14:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGqEB7fMKJdP; Fri,  3 Jul 2026 14:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128BB4114E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088815;
	bh=73aouOuq0XgwsQfro1CsCQC12IN0aC3+wd1LVD9VKCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sp6hgWtFfTTsLVAFzn5OgWTSrq9Z9d+XJNZB2ykVhrbrxYpwYDKGpBsnQkd70Fz3v
	 Be61cigLaK/DYimeXw0nS/4FQ+NuF+aZ1IYnOwkxXnmNsLENEuwPBbW+yV2u0rHtXl
	 wf0YmnojyCH3GAT2v1ExTEIfNF/WYq7fDx3EH+/sKjCAy7J37oNT2vZt9TR15PvXfe
	 440sofIpasEE03G8tYeI2lNIknccHbyKHwT/6jlzofuAgPUe1vGy82+Y7oG9+zz3Rn
	 g3LcFDvwvGytTt5peC31vhpYcV8Akbac/f/iKKz5uQ51Z0haJwhQA7G/c3zGfAv10O
	 Ex2FiuzgDzjZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128BB4114E;
	Fri,  3 Jul 2026 14:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEEC79E5
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0E2C40E90
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9LPJKILh6F2 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC5240EA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFC5240EA8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5258D883A2; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:47:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0a9d437c60e8eed5a57acc58120f112ed636ede7
X-Git-Newrev: 2d4875d6dcd0ba62cb1dfd91a86f43b788fd81c1
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.5258D883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux:
 backport patch CVE-2025-14104
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8635002909811681092=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8635002909811681092==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d4875d6dcd0ba62cb1dfd91a86f43b788fd81c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2025-14104:
    A flaw was found in util-linux. This vulnerability allows a heap
    buffer overread when processing 256-byte usernames, specifically
    within the `setpwnam()` function, affecting SUID (Set User ID) login-
    utils utilities writing to the password database.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-14104
  - https://github.com/util-linux/util-linux/commit/aaa9e718c88d6916b003da7ebcfe38a3c88df8e6
  - https://github.com/util-linux/util-linux/commit/9a36d77012c4c771f8d51eba46b6e62c29bf572a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0008-CVE-2025-14104-1.patch | 33 ++++++++++++++++++++++++++
 package/util-linux/0009-CVE-2025-14104-2.patch | 28 ++++++++++++++++++++++
 package/util-linux/util-linux.mk               |  4 ++++
 3 files changed, 65 insertions(+)

diff --git a/package/util-linux/0008-CVE-2025-14104-1.patch b/package/util-linux/0008-CVE-2025-14104-1.patch
new file mode 100644
index 0000000000..e14a0458ad
--- /dev/null
+++ b/package/util-linux/0008-CVE-2025-14104-1.patch
@@ -0,0 +1,33 @@
+From aaa9e718c88d6916b003da7ebcfe38a3c88df8e6 Mon Sep 17 00:00:00 2001
+From: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Date: Sat, 24 May 2025 03:16:09 +0100
+Subject: [PATCH] Update setpwnam.c
+
+Upstream: https://github.com/util-linux/util-linux/commit/aaa9e718c88d6916b003da7ebcfe38a3c88df8e6
+CVE: CVE-2025-14104
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ login-utils/setpwnam.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/login-utils/setpwnam.c b/login-utils/setpwnam.c
+index 3e3c1abde50..95e470b5a34 100644
+--- a/login-utils/setpwnam.c
++++ b/login-utils/setpwnam.c
+@@ -126,10 +126,12 @@ int setpwnam(struct passwd *pwd, const char *prefix)
+ 		}
+ 
+ 		/* Is this the username we were sent to change? */
+-		if (!found && linebuf[namelen] == ':' &&
+-		    !strncmp(linebuf, pwd->pw_name, namelen)) {
+-			/* Yes! So go forth in the name of the Lord and
+-			 * change it!  */
++		if (!found &&
++		    strncmp(linebuf, pwd->pw_name, namelen) == 0 &&
++		    strlen(linebuf) > namelen &&
++		    linebuf[namelen] == ':') {
++			/* Yes! But this time let’s not walk past the end of the buffer
++			 * in the name of the Lord, SUID, or anything else. */
+ 			if (putpwent(pwd, fp) < 0)
+ 				goto fail;
+ 			found = 1;
diff --git a/package/util-linux/0009-CVE-2025-14104-2.patch b/package/util-linux/0009-CVE-2025-14104-2.patch
new file mode 100644
index 0000000000..16b66a23cc
--- /dev/null
+++ b/package/util-linux/0009-CVE-2025-14104-2.patch
@@ -0,0 +1,28 @@
+From 9a36d77012c4c771f8d51eba46b6e62c29bf572a Mon Sep 17 00:00:00 2001
+From: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Date: Mon, 26 May 2025 10:06:02 +0100
+Subject: [PATCH] Update bufflen
+
+Update buflen
+
+Upstream: https://github.com/util-linux/util-linux/commit/9a36d77012c4c771f8d51eba46b6e62c29bf572a
+CVE: CVE-2025-14104
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ login-utils/setpwnam.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/login-utils/setpwnam.c b/login-utils/setpwnam.c
+index 95e470b5a34..7778e98f7cc 100644
+--- a/login-utils/setpwnam.c
++++ b/login-utils/setpwnam.c
+@@ -99,7 +99,8 @@ int setpwnam(struct passwd *pwd, const char *prefix)
+ 		goto fail;
+ 
+ 	namelen = strlen(pwd->pw_name);
+-
++	if (namelen > buflen)
++		buflen += namelen;
+ 	linebuf = malloc(buflen);
+ 	if (!linebuf)
+ 		goto fail;
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 64da9ab5d5..22c314ce82 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -39,6 +39,10 @@ UTIL_LINUX_AUTORECONF = YES
 # 0006-add-loopdev-fl-nofollow.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
 
+# 0008-CVE-2025-14104-1.patch
+# 0009-CVE-2025-14104-2.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2025-14104
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \

--===============8635002909811681092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8635002909811681092==--
