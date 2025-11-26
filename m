Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7933ED116F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F0CF41537;
	Thu, 27 Nov 2025 20:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RH2ZJ7-zaH9W; Thu, 27 Nov 2025 20:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA134152C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA134152C;
	Thu, 27 Nov 2025 20:36:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E687DE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30D6561732
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAPczbc0nvQR for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A2E161AC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A2E161AC2
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58F3583CC9; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:44:34 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: a9b4636a627c546156b9a32b8523de0829d32585
X-Git-Newrev: c0aae487d004d469b388d2361470d89ee7b9d4fb
X-Patchwork-Hint: ignore
Message-Id: <20251127203603.58F3583CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/nss-pam-ldapd:
 fix build with gcc >= 15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c0aae487d004d469b388d2361470d89ee7b9d4fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/c30/c30b29723a2f3db6fed5ad0bf0e06c126a857953/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7c06826342448c113c569a5bc4cbd8850f2388e9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...iable-name-bool-which-is-a-keyword-in-C23.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch b/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch
new file mode 100644
index 0000000000..a3812fcaff
--- /dev/null
+++ b/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch
@@ -0,0 +1,35 @@
+From 8ddb983a546f632986a84a784c4625110f7782a2 Mon Sep 17 00:00:00 2001
+From: Arthur de Jong <arthur@arthurdejong.org>
+Date: Sun, 23 Feb 2025 15:22:38 +0100
+Subject: Fix variable name (bool) which is a keyword in C23
+
+Closes https://bugs.debian.org/1097481
+
+Upstream: https://arthurdejong.org/git/nss-pam-ldapd/commit/?id=8ddb983a546f632986a84a784c4625110f7782a2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nslcd/cfg.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/nslcd/cfg.c b/nslcd/cfg.c
+index ded797a..b984b0e 100644
+--- a/nslcd/cfg.c
++++ b/nslcd/cfg.c
+@@ -207,10 +207,10 @@ static int get_boolean(const char *filename, int lnr,
+   return parse_boolean(filename, lnr, token);
+ }
+ 
+-static const char *print_boolean(int bool)
++static const char *print_boolean(int value)
+ {
+-  if (bool) return "yes";
+-  else      return "no";
++  if (value) return "yes";
++  else       return "no";
+ }
+ 
+ #define TIME_MINUTES 60
+-- 
+cgit v1.2.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
