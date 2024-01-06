Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3BDC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 053D58401B;
	Sat,  6 Jan 2024 09:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 053D58401B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U48Bg6Je7UNN; Sat,  6 Jan 2024 09:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C12183E88;
	Sat,  6 Jan 2024 09:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C12183E88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 033891BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF79840493
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF79840493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfwjfiHHo7q7 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF643403B3
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF643403B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9A2C8459D; Sat,  6 Jan 2024 09:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:51:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3e72fe95693800f13b0b18dd1c5ce78e92a1281
X-Git-Newrev: f2c76fbbfcb5b6bc86b2f9b9bc7a6c890068f61a
X-Patchwork-Hint: ignore
Message-Id: <20240106095218.A9A2C8459D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: add openssl optional
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2c76fbbfcb5b6bc86b2f9b9bc7a6c890068f61a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is an optional dependency since bump to version 2.4.2 in commit
433fd541eaa37db3241eed16df6ae1f51d81335b and
https://github.com/OpenPrinting/cups/commit/3e9f2c04d620cccf2a09c43791ed9d8bb717c9da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/cups.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 2ad5eeb5cf..620b61d748 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -51,8 +51,11 @@ CUPS_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-CUPS_CONF_OPTS += --with-tls=yes
+CUPS_CONF_OPTS += --with-tls=gnutls
 CUPS_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CUPS_CONF_OPTS += --with-tls=openssl
+CUPS_DEPENDENCIES += openssl
 else
 CUPS_CONF_OPTS += --with-tls=no
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
