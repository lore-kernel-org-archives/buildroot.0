Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB44C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 12:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB268249E;
	Tue, 20 Sep 2022 12:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB268249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdVgjMb0ANvY; Tue, 20 Sep 2022 12:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F83D82419;
	Tue, 20 Sep 2022 12:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F83D82419
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 215C51BF35B
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 12:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04A8940C17
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 12:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A8940C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q80Grf9p-g-n for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 12:45:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E851440BEF
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E851440BEF
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 12:45:07 +0000 (UTC)
Received: from opfedar00.francetelecom.fr (unknown [xx.xx.xx.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar24.francetelecom.fr (ESMTP service) with ESMTPS id 4MX1Ts3PBTz5wv3; 
 Tue, 20 Sep 2022 14:45:05 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 14:45:03 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 20 Sep 2022 14:45:01 +0200
Message-ID: <8785_1663677905_6329B5D1_8785_15_1_b7ced13c9a2651fbf36d4009a03c0590457c82a3.1663677504.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
References: <a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX601.corporate.adroot.infra.ftgroup
 (10.115.26.29) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663677905;
 bh=BcqkYHmvzpPVWmcjHfDvAXo8UZ8+nCq1uWNKuyAdJxw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=hCdUJ2uOnmVNQ0ZU8DDI0jItQAgpn4dLITqRx8bnE4jlOlqu+WKkb1S98av6+YyBI
 UnfS8Qk1LYXo0DrpXUCj0smZnEq+/s06FpBkcd2Qyc9Nclplee31+FdRbSCS+uZe91
 IVt6dqBSo1BxooxWcmzz7BtNnPv+dTECQrsVNBm1B0FsapoeDKzQ1OPtFh7kGg8ErR
 rHJuF5HcVUSqtAt44EvOEMUlniuyJibXrV6LyMPXZzPaD5TvJbYoWkcR2j3i93W5gj
 jJyBCRfwcck9QMiv/1LXIKC8jXoOF40UmtF2MtYiGcKleaIDFS7CbgZCtZoVQzejYf
 l7fvEmFef4gsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=hCdUJ2uO
Subject: [Buildroot] [PATCH 2/2] package/gpsd: actually wait for after chrony
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

We use gpsd's upstream systemd service unit files, which define a
dependency on chronyd.service. And indeed, upstream chrony does
provide an example service unit file chronyd.service.

However, in Buildroot, we are not using chrony's upstream unit, we are
providing our own, much simplified as compared to upstream. We install
that unit file as chrony.service. Notice that subtle difference in the
name: upstream's is chronyd, with a trailing 'd', while ours just
chrony, without the trailing 'd'.

As a consequence, in a Buildroot-built system, gpsd does not wait for
after chrony is started, which causes all kind of mayhem when gpsd
actually needs to talk to chrony.

We have multiple options:
 1. use chrony's upstream unit file;
 2  rename the chrony service file as installed by Buildroot, to match
    what chrony would actually do;
 3. tweak gpsd's unit file to refer to chrony.service, not
    chronyd.service;
 4. leverage systemd's flexibility in how units are defined, and provide
    a drop-in to complement gpsd's unit to also wait for chrony.service.

For 1. it is totally unknown why we do have our unit file to begin with,
rather than use upstream's. Since upstream's is much more complex than
ours, using it might have unforetold consequences.

Going with 2. seems the easiest at first sight, but then it would break
systems where users provide their own drop-ins for chrony, as they would
no longer match.

3. is relatively easy, but running sed is not entirely nice. Besides, it
semantically should be a post-install hook, rather than a systemd-init
command, but again that makes things a bit more ugly. Also, some people
may have their own gpsd.service in an overlay or whatever, which would
break our fixup.

Solution 4. is pretty straightforward, although it is not ideal either.

To be noted: some distributions, like Ubuntu 20.04 at least, do install
the chrony unit file as chrony.service, like Buildroot does. However,
there does not appear to be any fixup in gpsd for this discrepancy, as
their gpsd install still refers to chronyd.service. So that does not
help us decide what to do.

So, eventually, we decided to go with solution 4, which has the least
impact on the system, and keeps the status-quo for all other use-cases.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Alex Suykov <alex.suykov@gmail.com>
---
 package/gpsd/br-chrony.conf | 2 ++
 package/gpsd/gpsd.mk        | 8 ++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 package/gpsd/br-chrony.conf

diff --git a/package/gpsd/br-chrony.conf b/package/gpsd/br-chrony.conf
new file mode 100644
index 0000000000..67a79e5f65
--- /dev/null
+++ b/package/gpsd/br-chrony.conf
@@ -0,0 +1,2 @@
+[Unit]
+After=chrony.service
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index b8526c0260..961ebde649 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -213,6 +213,14 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
+# When using chrony, wait for after Buildroot's chrony.service
+ifeq ($(BR2_PACKAGE_CHRONY),y)
+define GPSD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(GPSD_PKGDIR)/br-chrony.conf \
+		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service.d/br-chrony.conf
+endef
+endif
+
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
