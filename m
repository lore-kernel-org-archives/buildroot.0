Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C890C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A67822EC;
	Mon, 20 Feb 2023 20:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11A67822EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1twqhjc0IzNz; Mon, 20 Feb 2023 20:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48535822E7;
	Mon, 20 Feb 2023 20:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48535822E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B61491BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 660CD822DD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 660CD822DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blM1n6CeUzWA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30850822D4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30850822D4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6B3C40004;
 Mon, 20 Feb 2023 20:51:11 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:51:11 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220215111.19dcba5d@windsurf>
In-Reply-To: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
References: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676926272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nr8Ln2SPKSnFYUQXJ/25yMLuqV1mZTng6rtfYN3Pzp0=;
 b=DpP2wsHcQvEl8oTDg1PZM4lQv5fH/dT3FRSW6E0pRSg1HLO7trCJ4joPrPANPaLG4Lb12e
 0u8ZXv8Dl7EqKwNfrvTgdk5Doe/mJNphX4FUBFyJXtygC8kjR53GrZM1LSYjFIYTWrUxxY
 gWwSkkLIupvCE8c4B8XzOlLugB3EZehqyIxRSjGL07AY8jynjCGUAUvWm/1LiDdvHQMBNh
 0x6Y4q4IytLlwe7jEQNi3RoxFrbeSmisoHb94VWLFfoDN+PXRME2aLMGW/FxHCm6GcL/I7
 jplBra4RxEHfhfnVQGHKfYCGrXqNeGz/m4RTI9uZS/gSN3mMlTtDqS98CV1qow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DpP2wsHc
Subject: Re: [Buildroot] [PATCH 1/3] package/libjxl: fix build with libjpeg
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Feb 2023 15:00:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Building with libjpeg will raise the following build failure on some
> architectures since the addition of the package in commit
> e648d399d8bd609697e78f13f7fa76be06d91a57:
> 
> /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc: In function 'jxl::Status jxl::extras::{anonymous}::EncodeWithLibJpeg(const jxl::extras::PackedImage&, const JxlBasicInfo&, const std::vector<unsigned char>&, std::vector<unsigned char>, size_t, const string&, std::vector<unsigned char>*)':
> /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc:126:34: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
>   126 |   jpeg_mem_dest(&cinfo, &buffer, &size);
>       |                                  ^~~~~
>       |                                  |
>       |                                  long unsigned int*
> 
> Upstream advocates to use jpeg-turbo:
> https://github.com/libjxl/libjxl/issues/1802
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9a2a7c6072876f2562609bf98f32a1ce93631a75
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libjxl/libjxl.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

To be honest, I find quite ugly the fact that only jpeg-turbo is
supported, but it indeed seems like libjpeg and jpeg-turbo are not 100%
compatible, unfortunately.

So: entire series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
