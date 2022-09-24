Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C61FC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB62C60E0F;
	Sat, 24 Sep 2022 21:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB62C60E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDUP9W7ZdAaJ; Sat, 24 Sep 2022 21:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244CC60C04;
	Sat, 24 Sep 2022 21:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244CC60C04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57E901BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFEAC40155
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFEAC40155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkmIEMZ3RdR4 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:42:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA06D4014D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA06D4014D
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:42:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A2FB240002;
 Sat, 24 Sep 2022 21:42:09 +0000 (UTC)
Date: Sat, 24 Sep 2022 23:42:08 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220924234208.40b41dea@windsurf>
In-Reply-To: <20220924210621.106813-1-fontaine.fabrice@gmail.com>
References: <20220924210621.106813-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664055729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yE8bLAPS93LRXIQUSLu8cYw+eYNGI2WZbX3pLRPDI7Y=;
 b=RPxiQe9mA1hapbvwZBGzVeZ49lHe5NIfa+q2HIxmzBrnComWdei/tzCjc79MQjyT/m4Ooq
 JyszpbhXPydgd1DPwCoq5afckujOeruA7hP0nM6Xwt0yAi9ms4pygxNRdNtUV4fRj80SIo
 +orRJHz9IzhmG9Dvxh9aVZk5Cs2GLL3siF6+Nx5mhJodK2hKtmfHQL7Nm3d2Jy+LTDNFj0
 i2v/gqbH/evM4wr0JA+hCtQlAOgkrYvDWe1zwualB09Si7c/gZVXp5hw70wLJrsWO5VUKc
 F1A7QC/gXop7MJwoxwYaBl+AtR+t75Ssxu7xdHnUC2KBSGfr1PKTL2ok0IYXSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RPxiQe9m
Subject: Re: [Buildroot] [PATCH 1/1] package/daq3: fix build without C++
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 24 Sep 2022 23:06:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without C++ raised since bump to
> version 3.0.9 in commit c05fe1d621c7c5147f687b39f61988918efec566 and
> https://github.com/snort3/libdaq/commit/c2ae4668fb4c8f53523a47f93a120c62364f3d02:
> 
> libtool: compile:  no -DHAVE_CONFIG_H -I. -I.. -fvisibility=hidden -Wall -Wmissing-declarations -Wpointer-arith -Wcast-align -Wcast-qual -Wformat -Wformat-nonliteral -Wformat-security -Wundef -Wwrite-strings -Wextra -Wsign-compare -Wno-unused-parameter -fno-strict-aliasing -fdiagnostics-show-option -I../api -DBUILDING_SO -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -c gwlb/daq_gwlb.cc  -o gwlb/.libs/daq_gwlb_la-daq_gwlb.o
> ../libtool: line 1763: no: command not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/48b4673f46c9065e97e95872f9aa947c4f3fc21b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/daq3/daq3.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
