Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88811C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A19360F94;
	Sat,  6 Aug 2022 22:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A19360F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2JL68UhYr18; Sat,  6 Aug 2022 22:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A5BF60F85;
	Sat,  6 Aug 2022 22:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A5BF60F85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE031BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 162B1812A4
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 162B1812A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1rE8eKhNThM for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:13:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3EB881095
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3EB881095
 for <buildroot@busybox.net>; Sat,  6 Aug 2022 22:13:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 06BC460004;
 Sat,  6 Aug 2022 22:13:49 +0000 (UTC)
Date: Sun, 7 Aug 2022 00:13:48 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220807001348.351cd42c@windsurf>
In-Reply-To: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659824030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yg6nGY4OuvEYlXh6hyJfOmAFQZll61/TC/7lp7K858=;
 b=VoK1UiYJh02OUs78cmLJc6+wrH9fdhQ4XddW0wXzKee8Qf4szaiz4t9xhbBlEypM/JZ1uK
 7FPi8iCFSqtqLJN1tgdH3/cB/0akfNTo9TU/qBqdG6Flx3qBthG6PMBZAeux9zr69iOgwm
 RiFKjpE+evcF/mfmIlnGAQzGSh2pAwmcRdZTlXfUmrwFGy31qb29IDdvRtOvHEdb8nIE+z
 cmLiogRQRMkw7cWCHYirlxtk94pSNTyyoHTzbKflEt4rFp0nYECgeIEFbYy7owD0hQp8OZ
 +Rp1im3G/XdzQIdWWh1R1uGysOXgxvWndOCFdYQ84auuVLkHi1c63qtauBC+wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VoK1UiYJ
Subject: Re: [Buildroot] [RFC v3 1/2] package/pkg-meson.mk: support fortran
 cross-compilation
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
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Yann in Cc, as there is an open issue, see below.

On Fri,  5 Aug 2022 16:36:24 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> python-scipy is moving to a meson build infrastructure,
> and requires fortran cross-compilation
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/pkg-meson.mk                   | 2 ++
>  support/misc/cross-compilation.conf.in | 3 +++
>  2 files changed, 5 insertions(+)

I applied to master... but I went too fast, there were several
incorrect things in this commit.

+        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \

this is wrong: $(2) in PKG_MESON_CROSSCONFIG_SED contains the CXXFLAGS,
not the FCFLAGS. So I changed that to $(4), and passed FCFLAGS as a
fourth argument to this macro.

Also, you were missing setting FCFLAGS in the
PKG_MESON_INSTALL_CROSS_CONF macro.

I fixed this in a follow-up commit:
https://git.buildroot.org/buildroot/commit/?id=cd933d676f210789730ecb25b23d902620d72072.
I hope I got it right.

Now, on to the open issue which explains why I have added Yann in Cc.
We are currently setting the C++ compiler and Fortran compiler path in
Meson's cross-compilation.conf unconditionally... even when the
toolchain has no C++ or Fortran support. So it means we're pointing to
compilers that don't exist.

Ideally, the cross-compilation.conf should be generated with no
reference to a C++ or Fortran compiler, or a /bin/false reference, and
ditto for the CXXFLAGS/FCFLAGS when there is no C++ or Fortran support.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
