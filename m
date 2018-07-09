From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 9 Jul 2018 10:02:15 +0200
Subject: [Buildroot] [PATCH] systemd: add an option to use busybox's
 getty
In-Reply-To: <20180708195429.9693-1-jeremy.rosen@smile.fr>
References: <20180708195429.9693-1-jeremy.rosen@smile.fr>
Message-ID: <be826cad-71c5-10ac-aec2-bc4dc919e356@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

Le 08/07/2018 ? 21:54, J?r?my Rosen a ?crit?:
> Currently, the patch to replace agetty with busybox's getty is always
> applied.
> 
> this patch adds a compile-time option to systemd to choose either agetty
> or busybox's getty and chooses the correct option depending on agetty being
> selected in busybox
> 

As discussed privately, if you want an example on how apply a patch
conditionally you can take a look at the gcc package [1].
This has been introduced by [2] but there is some other place where
$(APPLY_PATCHES) is used (conditionally or unconditionally).

$(APPLY_PATCHES) is defined in package/Makefile.in but this way to use it is not
documented in the manual [3].

Best regards,
Romain

[1] https://git.busybox.net/buildroot/tree/package/gcc/gcc.mk#n41
[2]
https://git.busybox.net/buildroot/commit/?id=197006a41c1a0450bf6350d5742e186b5b0c69de
[3] http://nightly.buildroot.org/manual.html#patch-policy
