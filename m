Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FFFC54E4A
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0EF83139;
	Fri,  8 Mar 2024 11:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qr0v9BGl2t5S; Fri,  8 Mar 2024 11:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 528D683231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528D683231;
	Fri,  8 Mar 2024 11:31:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3351BF317
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46578610E2
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaKV8Ryypbhk for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81BE6610EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81BE6610EF
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F7E881F0; Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 12:29:06 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dba962a7cba8c5df887e3b6be7a45667c0c68720
X-Git-Newrev: 7066c799b4afe45d657d503b1421b6234239da78
X-Patchwork-Hint: ignore
Message-Id: <20240308113130.66F7E881F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gnupg2: fix build
 without ldap
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

commit: https://git.buildroot.net/buildroot/commit/?id=7066c799b4afe45d657d503b1421b6234239da78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Buildroot commit 8f1418b5dd80809dc90196d967d8d9665b794c8e bumped the
version of gnupg2 on the next branch causing a build error:

server.c:(.text+0xbf8): undefined reference to `ks_ldap_help_variables'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 06702c81d3ce70dbba1d6a733a95bf13a3cff0c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ble-the-call-of-ks_ldap_help_variables-wh.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch b/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch
new file mode 100644
index 0000000000..53dd39cf47
--- /dev/null
+++ b/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch
@@ -0,0 +1,36 @@
+From dc13361524c1477b2106c7385f2059f9ea111b84 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 5 Jul 2023 09:29:54 +0900
+Subject: [PATCH] dirmngr: Enable the call of ks_ldap_help_variables when
+ USE_LDAP.
+
+* dirmngr/server.c [USE_LDAP] (cmd_ad_query): Conditionalize.
+
+--
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=dc13361524c1477b2106c7385f2059f9ea111b84
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ dirmngr/server.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/dirmngr/server.c b/dirmngr/server.c
+index 51a149cb2..ee61f63d6 100644
+--- a/dirmngr/server.c
++++ b/dirmngr/server.c
+@@ -2776,7 +2776,9 @@ cmd_ad_query (assuan_context_t ctx, char *line)
+ 
+   if (opt_help)
+     {
++#if USE_LDAP
+       ks_ldap_help_variables (ctrl);
++#endif
+       err = 0;
+       goto leave;
+     }
+-- 
+2.11.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
