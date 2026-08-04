Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC66C55838
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 414EB60774;
	Tue,  4 Aug 2026 16:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfPym7jUeVJm; Tue,  4 Aug 2026 16:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3716060B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785862171;
	bh=H7Y8rPh9sjiHvgOYYjFRujM8yIHNeJB9U7H/6iN0ZSw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fs4/t9ScJ6YgW913S8z+hH3FjZRTrBH6JEEhFC7pdbbMbcHueT0kDhwy8tjRZA57C
	 oPnmH/ZEDWlz+uyeB+cspMRa7Y1xcA1cHtg7JgYWyHrn8yZZPSpAXVIYSeRR0YyHW0
	 lzE3msef3RHG6GjqEourAhHWm45g210MPfMf9H42Oz0kFjp6gwEtjEZ4hUB6doLu7Z
	 8tLZipoEbNchClrZNGVtFo9N3dKsLQWyyfW1GcrUCdClW+eNHEWs5GlReQ3QKev2Ph
	 rJt1J8TC8NYOyOiFWq0ybJZJmcMSOcrWiq4a5yXyOyXUG9S23w1oKr7ATqeZyx1tv8
	 A9aEE/d4Lsm7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3716060B;
	Tue,  4 Aug 2026 16:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA26F350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0753405AE
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyexAQUxFyNq for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36F840595
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F36F840595
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:49:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D395A8BF64; Tue,  4 Aug 2026 16:48:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 18:31:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d046fd08833f91a1ed3bdfdb6394dc3b70fd92b0
X-Git-Newrev: d80d38a551ca6c8a027d541d47abe440639c4976
X-Patchwork-Hint: ignore
Message-Id: <20260804164843.D395A8BF64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: add support for the LC3
 bluetooth codec
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d80d38a551ca6c8a027d541d47abe440639c4976
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The bluez5 plugin can encode and decode LC3 (Bluetooth LE Audio) when
built against liblc3, but the meson option was unconditionally disabled.
Enable it when BR2_PACKAGE_LIBLC3 is set, using the same conditional
idiom as the neighbouring opus and aac codecs.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pipewire/pipewire.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index c5127b9a9d..9f66db0f55 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -20,7 +20,6 @@ PIPEWIRE_CONF_OPTS += \
 	-Dspa-plugins=enabled \
 	-Daudiomixer=enabled \
 	-Daudioconvert=enabled \
-	-Dbluez5-codec-lc3=disabled \
 	-Dbluez5-codec-lc3plus=disabled \
 	-Dcontrol=enabled \
 	-Daudiotestsrc=enabled \
@@ -129,6 +128,12 @@ PIPEWIRE_DEPENDENCIES += fdk-aac
 else
 PIPEWIRE_CONF_OPTS += -Dbluez5-codec-aac=disabled
 endif
+ifeq ($(BR2_PACKAGE_LIBLC3),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-lc3=enabled
+PIPEWIRE_DEPENDENCIES += liblc3
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-lc3=disabled
+endif
 else
 PIPEWIRE_CONF_OPTS += -Dbluez5=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
