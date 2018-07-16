From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Jul 2018 05:59:43 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
Message-ID: <fqht1fxpqg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 13 Jul 2018 22:58:01 +0200 schrieb Peter Seiderer:

> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
[..]
> -$(eval $(autotools-package))
> +$(eval $(meson-package))

Hi Peter,

last year I sent a patch to switch libpng from autotools to cmake:
http://lists.busybox.net/pipermail/buildroot/2017-September/201303.html

The patch was rejected by Yann
http://lists.busybox.net/pipermail/buildroot/2017-September/201305.html

> If upstream has changed, or there is a *compelling* reason to switch,
> then so be it. In this case, the commit log *must* explain the rationale
> for switching.
> 
> But switching for the sake of switching is a big no-no from me.

and Thomas
http://lists.busybox.net/pipermail/buildroot/2017-September/201307.html

> I agree that there needs to be an explanation for the switch. Is
> upstream moving to CMake, and getting rid of autotools support in the
> future ? Other reason ?

From the current discussion of your RFC I am unable to see the 
"*compelling* reason" for using meson. Instead the mess around python2/
python3 imho does not justify the few seconds libdrm itself will build 
faster, so NACK.

Regards, Bernd
