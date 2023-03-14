Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804F1C74A5B
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 12:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E05408A0;
	Tue, 14 Mar 2023 12:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03E05408A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWPLjnDcYiYr; Tue, 14 Mar 2023 12:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2655404EB;
	Tue, 14 Mar 2023 12:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2655404EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E17BD1BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE1FD402D1
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE1FD402D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5J6424KcJouP for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 12:47:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 699EC404EB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 699EC404EB
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 12:47:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 134DCE0002;
 Tue, 14 Mar 2023 12:47:10 +0000 (UTC)
Date: Tue, 14 Mar 2023 13:47:10 +0100
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230314134710.5cb2c988@windsurf>
In-Reply-To: <20230314121507.2597723-3-sebastian.weyer@smile.fr>
References: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
 <20230314121507.2597723-3-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678798031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8RzemXgkj+15ByorQqbPKqOYgojOpC6+8DgE8h2flI=;
 b=ZbRQ1yEja6wRXYdjC1VmXZTX9WLIX7EW38jhzFxI06v9IlvRoaG1FA7bJNstYDUrGsHMSa
 hEDf9Ts7p4UAY+rk9AA54p7TTo72EzoECJBQYEBOn44fv/Df5wgfBWpGYCExxKUvp1ehDI
 OeBKJEpxgWlcetw2hmjIEVSvYSEDJvoCJeau6oRAe9y/Vx2f+OZsWVdHcWubh9+m9ZKjCR
 95DsY8vfgQQWr7Tt/eJ5x8gp3vTtTz432ssU3K7piBllcZQEfl7N1LkyAfU09Ab3qM8mT+
 z5BGT4sjlKnp0rgsRvrYYbRVtQj5cZqY49RFe+q4JbQ8UkHGAhKkUtmx/larGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZbRQ1yEj
Subject: Re: [Buildroot] [PATCH 3/4] package/coreutils: rename package
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sebastian,

On Tue, 14 Mar 2023 13:15:05 +0100
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> In preparation for the addition of a virtual package providing the
> coreutils functionality, the package package/coreutils has been renamed
> to package/coreutils.
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>

As it is proposed, this patch will break existing configurations that
have BR2_PACKAGE_COREUTILS=y enabled, as the option is being renamed.

A solution to that would be to substitute package/coreutils by a
virtual package *and* rename package/coreutils into
package/gnu-coreutils in the same patch.

However, I'd like to challenge the need of turning package/coreutils
into a virtual package in the first place. Virtual packages are very
useful for libraries that have multiple implementations, but also a
large number of users: OpenGL libraries, zlib, openssl, jpeg, etc.

Coreutils has almost no reverse dependencies in Buildroot:

package/e2fsprogs/Config.in:    depends on BR2_PACKAGE_COREUTILS  # runtime
package/e2fsprogs/Config.in:    depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_COREUTILS \
package/glslsandbox-player/Config.in:   select BR2_PACKAGE_COREUTILS # runtime (timeout)
package/opkg-utils/Config.in:   select BR2_PACKAGE_COREUTILS if !BR2_PACKAGE_BUSYBOX # runt

So I really don't think a virtual package is needed. We can handle the
two coreutils implementation manually in the very few places where it
is needed, and perhaps where it does matter for people.

Virtual packages are not "free" in terms of complexity and code churn.
In addition, I am almost sure that uutils-coreutils is not a 100%
drop-in replacement for coreutils. Most likely there are a few tools
that are missing, or a few options that are not supported, or differ in
behavior. And virtual packages for which the different implementations
are not strictly compatible generally cause quite a lot of pain (see
the mess around libopenssl vs. libressl for example).

What do you think?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
