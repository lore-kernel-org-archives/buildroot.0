Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D6BCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 10:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 448E7821CD;
	Sun,  3 May 2026 10:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKqxmkPozn75; Sun,  3 May 2026 10:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8676582275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777805412;
	bh=HbL8Fa9C96nfKnB7WFF9iqoFl2igZwUm9Sz5qbLkOfo=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sDHTBarGW6WpBxfO0E9sY5bZN674mdqgkIh1X0T7BRIjRztyOAgjcz3CtzLWUcQXs
	 NBz1JNNaESoIulhP+w8IVwYthyxtr/+YFrEAUWDQgLmdoYWAOOmwxUdY/Fkf6BXPLp
	 Q9CVGA6tQwI//+JlA9Pa3EWkb/NX/cCJbt1kJ4Nb4qJ3dKQoDqxGlEtnjncJSoMDhD
	 5+Z46w9y2fTtVG10+SCSNJY0xkh2dBFeVKjC/NCchDLO5Ua5wMsvwa7AYtUHDNXKuy
	 CBY+qN8t6GZiZyegRlesm5lVW5fX5sA4umdwi63Nf+T3b3DfnTYfGz41b6mHU9tiGm
	 vPvIn5aL9qDIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8676582275;
	Sun,  3 May 2026 10:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D76F127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23ECB82275
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VS2QNHj1hP2O for <buildroot@buildroot.org>;
 Sun,  3 May 2026 10:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCA65821CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA65821CD
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCA65821CD
 for <buildroot@uclibc.org>; Sun,  3 May 2026 10:50:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wJUOl-000227-5V
 for buildroot@uclibc.org; Sun, 03 May 2026 12:50:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 03 May 2026 12:49:39 +0200
Message-ID: <pan$a3e45$309a5928$ce7abbe0$c6885c1c@ID-313208.user.individual.net>
References: <20260502143839.1511519-1-bernd@kuhls.net>
 <afcSf1Ijjwe35gdX__15610.9446122841$1777799830$gmane$org@waldemar-brodkorb.de>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/asterisk: security bump version
 to 23.3.0
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

Am Sun, 3 May 2026 11:16:47 +0200 schrieb Waldemar Brodkorb:

> Hi Bernd,
> 
> it seems the cleanup bug of menuselect is back:
>>>> asterisk 23.3.0 Building
> GIT_DIR=. PATH="/home/wbx/buildroot/output/host/bin:/home/wbx/buildroot/
output/host/sbin:/home/wbx/.nix-profile/bin:/nix/var/nix/profiles/default/
bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/
make -j13 ASTVARLIBDIR="/usr/lib/asterisk" ASTDATADIR="/usr/lib/asterisk" 
ASTKEYDIR="/usr/lib/asterisk" ASTDBDIR="/usr/lib/asterisk" ASTLDFLAGS="-
latomic" OPTIMIZE="" -C /home/wbx/buildroot/output/build/asterisk-23.3.0/
> CC="cc" CXX="/home/wbx/buildroot/output/host/bin/x86_64-buildroot-linux-
gnu-g++" LD="" AR="" RANLIB="" CFLAGS="" LDFLAGS="" make -C menuselect 
CONFIGURE_SILENT="--silent" makeopts
> make[3]: 'makeopts' is up to date.
> menuselect/menuselect --check-deps menuselect.makeopts
> menuselect/menuselect: error while loading shared libraries: 
libxml2.so.16: cannot open shared object file: No such file or directory

Hi Waldemar,

afaics the bug never went away, tested on buildroot master as of today's 
commit fdcbe271afd6a3150cc0449b99df360e82064d06 with this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_ASTERISK=y

still errors out:

>>> asterisk 22.8.2 Building
[...]
Generating input for menuselect ...
menuselect/menuselect --check-deps menuselect.makeopts
menuselect/menuselect: error while loading shared libraries: 
libxml2.so.16: cannot open shared object file: No such file or directory

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
