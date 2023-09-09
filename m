Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D8CEEB58C
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 13:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C4A140A64;
	Sat,  9 Sep 2023 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C4A140A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6A4n6uhG8lcf; Sat,  9 Sep 2023 13:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A56B4064D;
	Sat,  9 Sep 2023 13:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A56B4064D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E57B51BF321
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 13:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AF3660F4C
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 13:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AF3660F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtdVQ89L83LA for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 13:55:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D77060E96
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 13:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D77060E96
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C2E0FF804;
 Sat,  9 Sep 2023 13:55:54 +0000 (UTC)
Date: Sat, 9 Sep 2023 15:55:53 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230909155549.15a4b507@windsurf>
In-Reply-To: <ZPxtEfe6FVIucVWS@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694267754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/Eey7kit0KcH/7IL4bu8bx8efYTa3g+kxCiX9sRsic=;
 b=Q7XAfYbgkaDtE5vS6Z+zT1MrXTscKM4sMxZCaJOi8j2grdFJkmbbjZJuGvW7rtlafTgYdt
 L5NkLh07DWdzkto9nMAL6FSxpjuvYV1VFnMpL7G3NOLhT8BPq/Stugl6FuQaAgPpkOCA4r
 Q2nNcmOBj9vJ2ROpMvTbMO4P6kcTlGBIo78v/6VGQz0Ddxb7MUpz5cXpUnxdqede6Ix/3E
 3pihM+Hfp6gNNdeAEqwAC9uNzH8nxC1tiXtuNMQBYIOyP7OLN2snBwFG6AEodVGLh8syWp
 fKgCk5XeMQIPSaoQtOFpcOfNizYHts9R9Jf7HfFGcBWRw6/b+O7dbnDIINJcEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q7XAfYbg
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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

On Sat, 9 Sep 2023 15:03:13 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Thank you for your solid review.
> Apparently I haven't done my homework very well. Sorry for that.

Ah, ah, no worries!

> > Where does this dependency come from?  
> 
> I'm pretty sure that I read that CRIU does not compile with musl
> somewhere, but it seems like it does when I had a closer look.
> I will remove it.

Good.

> > > +	select BR2_PACKAGE_PYTHON_PIP  
> > 
> > It needs pip on the target? Seems odd.  
> 
> What I actually need is host-python-pip as it is used during the
> installation step. Is there a way to only select the host-part from the 
> PYTHON_PIP package?

For most packages, selecting them is useless, and actually most host
packages don't even have a Config.in.host option to select in the first
place. So having host-python-pip in your CRIU_DEPENDENCIES variable is
enough.

However, a package that needs pip during its build process kind of
raises a red flag. Is that package using pip to download/install
additional Python packages during its build procedure? If it's the
case, that's not good, as this downloading of extra stuff by the
package would work around the download logic and legal-info logic of
Buildroot.


> > CRIU_CFLAGS = \
> > 	$(TARGET_CFLAGS) \
> > 	-D__WORDSIZE \
> > 	-D...
> > 
> > However, this is odd. Why aren't those flags set by the package
> > Makefile?  
> 
> I actually took those flags from the yocto recipe [1], but at least
> _GNU_SOURCE seems to be in the package Makefile anyway.
> 
> I will remove __USE_GNU and _GNU-SOURCE.
> Do not know about __WORDSIZE though.

But what do you have it here, then?


> > > +	$(CRIU_MAKE_ENV) $(MAKE) USERCFLAGS="$(CRIU_CFLAGS)" -C $(@D)  
> > 
> > I don't understand how this can know which cross-compiler to use, you
> > are not passing it anywhere as far as I can see.  
> 
> Hrm, I had CROSS_COMPILE=$(TARGET_CROSS) at first, then I though I saw
> that $(TARGET_MAKE_ENV) had it set.

TARGET_MAKE_ENV does not contain CROSS_COMPILE. TARGET_CONFIGURE_OPTS
does, however.

> Unfortunately, my last test was was on x86_64, so I did not notice it
> was wrong.
> 
> I will put it back.

One good thing would be to have a runtime test for criu, in
support/testing. Julien Olivain (in Cc) can probably provide some
guidance here.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
