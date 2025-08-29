Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01062CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA6A8842B0;
	Fri, 29 Aug 2025 11:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7gYSdig3j5o; Fri, 29 Aug 2025 11:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52C9842A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D52C9842A2;
	Fri, 29 Aug 2025 11:12:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24F6A69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 173CC61557
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMzQPuL89gId for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:12:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5ECC7614C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ECC7614C6
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ECC7614C6
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:12:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 468E2C8F1C5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:11:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C3574606B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:12:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49C321C228B17; 
 Fri, 29 Aug 2025 13:12:12 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 13:12:10 +0200
Message-ID: <20250829111210.1669283-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756465932; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=YH527zBHZjpGH5L/18vUm2yKzBxA5Q19ix6kBr1E9eI=;
 b=C1OFdhCw7asvSc3goXIyEXj3VdGAPc0+vddLiQh0bajyc8qhY7QAlnpQbF53VmYWOXFoZo
 PiEM5y8FLfKGzOL5sPBWpRwmNVo9URl7zSVH4EzMmoE+VYxzGotGRp4qhiwh0P/iYO/+Cj
 GtnA5wZNCFi1hgXwO0h2cbjnAHMlj2kS3NKrh0jVQlgLP53/1s/LmebntnVb/AX9ipBOlu
 0REwF61molXtEP3tt5dyDGNh1JjEKtj04SbvsQr+z7qfcyS8+kHDMM2JmwOhxKNjY0NIN3
 6RV+ymeGpt/uwz+pBT3Abjt6kX8Cods+Hmc4dumBh/kEW47xKyd2BEmDn/WYRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=C1OFdhCw
Subject: [Buildroot] [PATCH] package/mariadb: explicitly disable the column
 store plugin
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building the column store plugin (which gets automatically enabled
when Boost with a bunch of submodules is found) currently fails as it
requires a number of runtime checks that obviously cannot work when
cross-compiling.

OpenEmbedded has defined them as such:

  -DLSTAT_FOLLOWS_SLASHED_SYMLINK_EXITCODE=0 \
  -DSTAT_EMPTY_STRING_BUG_EXITCODE=0 \
  -DMASK_LONGDOUBLE_EXITCODE=0 \

but it really isn't clear whether those values are completely correct
for all CPU architectures, especially the last one.

So instead, let's disable the column store plugin until someone
actually needs it and figures out how to set those variables properly.

The issue fixed by this commit can be reproduced using the following
defconfig:

BR2_aarch64=y
BR2_ARM_FPU_VFPV3D16=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_MARIADB_SERVER=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_DATE_TIME=y
BR2_PACKAGE_BOOST_FILESYSTEM=y
BR2_PACKAGE_BOOST_REGEX=y
BR2_PACKAGE_BOOST_THREAD=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 0d872442f2..53395afc91 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -112,7 +112,8 @@ MARIADB_CONF_OPTS += \
 	-DINSTALL_SQLBENCHDIR=share/mysql/bench \
 	-DINSTALL_SUPPORTFILESDIR=share/mysql \
 	-DMYSQL_DATADIR=/var/lib/mysql \
-	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
+	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET) \
+	-DPLUGIN_COLUMNSTORE=NO
 
 HOST_MARIADB_DEPENDENCIES = host-openssl
 HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
