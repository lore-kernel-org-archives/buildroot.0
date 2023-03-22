Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2FFC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29DCB822B7;
	Wed, 22 Mar 2023 16:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29DCB822B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlZ3WY19cLLG; Wed, 22 Mar 2023 16:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E54883F97;
	Wed, 22 Mar 2023 16:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E54883F97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFECD1BF35F
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 16:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D3C80BEA
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 16:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2D3C80BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTn8UFDhYH6f for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 16:25:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B99B811E7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B99B811E7
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 16:25:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.182]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N0oG5-1qSSk21vnR-00wk1z for <buildroot@buildroot.org>; Wed, 22 Mar 2023
 17:25:39 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 17:25:38 +0100
Message-Id: <20230322162538.19202-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:oCmGt4uP4qQI+ONsuvs6KX1VwC0I2FnHDT3DibPXmG+ycSohS3l
 mQlkbS5K7WXvuvN4rDsdM2zalWCeUapfVbNZ+T28R3ed5mrJgkFd4XHskkQ3ikQd0io2mqZ
 8TZrVVEZK11Qk3MI61pYZhInwtxl0BCboUUdt6/kCUsw0i/FXJuHkH4fNPlFB9cy8Ad8reU
 it60stpNdUL3O238ksU5A==
UI-OutboundReport: notjunk:1;M01:P0:wwbL4BNxiN0=;FLjEeDKUTGS+bfolT+s+AjgPyy5
 6/MjGIeMoKrEqaSKLMAloDqI6WGCbsypLKDzwi5ejte/5lXcG2g50Iz7tBrH9TuD1LmpeyEIR
 AqfTZpzNRe2fT41PT5103U2GleI5/M4JI+awu1TYXooZ+GUM+YC2rXgpxAYYQiuYiukHx4qk0
 vKkuc2VUzwAN8AhmspThkLifANsUwmZkNazWcQpPp/BCGNzPsJ8IyOBTed3bVHG4lANx7EcJ/
 8CcK7eBcUpxSbRNvd/3Z70/2HHY15EoLn6X+rCKsgdro/paWcJfA6MrGQIBe6RZbRX9m70Rd3
 Kh4YFyFrRZJKeFAyjO5xIL3PrnWtayX2mbw2HfziHxzdNxeRIKhtg1jijsVV7p638T3FDkwus
 GIqIbV6sOP1+7yNTf/M9SH7sEARa8gJWRooIDSHIEa4PesihMB1ZBz7NQETw/haCICYQSfY7Z
 Spx2KskGv+68oIrhEIAa8E1XmtvZMZbwsQr7blriewblBVwE/Ggvuub9eGKcQllHpLB3VJ+b3
 J6RhJ0Iwz9pex1j3dsdcM+v15BG+jSdlcaY1SLphuhtly7fyTG17/lOi5uwf04hLmuxS8XnF/
 /QKzUtLEaAFyVCJpDwOFkV62j3UfokpNYWnZ3g2ZC1WfjLz7j7kKPdgecR4V04qBfhqa6V4rz
 N+ebuEQGxzhgLevI4ztyOnwBr9j31+tYFvoUEvJqHqO3GGkCS2gkVC4gEC1ieUshhxSbmseid
 XP7Y1GdRWOMt+R8CTl4rG/ii4G/tfNENSLh7QWfvz4Q5xv6p8YR1JBYWyhES7ZbmzAKeDFV1H
 +NAjc2D5YfSnpAq0ir3INCjMVyX/kCPDDMN8EknuqbgCMXMKkbBG9HOl78qNh7w5C4ZPIl/Wl
 DEuF+W6zE1/JWCZ526MCeyBUCI3aWtqnKGUY2HAYqEb+peKWp6nzw5WZmiP0XLzEyG9yvbRBP
 S2LsIwGC5tNftbZ8n9ad/6YReG8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679502339; i=ps.report@gmx.net;
 bh=EQa8z7xqEAng4cW4PK35HDsRGS5SU6qokhsf5UfyUSc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=N0uGp+DvR8XsaEWkt6uGYCOtXK79yJI66PcfBeDTRBVUp9R0zTIgy8OolwouTmDuH
 rUNA3J0mfzxEyXpL3bW64be8mhWYYxb5UyFjVXGvaS8NyV+G3XCmKWDc4tBU8mJwSx
 GskcT5FXfyir7ZGGWYMvnaV3PMoIEP48ALZKwhpa+a5McY5Hlk/zMcSxaFQmjwxpKl
 dKJ5dwU+eZEs0sfxuwT7ZRNdkCWRIIMB+H1C/03SOOUXPn9y1EIyBAYiXYsZoCjsdE
 gLf+/vpqLjOxmQBRZ3AvpbksouijOgfzTQWgp5KJaskbB2e6XbZt20swOPAQ9aER7X
 64xy22KawAoqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=N0uGp+Dv
Subject: [Buildroot] [PATCH v1] package/readline: add upstream patch to fix
 crash with invalid locale specification
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

Add upstream patch to fix crash with invalid locale specification (see [1]
for details).

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=15456

[1] https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00002.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ch-1-fix-crash-when-readline-is-star.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch

diff --git a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
new file mode 100644
index 0000000000..b0f784b8ba
--- /dev/null
+++ b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
@@ -0,0 +1,41 @@
+From b8d91eab12603fa88e095248855f5f772d182d05 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Wed, 5 Oct 2022 10:41:16 -0400
+Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
+ an invalid locale specification
+
+[Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
+ Stripped unrelated ._.gitignore change]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ nls.c      | 4 ++++
+ patchlevel | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/nls.c b/nls.c
+index 5c6a13b..8c027d6 100644
+--- a/nls.c
++++ b/nls.c
+@@ -141,6 +141,10 @@ _rl_init_locale (void)
+   if (lspec == 0)
+     lspec = "";
+   ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
++  if (ret == 0 || *ret == 0)
++    ret = setlocale (LC_CTYPE, (char *)NULL);
++  if (ret == 0 || *ret == 0)
++    ret = RL_DEFAULT_LOCALE;
+ #else
+   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
+ #endif
+diff --git a/patchlevel b/patchlevel
+index d8c9df7..fdf4740 100644
+--- a/patchlevel
++++ b/patchlevel
+@@ -1,3 +1,3 @@
+ # Do not edit -- exists only for use by patch
+ 
+-0
++1
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
