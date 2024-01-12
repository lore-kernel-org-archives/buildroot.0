Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913CAC4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26ADA60B38;
	Fri, 12 Jan 2024 18:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26ADA60B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LDjsLwKq9HT; Fri, 12 Jan 2024 18:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AABC60BE3;
	Fri, 12 Jan 2024 18:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AABC60BE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15F8B1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E015C4037C
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E015C4037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUKr_fPej5ps for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A398A40108
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A398A40108
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F8E884BE2; Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 19:43:37 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 85efbb32ecdeee03c915a5e55662fca02489afe5
X-Git-Newrev: d76820414a19508ae15b859c1ac306a9c2a82b65
X-Patchwork-Hint: ignore
Message-Id: <20240112184656.8F8E884BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cups: add openssl
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d76820414a19508ae15b859c1ac306a9c2a82b65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

openssl is an optional dependency since bump to version 2.4.2 in commit
433fd541eaa37db3241eed16df6ae1f51d81335b and
https://github.com/OpenPrinting/cups/commit/3e9f2c04d620cccf2a09c43791ed9d8bb717c9da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2c76fbbfcb5b6bc86b2f9b9bc7a6c890068f61a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 4bc5eeedee..3a7c5f1e85 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -54,8 +54,11 @@ CUPS_CONF_OPTS += --disable-dbus
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
