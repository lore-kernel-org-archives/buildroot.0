Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B55C27C77
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CE84056E;
	Wed, 12 Jun 2024 18:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQM5p7ykbKGF; Wed, 12 Jun 2024 18:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3759740521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3759740521;
	Wed, 12 Jun 2024 18:32:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18EA21BF36A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 053DD409B5
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm_n82AMtGoD for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 877A440150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 877A440150
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 877A440150
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:32:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1soaeu3kGB-00csvr; Wed, 12
 Jun 2024 20:32:04 +0200
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 20:31:33 +0200
Message-ID: <20240612183136.2145705-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612183136.2145705-1-fiona.klute@gmx.de>
References: <20240612183136.2145705-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qiI+K5Y2EZ5zw8RMgwZEAewqfIjrGJZr77VzM4H0IlcPAgjvFoZ
 amiORLo5x2VmgEvc2Es7BibZ51+JgQ7mqAGHVoAaGnwSJuxys0+EgCHlvAok2T3qRpus/Dv
 DawTnP28CM1D+Vg4bY28NJUmSl2U16pn/UwUgb+uFcfLER4OwV4i15WAjNhI57w731erC06
 hugKXoH+O0gli0BIrCJhA==
UI-OutboundReport: notjunk:1;M01:P0:mgP/KsQ1j+w=;VXVP5tlwhhOsu5zRUZHAkwNbmQy
 oZKBUr3TSROsFeATig2RmL0TCwh7mo4axZpCz51nOWAYUOpk8BK+xfHWMNIu3fRlpmq1K3uY/
 aEPESKbMNNcWoLvCl8xKo6Co4tLEsIMlw7YHHiYEWW5hWkXuoxUvtHnKv2rTLN4Rosgn7uhIT
 mrWMNApWLYI7eeTv80G6j+F67rxp19easmfTGYtgwXmvPvOSLE9po/4DLIn+0U770PM+yvsJn
 hiS0VGtnFUm59HaVzxBAS9nFDLt9w0JIAqhS4utFS+uwX/185sV6CE3HRZpyhC8/D3xbDATd0
 SJ1MgP4EPaXJ3RLwQCHLlOjy9iPd9N03tWoaSc5DTEEU+TtkfFautItgLctE5wkj9Le6d/qht
 l1CexZXbh/+WWbGWeelzK7TdCdRZe8Qi1Vj6tBhB3ZBR6qQiSE8+jM/7q81cH6xHJp7j3RRn8
 FIHZT7iGMtEcpNTEk8I5gMRarI93hznNjpG4tzGxwc6Y+34++jX+wW76ekHRDunJLm4ZfVcTa
 QLVJpBd/9pInv15BWvKNXCiKX8HtlJfVIR6RUbSIB3wPwom1BqbY8uM53867i38yyfGQBr+7K
 i3QWJMV/jKbJode8vLoaS9270BPgSQGciLybloStJT+nim+CN3zv4GbvBx/n87GGr4mM2PLO+
 k0Lj0C+9EyBaDG328PBfk71TEjCgjxTKYEeBIm3ta0cL5o7NN5cxtYNMzz/OcyMy2+TGwFx55
 rQDCFRHM7zDEhoIDbiITCRD63YI1ynefdOHewbn21sG1fdnpxH4hcG61ryaHyvL8sYVQZxwWk
 bdyf+BKNwuVOvHukS+V/Ug2wc3rnTBhnY/+5DpJq1mugs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718217124; x=1718821924; i=fiona.klute@gmx.de;
 bh=Bs4fHAb0P3DYoDwda1sQXf5unQa1CyMDhixGY8Lu72M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BQ4LggP23+pVo2KM7HqGD/zn/QJryZC81clT9n/QbnoYZeUntEzUyEgQm4jFewIm
 EeIB0ucEIThIDiS5a2M9RVG4rOu6xoquUKFiBSNpZlXIEZHeLfD7C1ghM9CbM+qJd
 NotbG99RpQjHDgqJC9yvpD8NYX3cOUyng81dxt6pD7OABMqI9zf+2lSqzTL4PgV2D
 4cItEH8TuG6QmyLfM+2NmFWqXMlS9WDHbRotIBYkSEtdhez08nfw9kFTk3mwfjwKR
 Mk2qgp5O/5Uu2Z8dCYqhmfNMBCWk0YTlvG4fNi0km+uZIJJQcMljJNdfaRb7Q7bYB
 cy631jnaOaj+G/Yw/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BQ4LggP2
Subject: [Buildroot] [PATCH 2/4] package/openssh: fix init script indentation
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This brings the script in line with .editorconfig settings and other
newer init scripts.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 33571b592e..ff6bbb0844 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1166,7 +1166,7 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openssh/S50sshd lib_sysv.Indent lib_sysv.Variables
+package/openssh/S50sshd lib_sysv.Variables
 package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index f1ff9dfec1..6ee0fc6b86 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -41,18 +41,18 @@ restart() {
 }

 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
 esac

 exit $?
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
