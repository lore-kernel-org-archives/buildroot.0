Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E416C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 23:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC2760EA7;
	Wed,  1 Jul 2026 23:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpPwPsfWtl5Y; Wed,  1 Jul 2026 23:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0576360E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782947090;
	bh=cYkWHiCcu4ge1tQGTr0lznDXtWBm5qzjs/P4Hv6BGd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kaq+5h+sap6AqIKPlPKZRDEhrwe0+DCxd3I3S/7a3J3YVvDRco/WesMRfGFUC8GTM
	 9g3xdkq5FwJ5DKHpWC6E/utJ8d5bj4E4hK9naW+rr3DlXrrsEgrJw295dMaKwULW6z
	 8Wq89msAzRRdXTEvbaa0+9/2/RHyj3nLZbss3Ff/Dk2iHDqOv/i34atJFS3CIESsyw
	 ++NLNY0ouT/t1YNDRHcXCjLhjT4xCU8MQvhM5iXjv5MQW+mX3h8yzTACvWmsnZziRZ
	 /lPNGPkA/6I6MAEg419VXyMUm8rWmB4oCl0/CcBASMNJSmfFqKWuxQJoiOdBCCDBAW
	 1kDMgv6hDV6dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0576360E12;
	Wed,  1 Jul 2026 23:04:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A68804B5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 23:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CB4382EFC
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 23:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGnYHxLjFlF8 for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 23:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 191C182EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191C182EF0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 191C182EF0
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 23:04:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTqg-1waCKC45lW-00YIcu; Thu, 02
 Jul 2026 01:04:35 +0200
To: buildroot@buildroot.org
Date: Thu,  2 Jul 2026 01:04:08 +0200
Message-ID: <20260701230410.2522114-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:kVqTx0yo97ZxbA6zxlkPwpEI/OEhzFae5KNfgByXPSePejghQwv
 a2GOp0TIjFy2V8XtCebcf7cterMrtMD8wawbz63yuOaDw37u26anJPYo0/9Lhqhoh30ypCi
 bmsKJK2OmrrPX2jfSp+1Np6sFQ779UXwK0YOXyGcT1pIZJI7CkANFFFQWlUT4tNiqIQ4kZK
 pp//C14jCtLLwmRyNFUMQ==
UI-OutboundReport: notjunk:1;M01:P0:8YATrp+rbe4=;erAuPN3GGDPFM0ChbpZ7fmVHb4I
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782947075; x=1783551875; i=fiona.klute@gmx.de;
 bh=3uJobuB1YaGl1HoKGGJ8iQaTHlPvkQB1euczYNNVMs0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fNRUketAN7OHdy2840JcWS51hKjdvSvYf4Ti1WtL7JTqOEP1Kh87UjKVny2ED3Kz
 CbwrrX0xhlnb0HWs215e72OhEmL0cBNX4oi8MwHo4xzP6kSua3/zZtUo6RVlfKa1A
 JHQK4OLOJbgxaXM32a8JO8vtyxhn7n87je+6PfEW/DaBaHnCUqpNe2FrNTwUH5zsx
 mVFMvUVrTT9udNQlCstMvsoRP+TdTrQene9rtmTweZMqMTyy6r5QwUrT2YnPMA1mI
 JRZVpRNUcvNp6jQ6czHyqav5FQaK+T7CoO/02oWg5ThPIQMf6MXXFJnnlj8pRyXF6
 gSHdEuV2Amoyh05n5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fNRUketA
Subject: [Buildroot] [PATCH 1/2] package/apache: use "Debian" filesystem
 layout to fix read-only rootfs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous configuration placed both logs and PID file in /var/logs,
which is not writable with a read-only rootfs (e.g. squashfs), as well
as non-standard. Starting HTTPD during boot failed with:

(30)Read-only file system: AH00091: httpd: could not open error log file /var/logs/error_log.
AH00015: Unable to open logs

An additional issue was that the Buildroot-default --prefix=/usr
override meant various Apache-internal directories (e.g. htdocs) were
placed directly in /usr. Note that the upstream default prefix is
/usr/local/apache2, not /usr/local.

Using the "Debian" layout provides a standard-compatible layout with
logs in /var/log/apache2 and PID file in /var/run/apache2 (both in
tmpfs with the default Buildroot fstab). Both directories need to
exist when the server starts, so handle that in the init script.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
The "right" filesystem layout is certainly debatable, but I think that
HTTPD should work with a read-only rootfs is not. Apply patch 2
without this one and run the test to see the problem in action.

The "layout" values are defined in config.layout in the package source
(or see
https://svn.apache.org/repos/asf/httpd/httpd/trunk/config.layout),
patching it to add a Buildroot one would also be an
option. Unfortunately I don't see a way to override the directories
for logs and PID file independently on the ./configure command line.

I'm also CCing the people listed in DEVELOPERS for
package/modsecurity2 because changes to package/apache naturally
affect any modules, I've tested it still compiles.

 package/apache/S50apache      |  2 ++
 package/apache/apache.mk      | 13 ++++++++-----
 package/apache/apache.service |  1 +
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/apache/S50apache b/package/apache/S50apache
index 71e8837bae..fd1c58312f 100644
--- a/package/apache/S50apache
+++ b/package/apache/S50apache
@@ -2,6 +2,8 @@
 # shellcheck disable=SC2034 # checkpackage-required variable
 DAEMON="apache"
 
+mkdir -p "/var/log/apache2" "/var/run/apache2"
+
 case "$1" in
 	start|restart|graceful|graceful-stop|stop)
 		apachectl -k "$1"
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 2466bc9461..debc999bcd 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -43,7 +43,9 @@ APACHE_CONF_OPTS = \
 	--without-suexec-bin \
 	--enable-mods-shared=all \
 	--with-mpm=$(APACHE_MPM) \
-	--disable-luajit
+	--disable-luajit \
+	--enable-layout=Debian \
+	--prefix=/
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
 APACHE_CONF_OPTS += --enable-brotli
@@ -111,14 +113,15 @@ endif
 
 define APACHE_FIX_STAGING_APACHE_CONFIG
 	$(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%' $(STAGING_DIR)/usr/bin/apxs
-	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
-	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
-	$(SED) 's%^sbindir =.*%sbindir = $(STAGING_DIR)/usr/bin%' $(STAGING_DIR)/usr/build/config_vars.mk
+	$(SED) 's%/usr/share/apache2/build%$(STAGING_DIR)/usr/share/apache2/build%' $(STAGING_DIR)/usr/bin/apxs
+	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
+	$(SED) 's%^sbindir =.*%sbindir = $(STAGING_DIR)/usr/sbin%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
+	$(SED) 's%^includedir = .*%includedir = $(STAGING_DIR)/usr/include/apache2%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
 endef
 APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
 
 define APACHE_CLEANUP_TARGET
-	$(RM) -rf $(TARGET_DIR)/usr/manual $(TARGET_DIR)/usr/build
+	$(RM) -rf $(TARGET_DIR)/usr/share/apache2/default-site/htdocs/manual $(TARGET_DIR)/usr/share/apache2/build
 endef
 APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_CLEANUP_TARGET
 
diff --git a/package/apache/apache.service b/package/apache/apache.service
index b8747e2658..561e4e2851 100644
--- a/package/apache/apache.service
+++ b/package/apache/apache.service
@@ -4,6 +4,7 @@ After=network.target
 
 [Service]
 Type=forking
+ExecStartPre=/bin/mkdir -p /var/log/apache2 /var/run/apache2
 ExecStart=/usr/bin/apachectl start
 ExecReload=/usr/bin/apachectl graceful
 ExecStop=/usr/bin/apachectl stop
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
