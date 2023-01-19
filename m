Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908F7C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 20:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E89D410CD;
	Thu, 19 Jan 2023 20:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E89D410CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWgi-oDG9T_D; Thu, 19 Jan 2023 20:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1362F410C3;
	Thu, 19 Jan 2023 20:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1362F410C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A93E1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA4E982341
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 20:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4E982341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFEomSkC48Mw for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 20:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 487DE8227D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 487DE8227D
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 20:42:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.145]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwfWa-1oUV1f2v8M-00y8W5; Thu, 19
 Jan 2023 21:42:17 +0100
Date: Thu, 19 Jan 2023 21:42:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20230119214216.60f572b0@gmx.net>
In-Reply-To: <Y8j63Dj9XcD56e5n@debian.me>
References: <20230118213517.5946-1-ps.report@gmx.net>
 <Y8j63Dj9XcD56e5n@debian.me>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:og4fqi8lCSq+q5MbxzCAVEZVDuQ5RKsPJwKH3QlOlwAURPx6V8H
 tRo0zjaAMD8mpPzFo/6bVZurqK6/X///B+Tud9KPWjOZwVPRx6gmRDPyFsGS8IHUQm1fECP
 w8kr9AOfC/yFf/g9u2VF+NKZpeOnJqpjsywG9ftX4wk8wvJcCWIUHKTaksdFD/0+yJgjp6E
 3MVwtbgDawF519X9olVbA==
UI-OutboundReport: notjunk:1;M01:P0:Adi9m1HTcDU=;9gsjJcl6FEWgwjZGe7uO5jIh32I
 JbbDvFDN/sgjHL1bymJBF57MJcmkLl15RX7/5XVUQiVSyvlM6yfzFCjw6u0S/GqS+d2lZbdhW
 Y/EEeAUbyVWs8Z5qSz7IfmAl26Ht6pO/C47n8p/xv2Ozvi+VFBiyG1M1w3daaX+LijCcqtHm1
 ugSuY+9GIW0oBBgjb6d1sipTKWVilUofnVljoPs7tTYoYpMczADfqUoK9rMjocP0j9NPoAR+0
 RiPXzCr2TKOxbt2MD6SEnZ3lxz2fzJ6Q0oKJvyDFjTTCENgKBRkTaXsfWiedRivQWffUjMz7Y
 3/7enz1PLGVpMJYxJEnrdmLCIyxoGNXk1Vy3qGUqDMO91sQJHmmWnTM4yLe3zElZD5MwOf3uC
 xViV5B05QuG7L2XcfoM+/lJC7liOT9XAoUlKFQ1jW27ocuhfDTZTLT/kZ+4IUYWE8qqtPYvAe
 JcdLuNorej1Jv0FTjbm1tWHws6d9cJYRP/JWYQ20bmrvwUADwxLHBxH6qnIiHsjrx301e9Vgo
 kAbzYkjmbTa5he+ojl0Eqk+tAs1SGQcZ7WgaESKELVpFQEmAPenTUcahVRqPbvkIgIJrGSj3J
 Q3xvvNEvpf5U8IQ/23x1pi2fvVNS5Z0cv7nKlkGq7f/Ivggobbs1Fdty+SyrrxrKeVBsgum+Q
 jILHfA+8yaDsrY10U7uI1u1HhsXphaGk4WfitTnmWGWwir7fpskCbXxXkkmkdTkDAVOZEmszP
 7UPWZuOkTbze1az/xel7LRkGsSH/J7TuOK2gR0qVfA+Jbb3gNLJLw2Mjda7w1iRnJCLnXCz7D
 arnGM/OGjK50oG0TOSB5NZzjW9EU9HoN/j7NQN7tfVNhHJTtTkbeOHbXW+FnCOOFrz8IKjqpO
 cghF9/ySep4hYExKOwNpRK5Tz3eFPGFyk5mfKeCUXH1YV7hEBre4vl0l/3KLsCTimgE5jtvMJ
 +P/nH5hc/TGMUrgMPtCxFjzUEH0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1674160937; bh=om8KKz9hHCgycVFw8FQ4776OuuYwclCEEkSo+pZDH0E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LgUSagMrkJgV9hIHe/fa4WueJ8tQP3FleOUYjNEwRjLaszr1RrVHJOHAbtcGDtA7O
 9OiKdmYxPuI9/8WlHj4DC+MmBNUELbhk/lsDQss3fqYyhgNmUee0rAhCMwMM/76jn5
 Gs5oDeLxHlAlWE1sjTqEIDO4bSgAgATSdvA7wyI1q6LWla1SCNULtz6+USSYRBnwSp
 PipJYtE/EmMGG3yQ3qmX6h6A5e26pF1B7adswL/48QACCY1Z97Trhi2V+Yysw2NKIy
 v4Oo7U08Bhb+fDrwfmgfsg7UV0ZY5rD77Y2n2gqttLAEZ5L3HBRZb7CAXVqto1mB14
 QfmfKpf7y9DYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=LgUSagMr
Subject: Re: [Buildroot] [PATCH v1] package/git: bump version to 2.39.1
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Thu, 19 Jan 2023 15:10:04 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On Wed, Jan 18, 2023 at 10:35:17PM +0100, Peter Seiderer wrote:
> > - fixes CVE-2022-41903 and CVE-2022-23521
> >
> > For details see [1].
> >
> > [1] https://lore.kernel.org/git/xmqq7cxl9h0i.fsf@gitster.g/
> >
>
> Ah! I'm about to submit the same bump. My bump builds fine, so I think
> it is also applicable to yours.
>
> Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks for confirmation...

>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/git/git.hash | 2 +-
> >  package/git/git.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/git/git.hash b/package/git/git.hash
> > index 57a77b2810..75398896e5 100644
> > --- a/package/git/git.hash
> > +++ b/package/git/git.hash
> > @@ -1,5 +1,5 @@
> >  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> > -sha256  ba199b13fb5a99ca3dec917b0bd736bc0eb5a9df87737d435eddfdf10d69265b  git-2.39.0.tar.xz
> > +sha256  40a38a0847b30c371b35873b3afcf123885dd41ea3ecbbf510efa97f3ce5c161  git-2.39.1.tar.xz
> >  # Locally calculated
> >  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
> >  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
> > diff --git a/package/git/git.mk b/package/git/git.mk
> > index 9918d4c1ef..1d728e1964 100644
> > --- a/package/git/git.mk
> > +++ b/package/git/git.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -GIT_VERSION = 2.39.0
> > +GIT_VERSION = 2.39.1
> >  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
> >  GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
> >  GIT_LICENSE = GPL-2.0, LGPL-2.1+
>
> The package patches apply here (with fuzz), so you need to refresh these
> against v2.39.1:

Matter of taste (?), but for my taste unneeded code churn... as long as the
patches apply unchanged...

Regards,
Peter


>
> ---- >8 ----
> diff --git a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
> index dbde87940a..cb6c3a6dbb 100644
> --- a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
> +++ b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
> @@ -1,4 +1,4 @@
> -From 385f67eb2254edb1fb4cf523e5e3d5a8f123d72c Mon Sep 17 00:00:00 2001
> +From a70fa5257ee347fa3a21734b7066803064657445 Mon Sep 17 00:00:00 2001
>  From: Jeff King <peff@peff.net>
>  Date: Wed, 30 Nov 2022 16:15:14 -0500
>  Subject: [PATCH] git-compat-util: avoid redefining system function names
> @@ -57,14 +57,14 @@ but without redeclaring the system function names.
>
>  Signed-off-by: Jeff King <peff@peff.net>
>  Signed-off-by: Junio C Hamano <gitster@pobox.com>
> -[Bagas: cherry-picked from e0c08a4f738b3dea7a4e8fe3511c323cf1f41942 on next branch]
> +[Bagas: refresh against v2.39.1]
>  Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>  ---
>   git-compat-util.h | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
>  diff --git a/git-compat-util.h b/git-compat-util.h
> -index a76d0526f7..e3456bdd0d 100644
> +index af05077560..f6882b9b50 100644
>  --- a/git-compat-util.h
>  +++ b/git-compat-util.h
>  @@ -341,11 +341,12 @@ struct itimerval {
> @@ -83,7 +83,7 @@ index a76d0526f7..e3456bdd0d 100644
>   #endif
>
>   #ifndef NO_LIBGEN_H
> -@@ -1471,14 +1472,16 @@ int open_nofollow(const char *path, int flags);
> +@@ -1479,14 +1480,16 @@ int open_nofollow(const char *path, int flags);
>   #endif
>
>   #ifndef _POSIX_THREAD_SAFE_FUNCTIONS
> diff --git a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
> index 9e3c9b662c..9a9d2362b0 100644
> --- a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
> +++ b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
> @@ -1,4 +1,4 @@
> -From 6d406390b870fdb2cd9d18b12ebfabc12f5096df Mon Sep 17 00:00:00 2001
> +From 1528273a611e331bfce4da1d4fb0f76d9463ab02 Mon Sep 17 00:00:00 2001
>  From: Jeff King <peff@peff.net>
>  Date: Fri, 2 Dec 2022 06:05:38 -0500
>  Subject: [PATCH] git-compat-util: undefine system names before redeclaring
> @@ -22,14 +22,14 @@ defensive about the other macro wrappers added in the previous patch.
>
>  Signed-off-by: Jeff King <peff@peff.net>
>  Signed-off-by: Junio C Hamano <gitster@pobox.com>
> -[Bagas: cherry-picked from e1a95b78d8a26762ea04332de8b7c3878da51522 on next branch]
> +[Bagas: refresh against v2.39.1]
>  Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>  ---
>   git-compat-util.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
>  diff --git a/git-compat-util.h b/git-compat-util.h
> -index e3456bdd0d..211861da0f 100644
> +index f6882b9b50..dadb9e55cb 100644
>  --- a/git-compat-util.h
>  +++ b/git-compat-util.h
>  @@ -346,6 +346,7 @@ static inline int git_setitimer(int which,
> @@ -40,7 +40,7 @@ index e3456bdd0d..211861da0f 100644
>   #define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
>   #endif
>
> -@@ -1480,6 +1481,9 @@ static inline void git_funlockfile(FILE *fh)
> +@@ -1488,6 +1489,9 @@ static inline void git_funlockfile(FILE *fh)
>   {
>   	; /* nothing */
>   }
>
> When the refresh is applied, don't forget to add:
>
> Co-developed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> Thanks.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
