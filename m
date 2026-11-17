Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719E606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hi8mOx8J
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF1A60906;
	Tue, 17 Nov 2026 16:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95HGNzof-cxN; Tue, 17 Nov 2026 16:52:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E965D6081A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794934374;
	b=tHMA0hEZB47Af6fglL+8KCsBHtXsRUc7tywUY5UldR2urDsNmqvdKKIGGWIchOh09ZW9
	 I3EYSPn/e+ueuK0CmC683DBCMvhXGs08RIzOquufBp4LabDMWjrOEQipx0i6DGYmnkQf5
	 2h0ATTh50TrruvF8fP4o5PxAJqrnxdXIN9GNbPfo3/aSbhhbnjaWmQ+m925XPhRG9cqVN
	 oBkEqG1d32xvoMucyESoiaJ1b9jZvLEHWae9J6WwFc1aAY33sM6kz+a+iFTh0KPZ0NFoz
	 BviPppQQc8h0eJejt7u7JSY7v3etwhSHxV7L4UGFd9NxH0xQeJ9jYj+WkRPF/MFXVDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794934374;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iuzrmoJR351NqA2lTwYcHW5r50U6ivFfXIQGB6QJrD4=;
	b=B3ZyEAOKFszqmkVPhSO7tZUuV2P5VkN3ZyKAF5dkj4lGf347vePkzTywF2ZAP7Li+qIP
	 iWS8WPz3OYgxW4ntHQNKOxEtvWnAzBog7rkUnqpkhqxdBTRwzAe22MQoa28K67ECDEz8n
	 LbI4CXfLdHjZG7lvvBmWIe1lL4z2Vn0alTqpWhYAn8lg54nSrFnT95KLWyjOxacsWFP5I
	 6ZVdnKoQVsNHutq3xDkOPfNUKvp2QpaIoUvfvXbf3M9JzV/3MkSc+SBrdKIQHslmow+4C
	 DzRpxeugtb7X/O3y1qy0mzNcsb9rGIU8CXIhLWLs6bDJFdePQ7K2ik36OWCLVED5Exw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794934374;
	bh=iuzrmoJR351NqA2lTwYcHW5r50U6ivFfXIQGB6QJrD4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hi8mOx8J7YkLdJDYl1TckHVQJ1KtuQ+jpbt7yZwOhkeKBYwTxCWmAoIGQxxYl2pv5
	 19FRMOCCYs/vpOP4nN9iYi+XHki0VOPDSoVergTnKlZZN3lnEaRv2hmSr96g6pBQj9
	 Penzk4H9/AyVLCjDnehUdiKyJ4vX9YoAWEvHFLHg0tLLD+iK60Arir17vsjBHQUP0t
	 jLPFQeiRw3UBTjQ+S1f+BsukC89c6HUKNeY4ctCJl5W4T54HX/62JxMFg2oPa8cspV
	 xw+CUIfLuqoNcj4SFRiqtdza+8NrcNAIBhid44TqVOs25fNCSjLOYHenwlOgxQClnS
	 +L2RpBf86GVwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E965D6081A;
	Tue, 17 Nov 2026 16:52:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ED1EA0E
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 16:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80A26811EF
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 16:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pSn0pHFHf-q for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 16:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B6DC5811ED
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6DC5811ED
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 16:52:49 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794934368; mf=PHBzLnJlcG9ydEBnbXgubmV0Pg==;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.net;
 s=s31663417:rsa-sha256:Af1UIhPjELmE4Zl4Em6h77zlfF2X
 X8JaSV/q8HKiFqr+MDNSubxknvnpnunCVkK6zzd2yJKo+ipEZ7gzx6Wp7SZvRyCjP2dNp6fMNS6
 WcgrlhJb9NrxzL0vgQgXzsIvoJ5wsMv2gXpz5fqnTDZO2a8WWZ9RX9s/xXme6QJE1zVwxNA+J9/
 HjAvXeCh3bfmfigA9Xmbo/WNq7beBHteCLZ7ndu68uPGFd5A8xPvglSvo6X+wfxUuNDtyvuhIak
 MYUIsl3knyzVsYZbtFXf4almFU9wGfalkUWEXqx9BgigSAvwhBS6KlvVwc6EW9ixVjcoH0Pdczh
 UTX1lVbhOaKo2g==;
Message-Instance: m=1; h=sha256: Sq74XSdLkmwgKgjYKhfxlrNFza6mqnlP5nrcMVbv5kg=:
 Q7+YQAwdRPAZvbYqA5RwzNQQIbx1rQ6Oi6YgMamZIsM=, sha512:
 /iT6ejhFofPSxON1QUYpuJRK2xoCMnUjLaqkb91tRy2yF6UuGYy74uHfk8gzZT4ooZzni5RZyqrjU55c43DyTA==:
 YVmWWJDVP/gK3TuSiVhaCJbfzgYh43jIRaPloSuqC9cjnkEHD8xPd+VaL1KkCuk4UPwcM+g3af1fQNDbzv+Q6Q==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MStCe-1x0Jkm21Qk-00VPx2; Tue, 17
 Nov 2026 17:52:46 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>, Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Nov 2026 17:52:43 +0100
Message-ID: <20261117165244.2866822-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:J8wE3oWItf1esFEXcNsHa8KpVWwmXKhBfLItK0Udih/dsbo4dpZ
 NVDYYqm51M3tj+ycO6lS1gIUkmtENHBpW6T5WWwOmuBDU0ELU+MfN5I76oLXbzp4UfyGl1w
 ifJh+z4IJIEOTSkUdsZk6PqT2UaYfaiNQIM4ae1jH+4KtLQ87GiJrTk0vlERvYnOWEuxh/v
 LBw9bfR3R4lb69b1LN5yg==
UI-OutboundReport: notjunk:1;M01:P0:FjnVG61N2oU=;SjKDFQYrJg5K8diDdiiHRb3xdfM
 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
Subject: [Buildroot] [PATCH v2] package/eudev: bump version to 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 3.3.0 (for details see [1] and [2])
- disable new/optional systemd-hwdb (not needed on target/host)
- add '--enable-tpm2' for target and '--disable-tpm2' for host compile
- add new group 'clock' to common udev package ([3], [4])

[1] https://github.com/eudev-project/eudev/releases/tag/v3.3.0
[2] https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md
[3] https://github.com/eudev-project/eudev/commit/bce05987bfea5cda8060f59159becb7de7353a46
[4] https://github.com/eudev-project/eudev/commit/82956a47e9191f4c1d8a8ceacaeaf1a9d7581847

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - disable systemd-hwdb
 - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
   (as suggested by Fiona Klute)
 - add new group 'clock' to common udev package
   (as suggested by Fiona Klute)

Notes:
 - This version bump increases the target install size from 11.8 MB to
   14.0 MB (according to graph-size). See following (uncomplete) list of
   installed file size values:

   eudev-3.2.15                        eudev-3.3.0

   /lib/libudev.so.1.6.4  199K         /lib/libudev.so.1.7.15  339K
   /sbin/udevd            435K         /sbin/udevd             927K
   /usr/bin/udevadm       459K         /usr/bin/udevadm        979K
   /lib/udev/scsi_id      139K         /lib/udev/scsi_id       275K
   /lib/udev/cdrom_id     139K         /lib/udev/cdrom_id      271K
---
 package/eudev/eudev.hash |  2 +-
 package/eudev/eudev.mk   | 10 +++++++---
 package/udev/udev.mk     |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 0e24957621..58aa19b695 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
+sha256  8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef  eudev-3.3.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 0deb0e53c6..94634f4405 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.15
+EUDEV_VERSION = 3.3.0
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
@@ -14,7 +14,9 @@ EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--libexecdir=/lib \
 	--enable-kmod \
-	--enable-blkid
+	--enable-blkid \
+	--disable-systemd-hwdb \
+	--enable-tpm2
 
 # eudev requires only the util-linux libraries at build time
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
@@ -79,7 +81,9 @@ HOST_EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--disable-rule-generator \
 	--disable-selinux \
-	--enable-hwdb
+	--enable-hwdb \
+	--disable-systemd-hwdb \
+	--disable-tpm2
 
 define HOST_EUDEV_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 3518e874a5..507c1b8022 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -6,6 +6,7 @@
 
 # Required by default rules
 define UDEV_USERS
+	- - clock -1 * - - - RTC/PTP device group
 	- - input -1 * - - - Input device group
 	- - kvm -1 * - - - kvm nodes
 	- - render -1 * - - - DRI rendering nodes
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
