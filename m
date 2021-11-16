Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73263C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1BF61ABD
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D1BF61ABD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DEE980D61;
	Tue, 16 Nov 2021 20:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhgOJMrkVJxh; Tue, 16 Nov 2021 20:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFBF80F53;
	Tue, 16 Nov 2021 20:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 148B51BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B71980F43
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8OE9NmTxoxd for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5902280F3E
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B28CB8D362; Tue, 16 Nov 2021 20:28:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 21:07:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e0f70b3d1ef747995fcc717fbfcac2e13864ffd
X-Git-Newrev: 7413b8c6e4a2359b3f3f6e0fe8b83d77e0b46142
X-Patchwork-Hint: ignore
Message-Id: <20211116202859.B28CB8D362@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oracle-mysql: add mysql_config to
 ORACLE_MYSQL_CONFIG_SCRIPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=7413b8c6e4a2359b3f3f6e0fe8b83d77e0b46142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add mysql_config to ORACLE_MYSQL_CONFIG_SCRIPTS so the per-package fix
added by commit a18c828bed99d7e0db5128224ffcda4897cd8e80 will be applied
to this file which will avoid the following build failures with
libodb-mysql, open2300 or rsyslog:

configure:3286: /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/powerpc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -rdynamic -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/mysql -lmysqlclient -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/oracle-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -lz -lnsl -lm >&5
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/libc.so.1
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /usr/lib/uclibc_nonshared.a
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/ld-uClibc.so.1

Fixes:
 - http://autobuild.buildroot.org/results/9e3c09dd3d9bd55de14fc89a1d17ba9c008b195b
 - http://autobuild.buildroot.org/results/b42c8c86e9574ba9f2c04daa3476206270241a66
 - http://autobuild.buildroot.org/results/08156c934e9b4d946c354dbaf78ea5d9ae9a4701

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/oracle-mysql/oracle-mysql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 6607486d4d..8a6bdc0097 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -15,6 +15,7 @@ ORACLE_MYSQL_LICENSE = GPL-2.0
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
 ORACLE_MYSQL_SELINUX_MODULES = mysql
 ORACLE_MYSQL_PROVIDES = mysql
+ORACLE_MYSQL_CONFIG_SCRIPTS = mysql_config
 
 # Unix socket. This variable can also be consulted by other buildroot packages
 MYSQL_SOCKET = /run/mysql/mysql.sock
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
