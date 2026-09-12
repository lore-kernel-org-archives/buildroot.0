Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADA8C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 16:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB4180E44;
	Sat, 12 Sep 2026 16:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7z-BCiO3tKQs; Sat, 12 Sep 2026 16:50:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0887280E58
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789231845;
	b=e7BkiDPZA0ZomDaAXst7Kl8Xc++5ZGtBHEPFKw2GkHNOJXLTzxgergiGtbsXz0YsBoa/
	 88wK1UyaGny/l0662fR/VJgkOWK/Ew7Y9Tkw9tNTVMYbj6dfqb1IxqtX7F1l+2+PUROj2
	 6HRtmT4uX4cU31ahTnRUwGMukaOQGGoOBtHAOwD8AieFuDZVp3B8XIqhnDYlUCxgybPul
	 wO3/myOHIB3MX7pwEuDrhliu2ymAR+6AN32gEUZ5q1Y7fYTvmTLx4aAKwOtt8voUUGtpP
	 t5VmkLdqR+iVYPpupdECQqyfTYSjYYsNFP+3UCixHFxoe5DwLXUPQ1yJ9Cmkb4XPJOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789231845;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=eYA1Zpxc/760yrdygGXK0fzF691FTWCekVNeV+va17g=;
	b=irQaFMbHyokMCO76unl5mqOU5amH6nc8ZwCUMgU1QXQq1bIByp2jvN1ytzTkMfUEs/S8
	 sYWRCbG4AskDjBtcMSrXMqcsZXIMYggHXMjr77Oh+X0Czk1oTEVhjIEzqYBJBcUgvxCHu
	 dEyOtbGlFJyc1P1RROmTJ+dK9GqqH8PMbTa/K0sYUQsSXj9iSwt7q1eTtxau0oATufxxp
	 xFE5H3T3GZE8mJyrCXYPbkZeOIa+BovwCkiWZ0khZdVrKjswfnXguEJlSJmJdnHMSAT4e
	 mNxAYLxjbs4yXM8hbREVnO/WitZz0w0utdro/+5WDia1TRbLLye9pxfQQukqN9Xcvkg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789231845;
	bh=eYA1Zpxc/760yrdygGXK0fzF691FTWCekVNeV+va17g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KJGJ4jrJLmdLMOe+4+0V35vbPL5oQ6trCpYcvL/Jwrj6kEpm3gyg80990Xa9qUDbw
	 1KhgKNe5Y2qgPtiZ6ulasex5YOHNG8clvSXhhs92xHyn/mRAwXNlsNlTS0Zj+l9yGb
	 2CPWAzXFhHKYH1YCeqmqbyBCXmJmEthmnBvI8F6PxiNVWBgaOjATMKAM/CaQFJjJBW
	 PJUARbAzFs8UYioISDANJrN7r9aPPuL5B3WOhZRCO+ksOCML23o5KS+to518BZdW0b
	 6kAFf0KtbWarAzkU+WW4+V1ZQaUHS9gHek1DVVbABkL80w5Hg3Zvn/oycdH+aQMEJ8
	 I26FB/kDAAE0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0887280E58;
	Sat, 12 Sep 2026 16:50:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5FF2E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 16:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54A09605FD
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 16:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDL1Fln5C5MK for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 16:50:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B8F22605F3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789231842;
 b=r3PHqSoAC/s1Wvjk5CDzkbWMj3zweHXOrsCx2Utk+RvpOGyr0J+M9JtnJ1ypUc9RUBkF
 jKsQ2XlegSKKNMtj+V6dhcgRmSSgZz2+tH2yl7/dU7Zqm7a6KwuDHnadhVWDmdQ5Z9cGf
 NqxMN53pknPpk0rbdw/mF8NaaiVwkA2CBVXkxTfUHD0zAFKdH7aOw7JdlB4ee/ZcE5b+S
 kpqMXFDFC3T+aRchXBS5cg42v4oktO1afT3m92wA1X6XHoU2Lh0OLEy5dqMDQl2ZF3jiR
 gC5Yj44LsXh5t29arYiUy4p4Trel/dyJ4lU3SLm3e2PbnutmAu2m2RLkG7+lboer1Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789231842;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=qqauFJXvMYybK+5szDCtuhtd42+UChSlaZBPmcXx+Ow=;
 b=PioA2k44IWtxBGJeuFyldcujube91d0+wBreiQE+gdfovsOkyVP2tLjEl2bKdFPOyJlJ
 kxSru/sHV60lm3urmME1Q8bLpO5D+fRZijz0uKhUlm9PLCTGpMJOEYDvi2cKYB+MQVukZ
 N5oMe4Mdbb8WDJfIYZBsXp+PWIvtTuYFWDIcbF7cy8dIS5x9/+LoCadjMWHSFdlDY+RZi
 z8ZCFelUmM6j82M6mp0Im24EEcDqlRnPJA0Ca+Y9sba74ffKYk1OLgYUKyPgtvtBMukKb
 tSKyuHNklReZvHS+F9paTOX40n0Ilxb9hiW9RBfhXSYOf/aetpQLKf8nIw+3mYh/tpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YelcY7RV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YelcY7RV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8F22605F3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789231836;
 bh=qqauFJXvMYybK+5szDCtuhtd42+UChSlaZBPmcXx+Ow=;
 h=From:To:Cc:Subject:Date:From;
 b=YelcY7RVYnLvesEWbKqKMJH4Lj4xF7kzJlUxGhwWyaJu2RYIzVuSmUUG6FuaLn39I
 OLu296IQl11uOomkyJmMpW/2+Z5s504QKB13d4HUiPznJGbAAgAd3HyrdwZI8CR1dd
 F5JjnSotmPN6PhSli1todti0MmxP1HUBlPYLalAL6yB7Z3q6UsJje01FltdMvrHZOU
 twt0aOuWqSaP0rVBLEuzRSdE2OfUfTs6QAIK9wQFOudxNLIjoxVRNg6OI8A4xEjc57
 P1RfPBeTXgHEbL/e7U6zU3U8FidKOv+4fzTFx0xrJqoQtS+AkSgVu+p2LtFARksPwi
 J5qp5HG4HSETQ==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8BD5BA4C0602;
 Sat, 12 Sep 2026 18:50:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42224)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5Qw0-000000005Wt-0beD;
 Sat, 12 Sep 2026 16:50:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 18:50:36 +0200
Message-ID: <20260912165036.903715-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/ruby: bump version to 4.0.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.ruby-lang.org/en/news/2026/07/14/ruby-4-0-6-released/
https://github.com/ruby/ruby/releases/tag/v4.0.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5c38faee0f48d52c8daf40090aa688574dee9369

 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 453c028d22..f62a3fadb0 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,6 +1,6 @@
-# https://www.ruby-lang.org/en/news/2026/05/20/ruby-4-0-5-released/
-sha256  5dc5521ea54c726e6cc10b1b5a0f4004b27b482e61c04c99aed79315e30895e5  ruby-4.0.5.tar.xz
-sha512  379d78a6d1af0455df60da46551f43438ad3ee81f83787554fc34cb1c8febb1bd363e3dc1a057b34a69f96526efc308d3dccc4b87d368897c2d1ccf179096463  ruby-4.0.5.tar.xz
+# From https://www.ruby-lang.org/en/news/2026/07/14/ruby-4-0-6-released/
+sha256  9c9d121fe3314ea7c801e690b9de981d2b9d12d7849db99c27482468a541ba0a  ruby-4.0.6.tar.xz
+sha512  c9c391675a098b5a27dd687571ab0a164c788cbb8ddcbab6d17a3e8b3c4ba389346b2e6d7807d38db3e74d225c70e378a296d60d0f465cb0fcec9702242c83c6  ruby-4.0.6.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index eae9db2156..bea1820f74 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
