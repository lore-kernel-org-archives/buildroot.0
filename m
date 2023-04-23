Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C13C6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 15:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B31160F40;
	Sun, 23 Apr 2023 15:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B31160F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gSbtMJOgWPQ; Sun, 23 Apr 2023 15:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C91A60B38;
	Sun, 23 Apr 2023 15:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C91A60B38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C80211BF855
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 15:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF3AC81EF7
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 15:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3AC81EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rK7w4iN2HYWN for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 15:25:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C65F981EC0
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 15:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65F981EC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD94A8449E; Sun, 23 Apr 2023 15:25:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 17:21:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e538824692822cab06c44e6b70e9ae3b92d4c920
X-Git-Newrev: 6104b62d95e87e5cb4f4815b78841541de4301e8
X-Patchwork-Hint: ignore
Message-Id: <20230423152501.AD94A8449E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: ignore CVE-2017-8806
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

commit: https://git.buildroot.net/buildroot/commit/?id=6104b62d95e87e5cb4f4815b78841541de4301e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/postgresql/postgresql.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index a2aed9a2eb..e46622c0e7 100644
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
