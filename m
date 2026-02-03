Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4262DE8B370
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 937AA4043E;
	Tue,  3 Feb 2026 22:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMO5ehFXBLz7; Tue,  3 Feb 2026 22:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D43403B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770158477;
	bh=wGQkkrxyxF8BGsFt7xOSU+RzoM533FuhALgPjRGA/hQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XH902IkI3FgqHm6crEukFC9ALHXVlpy0m7AP+6+aGy1dphEEzNAnnXsHDDVdCsUDK
	 /owUzMWKQNt2HZZZoEtcEwAS8V6lygRJ/OWCT71IaPnI+RIbltKM39Io+fllxjlmRL
	 PGKnG1yZeV+50dEn4vrtdza76sV/OJsW4D8QJa+U/6KEF04usSgGz/ZLMr8T9/8tR2
	 esIByPqakCx57J7fizHPwFKCobhdh91qYvKakcReNNYKaClcy/6OAxVWQWikTOd1LV
	 g/GydXQ9qpnnCQ41hCPv1UvlOfPBIIsuZTlOnKEipXizKeViANQT95uMtIOlRHNjqh
	 eXHCjStRAyyFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D43403B1;
	Tue,  3 Feb 2026 22:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35AB5F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E4D66059F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OByHquQ7ThVI for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C34600CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68C34600CB
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5128B867A1; Tue,  3 Feb 2026 22:41:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 23:39:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0821508c4c9eb30cf8e18d19ccfec1a01a80b90a
X-Git-Newrev: 995196ea5ada97a76cf05cce4556ed8284f8063c
X-Patchwork-Hint: ignore
Message-Id: <20260203224115.5128B867A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-lua: add comment for lua
 dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=995196ea5ada97a76cf05cce4556ed8284f8063c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-lua/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php-lua/Config.in b/package/php-lua/Config.in
index 923de2d799..9f43533fad 100644
--- a/package/php-lua/Config.in
+++ b/package/php-lua/Config.in
@@ -6,3 +6,6 @@ config BR2_PACKAGE_PHP_LUA
 	  OO-API to lua variables and functions.
 
 	  https://pecl.php.net/package/lua
+
+comment "php-lua needs the lua interpreter"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
