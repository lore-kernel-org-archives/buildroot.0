Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9942CC83030
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 509CA84042;
	Mon,  7 Jul 2025 20:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqHQU4Fa9fBy; Mon,  7 Jul 2025 20:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A488402F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A488402F;
	Mon,  7 Jul 2025 20:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C9F12E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D48641610
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efaQxLfYClzq for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68F6141712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F6141712
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68F6141712
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:05:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E3E476013B;
 Mon,  7 Jul 2025 22:05:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 22:05:50 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 22:05:50 +0200
To: Tim Soubry <tim.soubry@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250707112536.1644236-1-tim.soubry@mind.be>
References: <20250707112536.1644236-1-tim.soubry@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <d871d9705974df40317da21a018242c2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751918753;
 bh=MkRFtT6SXcEcvua/rXyFXki0wNaS1nuW970H3+FMr/I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P57mFBdUg8fYPxRarIPc3oR9KCLmhykKcdL8WWwGVCWUVo4akOJF+O49FTcPfBiOs
 c7OMICKWw2sGEaQ+UPZOuESnbo/P1iqKpO+HPe1j7+GnPTSuxDvu00zGtgoBZ4iJok
 azgnt9NT6U0LRH0i3SQjS29CX+4ljMZT6vBZohM5MCJanyXEiVdtmZpIviEnk9US4Z
 VO+IQZBkawu8hwEdaLWkFF7N6ywcTttn3J6Uq6ks7MPonCy4pP0V2M+LGiUoJ3DekP
 Mtym+raNsei74o3Y9S/WBhHfjN2ZWbvP+5RU18tsM6k9E9OhQp7WpIa/YIJ7iIE+fZ
 aoszCJNUTezaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P57mFBdU
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: Fix build error
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/07/2025 13:25, Tim Soubry via buildroot wrote:
> The error appears on autobuilder with the build using GCC14:
> FAILED: ncmpc.p/src_Styles.cxx.o
> In file included from ../src/Styles.cxx:7:
> /home/buildroot/instance-0/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: 
> error: expected unqualified-id before 'const'
>    39 | extern char *gettext (const char *__msgid)
>       |              ^~~~~~~
> /home/buildroot/instance-0/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: 
> error: expected ')' before 'const'
> ../src/i18n.h:22:20: note: to match this '('
>    22 | #define gettext(x) (x)
>       |                    ^
> [80/102] Compiling C++ object ncmpc.p/src_xterm_title.cxx.o
> [81/102] Compiling C++ object ncmpc.p/src_db_completion.cxx.o
> [82/102] Compiling C++ object ncmpc.p/src_signals.cxx.o
> ninja: build stopped: subcommand failed.
> make: *** [package/pkg-generic.mk:273: 
> /home/buildroot/instance-0/output-1/build/ncmpc-0.49/.stamp_built] 
> Error 1
> make: Leaving directory '/home/buildroot/instance-0/buildroot'
> 
> Starting GCC14 the C++ standard library includes libintl.h that 
> contains
> a definition of gettext which caused a clash with the definition 
> present
> in ncmpc. This patch resolved this build error seen in [1] by
> backporting an upstream commit [2] that renamed the internal gettext
> implementation.
> 
> Applying the commits of [2], fixes the build error [1].
> 
> [1] 
> https://autobuild.buildroot.org/results/cb2/cb292f2c99cdca742a8f52dbfc25f193fe513c6e/build-end.log
> [2] 
> https://github.com/MusicPlayerDaemon/ncmpc/commit/249b62fc9f5e3a653ebdd22da0d75fbe87069457
> 
> Fixes: 
> https://autobuild.buildroot.org/results/cb2/cb292f2c99cdca742a8f52dbfc25f193fe513c6e/build-end.log
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

Applied to master, thanks.

For info, I added a mention of gcc-14 in the commit title.
I also fixed a check-package error by removing the patch numbering.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/a52269e221bf73ea4b2521e2297ab13bf3c687d0

Also, as a suggestion of a followup patch, this ncmpc package has
a v0.52 release published. Maybe you could propose a bump for it?
See: https://github.com/MusicPlayerDaemon/ncmpc/releases/tag/v0.52

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
