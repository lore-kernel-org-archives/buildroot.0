Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C9EEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 09:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255AC83C70;
	Thu, 17 Aug 2023 09:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255AC83C70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6_Js_SZj5U6; Thu, 17 Aug 2023 09:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A03B83C71;
	Thu, 17 Aug 2023 09:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A03B83C71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B576A1BF215
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 09:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB1841E08
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 09:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CB1841E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dF88QDjCpD6 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 09:59:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C198641DFD
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 09:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C198641DFD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51C75FF805;
 Thu, 17 Aug 2023 09:59:18 +0000 (UTC)
Date: Thu, 17 Aug 2023 11:59:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230817115917.3e2b374b@windsurf>
In-Reply-To: <ZNryrsoZV6f+TZll@waldemar-brodkorb.de>
References: <ZNiFAM4q72gwMume@waldemar-brodkorb.de>
 <20230814165343.2e3936c6@windsurf>
 <ZNryrsoZV6f+TZll@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692266358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jotPzZuxJfmjepiJwDKjvGRIJhClskrrBi1aGx5RHio=;
 b=UO6p6KBDWmwouK+q7DrYlWMBjZ3N+fO1dIEDNs+hQCj1i5e2wg/P8eSSNDtV0+OqCIm8l8
 Yb8OIafK0aZYd0sw5ZNXvD2Wt8rfFF5yWUq6ccA4tEk+ihe1cbgHnJhvpf59T5IfX1evDD
 p6NtpSoxVUNtrl3oiOb3cODVPbKS6HEcJSOMdcwW9+HhLufrbxFzAPL7HvlLpwp4wBW+az
 cB4Kr/qj9vfNnwZOxeFhyIxfty5IOfm67Ntx6eq3KfQz0mUCX4w7BB7fa/1s/p4qn1Eehj
 PV9K5OA3+KNmKACV811UCaq3reWQ5F9MUAA2A97tw5zF2aiavW4IXYgLdAyWaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UO6p6KBD
Subject: Re: [Buildroot] [PATCH 2/2] package/tcf-agent: fix uClibc-ng
 compile on ARM
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 15 Aug 2023 05:36:14 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> > What is the situation with musl?  
> 
> Musl works fine with static and shared without this patch.
> How should a v2 look like? 

Is there a reason why uClibc-ng doesn't support getauxval() with static
linking? If musl does it, probably it can be done?

Otherwise, if we want to stick to that, it could be:

# Some good explanation goes here
ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_ARM_INSTRUCTIONS_THUMB),yyy)
TCF_AGENT_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
endif

> > Also, shouldn't the horrible "#  define USE_getauxval
> > (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 &&
> > __GLIBC_MINOR__ >= 16)) || (defined(__UCLIBC__) &&
> > defined(__HAVE_SHARED__)))" be turned into a proper CMake test ?  
> 
> That might be something upstream should do. :)

Well, we generally try to have upstreamable patches in Buildroot, and
the project seems relatively active
(https://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/log/), so
there is a good chance to get our patch merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
