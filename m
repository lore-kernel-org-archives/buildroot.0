Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD14CEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A71F4848BF;
	Fri, 13 Feb 2026 19:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nH_DCZ5rwt4s; Fri, 13 Feb 2026 19:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C7A4848BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011553;
	bh=1iHv/BZGwjxb9qK6pzw4szOyAzQGPah8pvRYOoecFPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mSVOA4tKTp93rN8FtQdcGPb0E4vaxHjHxsWuFV16eat12B9MT1+kvGh40obDGqbUZ
	 QDcpraJoW7pcS4ALPOuhV6eeKXHESgYGKX0eGBXsJ3ahldBvu+kkmPMgh+yZLReY/y
	 oNjK99eKqmc65Qmnl9/nyZ35LChyPccMekQZ9LCU0JPKcg0oHscoSOd+jImPolD/Wx
	 GQ6gCmjKafrvDHRQapbSpcnDh9WPkd+gcm+THYsfffr3npwUOm2S45XIB2tv8PSpuP
	 sPfPlfAmtsWnytkBSlEfeh+qKBzPOfrrYpQ/Vm9uaOPrhsImFPHBtuj+IO2ap3zSLk
	 UIHP09jmdVzjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7A4848BB;
	Fri, 13 Feb 2026 19:39:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56A7D69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 718F1412D7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMvsbKdty3Sn for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 467DC412DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 467DC412DC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BB5183DBC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:05:58 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cc3d9fa6ba3f8661be8fc83bbc113864bf2287b6
X-Git-Newrev: d4db2cf370489f3125a62402aec554271ef5390a
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.3BB5183DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/php-lua: add
 comment for lua dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4db2cf370489f3125a62402aec554271ef5390a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 995196ea5ada97a76cf05cce4556ed8284f8063c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
