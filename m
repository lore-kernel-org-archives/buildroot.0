Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B83C77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC070416A7;
	Tue,  2 May 2023 07:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC070416A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YN6FtEKTezxU; Tue,  2 May 2023 07:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E04B409A5;
	Tue,  2 May 2023 07:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E04B409A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B16B1BF400
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 110274156A
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 110274156A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRJr3LIUUMz3 for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:27:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05D5F41578
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05D5F41578
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E57ED854A5; Tue,  2 May 2023 07:27:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 08:22:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e4d777b1c8df9b087a47b2ad7ac4803ad1ad3d60
X-Git-Newrev: 5c6e53db58d5739d1ebe2fe83ba267debf6a8962
X-Patchwork-Hint: ignore
Message-Id: <20230502072742.E57ED854A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql:
 ignore CVE-2017-8806
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c6e53db58d5739d1ebe2fe83ba267debf6a8962
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

CVE-2017-8806 is related to postgresql-common package, as present in
Debian and its derivatives; Buildroot does not have that package.
It is false positive for postgresql, so ignore it.

To be noted, is that a similar CVE [0] applied to postgresql itself, as
stated in [1], but that was fixed a while ago [2], and we need not
ignore it.

[0] https://nvd.nist.gov/vuln/detail/CVE-2017-12172
[1] https://ubuntu.com/security/CVE-2017-8806
[2] https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=dfc015dcf46c1996bd7ed5866e9e045d258604b3

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6104b62d95e87e5cb4f4815b78841541de4301e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3c190c34e3..30a4d45737 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -19,6 +19,10 @@ POSTGRESQL_CONF_ENV = \
 POSTGRESQL_CONF_OPTS = --disable-rpath
 POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+# CVE-2017-8806 is related to postgresql-common package
+# It is false positive for postgresql
+POSTGRESQL_IGNORE_CVES += CVE-2017-8806
+
 # https://www.postgresql.org/docs/11/static/install-procedure.html:
 # "If you want to invoke the build from another makefile rather than
 # manually, you must unset MAKELEVEL or set it to zero"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
