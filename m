Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA72C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11EAC608B7;
	Sat, 12 Aug 2023 12:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11EAC608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOcpZu_4_ydA; Sat, 12 Aug 2023 12:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC4E60B78;
	Sat, 12 Aug 2023 12:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC4E60B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41C081BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1688D607EC
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1688D607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdU5VYGce2vG for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:21:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4286606AA
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4286606AA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 646E4240003;
 Sat, 12 Aug 2023 12:21:17 +0000 (UTC)
Date: Sat, 12 Aug 2023 14:21:16 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812142116.0f92a04f@windsurf>
In-Reply-To: <ZNXHcDjCcjLhkR7Z@waldemar-brodkorb.de>
References: <ZNXHcDjCcjLhkR7Z@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Spam-Score: 200
X-GND-Status: SPAM
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691842878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AcdKIEx183L6RiblPzJZp9speFodHSCcenqqGv4Ja7s=;
 b=gNfJx9kTGzEp18C6YKFL3eDTHOmxp8d1Moz05kyFgKYsC5SFA8HcsV0G1WVEDgCUmPcHgQ
 +Y2Iqm6QstryBnUD9XfhD/oyKGFs2D9MX43xu7ZUVL4p+xm4mlDm0NWkOxnTEteAggqo+2
 EKSdvCKUw7LVpSLFrKti8oKN2RFsdp2XqQ1CjHZvAqlQM5vn5k/NdqAgPe3JsMSu5zRaiE
 QQLqcs33NyQxv8wNj8eXQbjYvr8P8+CHxrdsGs9nFaFFMnTLoSYHpqwpQ9JeuP2tEHSfW5
 a4RgcIAJUjF3h14YWEQPurfOAzWp/E7pufp4fliGB9ixfD5lkXRTn/67ccYN1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gNfJx9kT
Subject: Re: [Buildroot] [PATCH] package/cairo: fix pthread detection
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Bernd, +Fabrice,

On Fri, 11 Aug 2023 07:30:24 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Cairo configure fails to detect pthreads, because of the following warning
> binutils 2.39+ emits:
> ld: warning: some.o: missing .note.GNU-stack section implies executable stack
> ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> 
> Then the build errors out with:
> error: #error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/2c4/2c4b983248b25ed6769c91d8b687c54434068eb7
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/cairo/cairo.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, however, we already have two previous proposals to address this issue:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=&submitter=&state=&q=cairo&archive=&delegate=

The one from Bernd being identical to yours. I'm not sure which one is
correct. Building the entire cairo code with -Wl,-z,noexecstack just to
solve a bogus configure check seems a bit strange to me.

Since Bernd's proposal came in before yours, I've kept Bernd's patch in
our list of patches to review.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
