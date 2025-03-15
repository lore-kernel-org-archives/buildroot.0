Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B29BC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 15:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0D360655;
	Sat, 15 Mar 2025 15:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flf9vmZmf3Gb; Sat, 15 Mar 2025 15:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970D3605BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970D3605BB;
	Sat, 15 Mar 2025 15:39:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9945C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D590340CC4
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAyLG2xEeQ0g for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 15:39:27 +0000 (UTC)
X-Greylist: delayed 18179 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 15 Mar 2025 15:39:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F17E540BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17E540BFC
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F17E540BFC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:39:26 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 4A52BBDE8140;
 Sat, 15 Mar 2025 16:39:22 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 15 Mar 2025 15:39:22 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <08a08980c182a0ba4ad445382eab1105@free.fr>
References: <20250315103547.1083333-1-br015@umbiko.net>
 <08a08980c182a0ba4ad445382eab1105@free.fr>
Message-ID: <77edd974844f26a7ab9b995592016882@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1742053162; bh=jG7Wm7XSQKFJroqo8CuoAZjCTF9v5GFDv0ztuYJhCfw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=d6oZRGDCIX+lRLNF2hFekbHnq2MgTcoT6SAbH34wWgcG/fwcJh4N7tyt5p2x7bGnP
 z2nY9yR/650+ABqqulOs3NCChPTOSP5HnSu+YKEyOVxfj+j22SoQbAXydtqMAts+Tu
 xGufqdwAKWzzHobL9gXGDVmtKOTMdvoxcbJb6YD8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=d6oZRGDC
Subject: Re: [Buildroot] [PATCH 1/2] package/mpd: remove spurious host-gcc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

Thank you for the fast update!

On 2025-03-15 13:53, Julien Olivain wrote:
> Hi Andreas,
> 
> Thanks for the patch!
> 
> On 15/03/2025 11:35, Andreas Ziegler wrote:
>> mpd is not intended to be configured as a host package, none of either 
>> the
>> direct or the optional dependencies of mpd have a dependency on 
>> host-gcc, so
>> drop the dependency on BR2_HOST_GCC_AT_LEAST_8.
> 
> This host-gcc dependency was introduced in Buildroot commit:
> https://gitlab.com/buildroot.org/buildroot/-/commit/6ed7036464541e06b241a5a71d3e39d932410ddc
> 
> It seems during the mpd build, this host C++ 17 string_view is still 
> used:
> https://github.com/MusicPlayerDaemon/MPD/blob/v0.24/src/tag/GenParseName.cxx#L8
> https://github.com/MusicPlayerDaemon/MPD/blob/v0.24/src/tag/meson.build#L12
> 
> It's also still used in v0.23.17. We can see the invocation in the log
> when compiling with "make V=1 mpd".
> 
> So I think this host dependencies should be kept. Can you confirm?

C++17 (now C++20) in the toolchain compiler is intended, but the mpd 
build should not rely on the host compiler. Let me check what is going 
on and I will resend the patch once I have a solution. Meanwhile, I 
marked both patches as "Changes Requested".

Kind regards,

Andreas

> 
> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
