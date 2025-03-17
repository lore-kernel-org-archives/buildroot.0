Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADEAC282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 08:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E60740C6B;
	Mon, 17 Mar 2025 08:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fL27ab8m4DzT; Mon, 17 Mar 2025 08:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF60340C72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF60340C72;
	Mon, 17 Mar 2025 08:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9EA16E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 08:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A6D81FA6
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 08:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2ZX7ujEaNYH for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 08:06:39 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1D0C81FA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D0C81FA5
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1D0C81FA5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 08:06:37 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 49AB0BDE16BF;
 Mon, 17 Mar 2025 09:06:33 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 17 Mar 2025 08:06:33 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <77edd974844f26a7ab9b995592016882@umbiko.net>
References: <20250315103547.1083333-1-br015@umbiko.net>
 <08a08980c182a0ba4ad445382eab1105@free.fr>
 <77edd974844f26a7ab9b995592016882@umbiko.net>
Message-ID: <0223b4bd9b2089361f1d75e7e117589d@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1742198793; bh=mE/VfT4QL7B6nIr/dN15p+i1On1LFsJtFNcoJwkGA6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=wQQRkVS/4kDvSXaP0Zq5vkiBAnDcOZkTc4Pasia8PTMrHeA+xC2nFagoUvgEvH1X4
 SAcWvMdEK7+ARtLFxuVh4z8IXeGmAMZ16zjqOI+rnHgU+8NiNwu9hPZMyQ/1a697fz
 U8Yc2ZM+xlzzjZJ6Cw4fcjVwzFzbkP+xTHknoizE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=wQQRkVS/
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

Hi Julien, *

On 2025-03-15 15:39, Andreas Ziegler wrote:
> Hi Julien,
> 
> Thank you for the fast update!
> 
> On 2025-03-15 13:53, Julien Olivain wrote:
>> Hi Andreas,
>> 
>> Thanks for the patch!
>> 
>> On 15/03/2025 11:35, Andreas Ziegler wrote:
>>> mpd is not intended to be configured as a host package, none of 
>>> either the
>>> direct or the optional dependencies of mpd have a dependency on 
>>> host-gcc, so
>>> drop the dependency on BR2_HOST_GCC_AT_LEAST_8.
>> 
>> This host-gcc dependency was introduced in Buildroot commit:
>> https://gitlab.com/buildroot.org/buildroot/-/commit/6ed7036464541e06b241a5a71d3e39d932410ddc
>> 
>> It seems during the mpd build, this host C++ 17 string_view is still 
>> used:
>> https://github.com/MusicPlayerDaemon/MPD/blob/v0.24/src/tag/GenParseName.cxx#L8
>> https://github.com/MusicPlayerDaemon/MPD/blob/v0.24/src/tag/meson.build#L12
>> 
>> It's also still used in v0.23.17. We can see the invocation in the log
>> when compiling with "make V=1 mpd".
>> 
>> So I think this host dependencies should be kept. Can you confirm?
> 
> C++17 (now C++20) in the toolchain compiler is intended, but the mpd 
> build should not rely on the host compiler. Let me check what is going 
> on and I will resend the patch once I have a solution. Meanwhile, I 
> marked both patches as "Changes Requested".

What I missed completely is that mpd compiles a small executable on the 
build machine, that is used to pre-process a C++ structure and generate 
a source file for the target build.

Tests with different compiler versions verify that mpd-0.23 builds with 
gcc 8 and host-gcc 7 (string_view /P0220R1 was introduced with gcc 7.1). 
The latest mpd version requires gcc 12 (project recommendation) and 
host-gcc 10; the parsed structure now uses the C++20 feature constexpr 
/P1143R2. [1][2]

Yes, the host-gcc restriction is needed, unfortunately. I will simply 
drop this patch and update the second one accordingly.

Kind regards,
Andreas

>> 
>> Best regards,
>> 
>> Julien.

[1] 
https://gcc.gnu.org/onlinedocs/libstdc++/manual/status.html#status.iso.2017
[2] https://gcc.gnu.org/projects/cxx-status.html#cxx20
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
