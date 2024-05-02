Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8AC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 10:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11389825DF;
	Thu,  2 May 2024 10:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ct24sdXvvj5Y; Thu,  2 May 2024 10:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DE3825E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59DE3825E8;
	Thu,  2 May 2024 10:02:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 348741BF863
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 10:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 206A260879
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 10:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAwOyQMhSVuE for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 10:02:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02E8F6084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E8F6084F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02E8F6084F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 10:02:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 615D62003EE;
 Thu,  2 May 2024 12:02:36 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36278])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 May 2024 12:02:36 +0200
MIME-Version: 1.0
Date: Thu, 02 May 2024 12:02:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <f5ecc25e82957dfe5938eb52af816eaf@free.fr>
References: <20240420132251.1349622-1-ju.o@free.fr>
 <20240501215523.5bc7ce23@windsurf>
 <f5ecc25e82957dfe5938eb52af816eaf@free.fr>
User-Agent: Webmail Free/1.6.5
Message-ID: <df3e5518e98e13c79a52bf3e9fdccb38@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714644157;
 bh=08/YGw5DB7EPGK7vr294xzEoVZpYxMEhPJabF+THOqo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lEDPuRGgBxQNfam9E/0rkF62G3WbqO3HJhvoWOM3OiRIKTierIZsbcKepseSumYsy
 r8LHcw/vdv31+cS0Jzw5FLIRQUG/gDGNJQLljnc9nVRwRdTZT7y0zq6WsmPS4zQ2Yk
 S0MxSiOiGJvHROaCv6Of9LIiznzKnnJ/jKSDFyCfNNxgsXLZZRpBmYNocCxVs0JIjv
 OMpmQcVs+TcCA2qH3RTmaUOiWGE9TqiDhZcpMZxj3sRF4V1HgtWKci6zrwxziJu+xJ
 zdKWOf8Fk0lZZai25kpLw6BRZXci0FbJSdNgmts3eVA3ixpOUA7K1tOKVpcmGRpxGP
 AQap7U8K40fcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lEDPuRGg
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: disable parallel build
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi again Thomas,

On 01/05/2024 22:27, Julien Olivain wrote:
> Hi Thomas,
> 
> On 01/05/2024 21:55, Thomas Petazzoni wrote:
>> On Sat, 20 Apr 2024 15:22:51 +0200
>> Julien Olivain <ju.o@free.fr> wrote:
>> 
>>> fwts randomly fail to build in parallel with error:
>>> 
>>>     mv: cannot stat 'dtcompilerparser.tab.c': No such file or 
>>> directory
>>>     mv: cannot stat 'prparser.tab.c': No such file or directory
>>> 
>>> This is a known upstream issue. See:
>>> https://github.com/fwts/fwts/issues/7
>>> 
>>> This commit workaround this issue by disabling parallel builds.
>>> 
>>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>>> ---
>>>  package/fwts/fwts.mk | 3 +++
>>>  1 file changed, 3 insertions(+)
>> 
>> Hm, I don't see any failures in the autobuilders. Did you encounter
>> this issue personally? Why don't we see it in the autobuilders?
> 
> On my side, I see those failures on systems with with 20 cores and more 
> on an
> idle system doing only the Buildroot build. Maybe the autobuilders have 
> a
> different load, or less cores?

After testing a bit more, it appears the build always fail with
GNU make 4.4.1. Testing in the Buildroot docker reference image with
the same conditions (20+ cores, idle system), and which includes GNU
make 4.3 does not fail.

Looking at the host load, it seems GNU make 4.3 serializes some part of
the build, whereas GNU make 4.4.1 parallelize most of the build (and 
fail).

FWTS uses the .NOTPARALLEL special target with prerequisites:
https://github.com/fwts/fwts/blob/V24.03.00/src/libfwtsiasl/Makefile.am#L67

It seems the two versions of GNU make are not honoring this the same 
way.
It also seems the .NOTPARALLEL _with_ prerequisites is a feature added
in GNU make 4.4. See:
https://git.savannah.gnu.org/cgit/make.git/commit/?id=f6ea899d83bf00fe9201fde0ca9cf7af8e443677
https://lists.gnu.org/archive/html/help-make/2022-10/msg00020.html

Finally, the FWTS Makefile rules might also be incorrect, at:
https://github.com/fwts/fwts/blob/V24.03.00/src/libfwtsiasl/Makefile.am#L67

Quoting the Make manual:
https://www.gnu.org/software/make/manual/html_node/Parallel-Disable.html
"""
If the .NOTPARALLEL special target has prerequisites, then each of those
prerequisites will be considered a target and all prerequisites of these
targets will be run serially.
"""

Note the serialization will happen on the prerequisites of the target
set as prerequisites of .NOTPARALLEL.

My current understanding is that GNU Make 4.3 just ignores the
prerequisites of the .NOTPARALLEL and interprets it as if there
was none, which makes it serialize a bigger part of the build.

With this analysis, I may have an idea of a patch in the FWTS
Makefile.am. I'll do some more tests and propose a new patch.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
