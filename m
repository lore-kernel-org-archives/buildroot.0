Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0F6C04FEE
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 19:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D844E41FC2;
	Wed, 20 Sep 2023 19:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D844E41FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZMqvfWJeynz; Wed, 20 Sep 2023 19:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB5341FC8;
	Wed, 20 Sep 2023 19:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABB5341FC8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75B2B1BF2AF
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 19:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50CB541FC8
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 19:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50CB541FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPbfJGSpsEXG for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 19:32:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3338641FAD
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 19:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3338641FAD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EBC940002;
 Wed, 20 Sep 2023 19:32:30 +0000 (UTC)
Date: Wed, 20 Sep 2023 21:32:29 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920213229.7f6670e9@windsurf>
In-Reply-To: <20230918201623.2639458-1-fontaine.fabrice@gmail.com>
References: <20230918201623.2639458-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695238351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yAhUEj4jCdq2gcHCo2TUZzQXF9uGUzhvBxYs4lsBDNw=;
 b=NoTOC821d7slA7TWyc5yqr0kA+sVq7GKxmGU8hQQqBpqprH+ZLmEK+NcsWIdVxmGYj3c5b
 c1DeUwFc08Nfb6jPHEZxhEllVSx0yU+6Sq+LWaqqM0JVd8hUpip2Sd4l8mHHbNzOH13AJQ
 bvQX2FD1Rh4nO86cL5cZhUUlXh/OfG9TK1NwaHezQQDHmTEmSDZ7Ao7/rTAe/pcee7oIDq
 Lou+G3He1+sdXdfVQu8MCafc8jMJINDgbHtG6MkkiDKrhD+EuO216rV5ZZ+SmJ8oTYXK+o
 JY1SWWyFiEYlQRN43qv5XcZlJ98ef5yRU79XvxlKG++iCPZQEwKRlUemBAXb9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NoTOC821
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: fix build with gcc 4.8
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Sep 2023 22:16:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 raised since bump of snmppp
> to version 3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:
> 
> configure: error: Cannot find suitable libsnmp++ library
> 
> [...]
> 
> configure:9496: checking if libsnmp++ can be linked with flags from pkg-config
> configure:9528: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_XOPEN_SOURCE=XPG6  conftest.cpp -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib -lsnmp++ >&5
> In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/snmp_pp.h:71:0,
>                  from conftest.cpp:92:
> /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/uxsnmp.h:628:35: error: 'nullptr' was not declared in this scope
>       CSNMPMessage *snmp_message = nullptr);
>                                    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f272473e7b588f5390b183072935a0217290ee4e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/agentpp/agentpp.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. That being said, I think ideally it should
be the agentpp build system that passes -std=c++11, rather than having
Buildroot need to know about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
