Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058A4EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8139583A3F;
	Wed, 14 Jun 2023 13:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8139583A3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3S1CLW87LWt; Wed, 14 Jun 2023 13:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCD583A34;
	Wed, 14 Jun 2023 13:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCD583A34
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ADDA1BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D885E417BB
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D885E417BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sB4NWWZWvLW6 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F062941794
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F062941794
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE406836BE; Wed, 14 Jun 2023 13:52:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:43:01 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 675142ca66fecdf38dbf1862092aafe7b0f822ea
X-Git-Newrev: e6c1cb257e0a32f5d0dcb2014f10a1689983fe5a
X-Patchwork-Hint: ignore
Message-Id: <20230614135234.DE406836BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/perl-http-message: add missing reverse dependency from perl-clone
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6c1cb257e0a32f5d0dcb2014f10a1689983fe5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit [1] added dependency on perl-clone but forgot to propagate
the reverse dependency on !BR2_STATIC_LIBS.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PERL_CLONE
  Depends on [n]: BR2_PACKAGE_PERL [=y] && !BR2_STATIC_LIBS [=y]
  Selected by [y]:
  - BR2_PACKAGE_PERL_HTTP_MESSAGE [=y] && BR2_PACKAGE_PERL [=y]

http://autobuild.buildroot.org/results/5d5/5d503aaa94b56523c684be7946123921747ebf52

[1] 742258fec06df18782e4bd75b00ca530120312cb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35dea785ef6a4c3f3faa91b20da60aef15d1bcdd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-http-cookies/Config.in   | 4 ++++
 package/perl-http-daemon/Config.in    | 4 ++++
 package/perl-http-message/Config.in   | 4 ++++
 package/perl-http-negotiate/Config.in | 4 ++++
 package/perl-plack/Config.in          | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index 3ca461bf83..147d9521bb 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PERL_HTTP_COOKIES
 	bool "perl-http-cookies"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  HTTP cookie jars.
 
 	  https://github.com/libwww-perl/HTTP-Cookies
+
+comment "perl-http-cookies needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index 0c7ffe723a..4d6277a799 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_DAEMON
 	bool "perl-http-daemon"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
@@ -7,3 +8,6 @@ config BR2_PACKAGE_PERL_HTTP_DAEMON
 	  A simple http server class.
 
 	  https://github.com/libwww-perl/HTTP-Daemon
+
+comment "perl-http-daemon needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 3c6849487a..e2cb42f941 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	bool "perl-http-message"
+	depends on !BR2_STATIC_LIBS # perl-clone
 	select BR2_PACKAGE_PERL_CLONE # runtime
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE # runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
@@ -10,3 +11,6 @@ config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	  HTTP style message (base class).
 
 	  https://github.com/libwww-perl/HTTP-Message
+
+comment "perl-http-message needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
index c519ede2df..2e82ce5ad2 100644
--- a/package/perl-http-negotiate/Config.in
+++ b/package/perl-http-negotiate/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	bool "perl-http-negotiate"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  choose a variant to serve.
 
 	  https://metacpan.org/release/HTTP-Negotiate
+
+comment "perl-http-negotiate needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
index c81ac4a444..420f8257e5 100644
--- a/package/perl-plack/Config.in
+++ b/package/perl-plack/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_PLACK
 	bool "perl-plack"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER # runtime
 	select BR2_PACKAGE_PERL_COOKIE_BAKER # runtime
 	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE # runtime
@@ -19,3 +20,6 @@ config BR2_PACKAGE_PERL_PLACK
 	  toolkit).
 
 	  https://github.com/plack/Plack
+
+comment "perl-plack needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
