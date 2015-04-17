From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 17 Apr 2015 11:33:28 +0200
Subject: [Buildroot]  [PATCH 1/1] Added linux drivers backports project
Message-ID: <1429263209-13127-1-git-send-email-vorel@jablocom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Petr Vorel <petr.vorel@gmail.com>

I fixed things which were reported and keep it as a package. This is for first start.

> # FOO_KCONFIG_FILE is required
> ifndef $(2)_KCONFIG_FILE
> $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
> endif

>  Oh, now I see that Yann's patch to convert this to ifeq hasn't been applied
> yet... So yes in that case the custom check should stay.
Ok. Could you send me a link to the patch?

>  Anyway, if it does become a Linux extension, the package will stay. One of the
> Kconfig options (the package or the linux extension) will be a blind option, and
> at that time we can still choose which one will be blind.
It's up to you folks to decide, if there could be both versions (package and extension).

> I plan further improvements:
> * Allow to use different versions
> There are stable releases, snapshot based on current linux-next and some
> archived versions based on linux-next. Although it's recommended to use the
> latest stable version, some people prefer / need different version.

> * Version check
> For kernel versions older than 3.0 version backports-3.14 is needed,
> kernels < 2.6.26 aren't supported.

> * Custom patches
> Ekvivalent of BR2_LINUX_KERNEL_PATCH.

> * Custom repository version
> Ekvivalent of BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION.
Any comments?

Kind regards,
Petr
