Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E876C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 06:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2672C60F57;
	Fri, 11 Jul 2025 06:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnEhc0lkUJvG; Fri, 11 Jul 2025 06:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A0660F6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A0660F6C;
	Fri, 11 Jul 2025 06:01:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9025114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99C4B60F74
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz7AY--r6g2b for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 06:01:54 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E14060F57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E14060F57
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E14060F57
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:01:53 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id DE318BDE403E;
 Fri, 11 Jul 2025 08:01:49 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 11 Jul 2025 06:01:49 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Tim Soubry <tim.soubry@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot
 <buildroot@buildroot.org>
In-Reply-To: <mailman.7.1752148801.2060525.buildroot@buildroot.org>
References: <mailman.7.1752148801.2060525.buildroot@buildroot.org>
Message-ID: <62efa9f78ee42286cfbd1cc75c7faf5b@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1752213710; bh=pMaXTRwil7h9yLMZwXVjjdgtadmlwa4uwgR8Agvaqwk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XMILjTnJXpT35Z0O4+X3zuC9BRxj9hqPzlSYZ4BF918/rTX2T4iAkpgiGd64/+a+t
 CK4BwX2JL3v9aZTWhTcSd3vkAvDLMCogT+/HxyKw88qW8CXU5IVwwZMvE6T66kx7kx
 v8TvSTruFltLfiVQSlaBUt7ihSgiEbdZ1msgI2TY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=XMILjTnJ
Subject: Re: [Buildroot] [PATCH 1/1 v2] package/ncmpc: bump version to 0.52
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tim,

On 2025-07-10 11:24, Tim Soubry wrote:
> 
> Applying version bump of ncmpc to version 0.52 as proposed in [1].
> As from version 0.50 of ncmpc, fmt got added as a dependency [2]. This 
> was
> also added to package/ncmpc/Config.in and package/ncmpc/ncmpc.mk.
> 
> For release notes, see:
> https://github.com/MusicPlayerDaemon/ncmpc/blob/master/NEWS
> 
> Comparision between version 0.49 and 0.52:
> https://github.com/MusicPlayerDaemon/ncmpc/compare/v0.49..v0.52
> 
> [1] 
> https://lore.kernel.org/buildroot/20250707112536.1644236-1-tim.soubry@mind.be/T/#rb3b968fff23bac0298e33f473d63a1ad470d38e3
> [2] 
> https://github.com/MusicPlayerDaemon/ncmpc/commit/c3b0055d06f8e8efab7f388646beb7645b90d063
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>
> ---
> v1->v2: Fixed indentation & readded the libatomic dependency for spark
> patch which was previously removed by mistake
>  ...cro-my_gettext-do-not-define-gettext.patch | 199 ------------------
>  package/ncmpc/Config.in                       |   1 +
>  package/ncmpc/ncmpc.hash                      |   2 +-
>  package/ncmpc/ncmpc.mk                        |   3 +-
>  4 files changed, 4 insertions(+), 201 deletions(-)
>  delete mode 100644 
> package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch

It seems the libatomic patch needs to be re-based for ncmpc-0.51 due to 
changes in the executable dependencies in meson.build:

>>> ncmpc 0.52 Patching
Applying 0001-meson.build-add-atomic-dependency-for-sparc.patch using 
patch:
patching file meson.build
Hunk #1 succeeded at 231 (offset -1 lines).
Hunk #2 FAILED at 448.
1 out of 2 hunks FAILED -- saving rejects to file meson.build.rej
make[1]: *** [package/pkg-generic.mk:239: 
/home/data/test/autobuild/build/ncmpc-0.52/.stamp_patched] Error 1
make: *** [Makefile:23: _all] Error 2

The autobuild failure that initially made this patch necessary uses a 
rather ancient toolchain:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y

Since ncmpc from version 0.47 requires C++20 [1] and Buildroot requires 
gcc10 [2], this regression test is now obsolete; newer Sparc toolchains 
seem to handle libatomic without creating an explicit meson dependency.

So you can probably drop this patch.

Kind regards,
Andreas

[1] 
https://github.com/MusicPlayerDaemon/ncmpc/commit/776e97b7a1f99e01d0d93bcbedbdc1736aad8ae6
[2] 
https://gitlab.com/buildroot.org/buildroot/-/commit/d07edd1e4f4e790196bf31f87e071aa9de1cc789
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
