Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA3DC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE83B40487;
	Sat,  5 Nov 2022 22:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE83B40487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywLI8Cn80ZFp; Sat,  5 Nov 2022 22:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0396D40153;
	Sat,  5 Nov 2022 22:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0396D40153
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 280E21BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10CD140153
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10CD140153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5F33dl6S_OwB for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:43:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF9D3400D9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF9D3400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:43:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF32E240003;
 Sat,  5 Nov 2022 22:43:28 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:43:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105234327.454f3151@windsurf>
In-Reply-To: <20221102181803.104116-1-fontaine.fabrice@gmail.com>
References: <20221102181803.104116-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667688209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGg1FsqmRYZ3XgQZMCVBBpl8EYi1nOqv6N/IzsxrXFY=;
 b=lM4wORp/a0GG7Cpxrl/VCz39VvxQ6sqAdYNE+pJHvuwZobOFinNcN9iC4Qpm1c8wMm1LV+
 RS5vqGoIYseV8h3yHHa8FQSAc/3eF+wNuiarOQZQ3MObFMwtOIlECm+jy9BzHvAalu+Mn1
 s6TqATk6Ua7UF1Y+PP7pvb7S0bIMwYAsWIrpfJtrQtOBqenrzZYGpuFNCis0Stf7+jxxDk
 TNtVFaaA9INk6SG1KXDrz1gmd1m9jajxMQtZKQXgkC0QxXAnz144z0xNLcz7dQ6bNWgVKu
 OUNWm0EeSvMLSnS2no/CmN3esmyB821qitq6GVZffqs/3/YqmXizHECwdbN9gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lM4wORp/
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: fix build without
 makeinfo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Nov 2022 19:18:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable documentation to avoid the following build failure without
> makeinfo raised at least since bump to version 1.6.10 in commit
> f0faa3b71c585cb70bcd6fa4bafb756b98130bd5 (and probably since the
> addition of the package in commit
> 663f39c88c01593855c18355a4decdceeffd884b):
> 
> /home/buildroot/autobuild/instance-0/output-1/build/freeipmi-1.6.10/config/missing: line 81: makeinfo: command not found
> WARNING: 'makeinfo' is missing on your system.
>          You should only need it if you modified a '.texi' file, or
>          any other file indirectly affecting the aspect of the manual.
>          You might want to install the Texinfo package:
>          <https://www.gnu.org/software/texinfo/>
>          The spurious makeinfo call might also be the consequence of
>          using a buggy 'make' (AIX, DU, IRIX), in which case you might
>          want to install GNU make:
>          <https://www.gnu.org/software/make/>
> Makefile:442: recipe for target 'freeipmi-faq.info' failed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ac6ff1c746a354f885fc1674d10e7bff9e536134
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeipmi/0001-add-disable-doc.patch | 72 +++++++++++++++++++++
>  package/freeipmi/freeipmi.mk                |  2 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 package/freeipmi/0001-add-disable-doc.patch

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
