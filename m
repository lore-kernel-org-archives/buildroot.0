Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058AE748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 17:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 075AC81E9F;
	Sun,  1 Oct 2023 17:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 075AC81E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Uswn5-7s9hm; Sun,  1 Oct 2023 17:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44FAC81E96;
	Sun,  1 Oct 2023 17:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44FAC81E96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1B01BF45A
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C5DB81E96
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 17:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5DB81E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sk3b8MQtWn5Y for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 17:06:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B50D881E55
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 17:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B50D881E55
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CB381C0003;
 Sun,  1 Oct 2023 17:06:52 +0000 (UTC)
Date: Sun, 1 Oct 2023 19:06:51 +0200
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20231001190651.2cb8a547@windsurf>
In-Reply-To: <20221024174911.75444-1-abrodkin@synopsys.com>
References: <20221024174911.75444-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696180012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k23fy3xPc6Jzl48zrmHNGgeqewvT0q08ZatHDmq/Bag=;
 b=KC6eGXEBd84EfCVZQ+mrNsAU7B5plm1sITkhFZo67XcWW+exVN9cW2ZA0z0BkSJKPnCsKQ
 ca83Fl0e5qIPUzGRdSILRMiPN2CYw2XE2ARQeQru/qGmwx7CTfDLsfso/KxuA8mQQrLvPx
 g0+cs3f3cOCU7Dm3vQ30rb5VnptlpF223CjNgSCGk48H0nSW9M8WgKvRfB4mHwn4eIP+pY
 h5bFrNl53hmc5dIiF9yFmJuLZPo7bBBzRo8oenYRRC2Pd5rT4V+Uk1j+J+p2VkOS1p+QbN
 Cc+ZNH4E8zFr52y+1v4ns2e24a4m8x3xIErMGFwJwo+5Q5Q0P9nB4+ZOGIzLrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KC6eGXEB
Subject: Re: [Buildroot] [PATCH] package/numactl: point to target libs via
 LDFLAGS
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Mon, 24 Oct 2022 19:49:11 +0200
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> In the commit a699a667bd64 ("package/numactl: add -latomic to numa.pc")
> we opted-out from unconditional linking with "-latomic" and made it
> a conditional based on real availability of __atomic_fetch_and_1()
> in the toolchain. I.e. for many targets "-latomic" was not used
> any longer.

We finally looked at this patch today during the on-going Buildroot
hackathon. We understand/recognize the problem, but we don't like the
proposed solution as you can imagine (especially as the proposed
solution is package specific). In addition, and as you have yourself
expressed, your situation is quite a corner case.

Here are the options that we see to resolve this:

(1) Patch libtool so that it doesn't look at LD_LIBRARY_PATH. We are
    already patching libtool to work-around other issues. However, from
    a quick look at the libtool code base (which of course is not the
    most pleasant exercise on earth), it's not trivial to see where
    this logic is taking place.

(2) Unset LD_LIBRARY_PATH entirely in the main Buildroot makefile to
    avoid interference with LD_LIBRARY_PATH being set. This would of
    course prevent people who have special/weird setups that require
    LD_LIBRARY_PATH from using Buildroot.

(3) Warn/error out if LD_LIBRARY_PATH is set, which essentially is a
    variant of (2), but where we are explicit instead of silently
    ignoring LD_LIBRARY_PATH defined in the user's environment.

Regarding the setting of lt_cv_sys_lib_search_path_spec="" that you
have identified, the motivation for this was explained in
6246704008ef219257f30a824903855d0e00cffb:

    package/Makefile.in: ensure libtool doesn't search host dirs for libraries
    
    Commit 7e3e8ec040b (CFLAGS/LDFLAGS: don't add -I / -L args for STAGING_DIR)
    exposed a lingering libtool problem.
    
    Unless instructed otherwise (using -L) libtool will search its built in
    system path for libraries, and use those instead if found. The default
    search path is '/usr/lib, /lib, /usr/local/lib', which is no good for
    cross compilation.
    
    Fix it by setting the system search path to the empty string, effectively
    disabling this feature.
    
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

So this seems to still be relevant. The reason why when you drop this
in your case and it "works" is we believe the following one: due to
-latomic, libtool will search for libatomic. It will find it in your
system in say /lib or /usr/lib, and because that's a standard search
path, libtool will keep -latomic instead of turning into a full
absolute path. So the cross linker gets passed -latomic, which it
properly resolves to the target/sysroot libatomic. When
lt_cv_sys_lib_search_path_spec="" is there, libatomic from /lib or
/usr/lib isn't found, so it finds the one in your LD_LIBRARY_PATH
directory, which isn't a standard path, so our dear libtool replaces
-latomic by the full absolute path to libatomic, and passes that to the
cross-linker, which of course blows up.

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
