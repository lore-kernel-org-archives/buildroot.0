Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828D8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 12:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB7F60BA8;
	Fri,  7 Oct 2022 12:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB7F60BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fymf9tnhBOm0; Fri,  7 Oct 2022 12:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D7DB60B9D;
	Fri,  7 Oct 2022 12:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D7DB60B9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3BE1BF338
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79D6F401CC
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D6F401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZtQo-Mm2lznI for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 12:40:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB46E400AF
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB46E400AF
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 12:40:47 +0000 (UTC)
Received: from opfedar04.francetelecom.fr (unknown [xx.xx.xx.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar22.francetelecom.fr (ESMTP service) with ESMTPS id 4MkSb13wZVz2xQW; 
 Fri,  7 Oct 2022 14:40:45 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 07 Oct 2022 14:40:43 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 7 Oct 2022 14:40:43 +0200
Message-ID: <22269_1665146445_63401E4D_22269_436_1_6b44a0c69cdefac160c38dfa526662d35a77ec0e.1665146097.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1665146445;
 bh=pGyl4k80RyGCfia8eNHkuA1wdGxgjfDAVEy0dLng6wY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=F+wj2qjCYepk8ekXaVZINLTk4o3MEm+GDE1gwnpL2FSxULijzUmyKM0RmjaSm/R7k
 YESxYiIVNwaWFANkmwcEoTV5fqx0pKadkrd/x+tCqxpa3qcEnJw37ccECbvTRbrfRt
 1iNJqxWnzp1OjBzQ+BiUQV1wxQAxTrO/K0dkQPvNoX9MgyGOfdPwDPOXLm+0qw/mon
 Va225dY8brtvNcFOYhrivjBM0d8tNKL+PDAzFS8tSLPBACpBfBZGqk6hXz4360Owyv
 4kYMF5diCaikobvhJdXkZzkOqtHOqIc3msDLqd9ipnA5b9RC3Kj5ZOxNuAMotnkzbX
 mzpl7/wnNEFrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=F+wj2qjC
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: add host variant
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mosquitto can be configured to use password files. Those have a very
trivial layout, with one "username:password" tuple per line, not unlike
Apache's htpasswd file format, but unlike htpasswd files, the password
can be either in clear (boo!), or encrypted (by calling into openssl's
libcrypto).

Encryption of passwords is done with an ad-hoc tool, mosquitto_passwd,
again very like Apache's htpasswd, but the encrypted form is different
(of course). This encryption is handled by mosquitto_passwd, which can
create, update, or delete users, all while storing their encrypted
password, or it can also convert a password file with clear-text
passwords into a password file with encrypted passwords, e.g. it turns
each "foo:bar" entry to their corresponding encrypted form, like
"foo:$7$101$yLPgk5fn46d....==".

It can be very interesting to maintain a clear-text DB of
users:passwords in configuration management [0], and only convert it to
encrypted passwords when embedded on the target.

Add a host variant for mosquitto, which only installs mosquitto_passwd.

[0] ensuring safety, confidentiality, and integrity of that DB is left
as an exercise to the user, and is clearly out of scope for Buildroot,
like storing the root password in the .config is.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host           |  1 +
 package/mosquitto/Config.in.host |  4 ++++
 package/mosquitto/mosquitto.mk   | 20 ++++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/mosquitto/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index f437ef680c..84517787cc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,6 +57,7 @@ menu "Host utilities"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
+	source "package/mosquitto/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
diff --git a/package/mosquitto/Config.in.host b/package/mosquitto/Config.in.host
new file mode 100644
index 0000000000..39e287ee89
--- /dev/null
+++ b/package/mosquitto/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_MOSQUITTO
+	bool "host mosquitto (mosquitto_passwd)"
+	help
+	  Only installs mosquitto_passwd.
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 12de2946b7..a95a2cac4d 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -128,4 +128,24 @@ define MOSQUITTO_USERS
 endef
 endif
 
+HOST_MOSQUITTO_DEPENDENCIES = host-pkgconf host-openssl
+
+HOST_MOSQUITTO_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	UNAME=Linux \
+	STRIP=true \
+	prefix=$(HOST_DIR) \
+	WITH_WRAP=no \
+	WITH_DOCS=no \
+	WITH_TLS=yes
+
+define HOST_MOSQUITTO_BUILD_CMDS
+	$(MAKE) -C $(@D)/apps/mosquitto_passwd $(HOST_MOSQUITTO_MAKE_OPTS)
+endef
+
+define HOST_MOSQUITTO_INSTALL_CMDS
+	$(MAKE) -C $(@D)/apps/mosquitto_passwd $(HOST_MOSQUITTO_MAKE_OPTS) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
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
