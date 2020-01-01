From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 15:18:25 +0100
Subject: [Buildroot] [buildroot] patch for suricata,
 wrong shebang in python/
In-Reply-To: <CAJPHfYNQFLkgCJ2dmwt87r2ByF=3HH_P+4bxU8FSPb_iP5TfzA@mail.gmail.com>
References: <CAJPHfYNQFLkgCJ2dmwt87r2ByF=3HH_P+4bxU8FSPb_iP5TfzA@mail.gmail.com>
Message-ID: <20200101141825.GK3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yi, All,

On 2019-06-08 11:24 +0800, Yi Zheng spake thusly:
> Hi,
> ? I found that? /usr/bin/suricatactl and /usr/bin/suricatasc? has wrong shebang, which using the path of python in
> the HOST machine.
> The patch is attached.
> Could you please have a?look?

Sorry for the delay it took to come back to this issue...

What may help explain this delay, is that the patch is not properly
prepared, probably because it was not sent with git send-email.

Additionally, the commit title and body should explain the problem, and
not contain personal message.

For example, a better commit log would be:

    package/suricata: fix shabang for python scripts

    /usr/bin/suricatactl and /usr/bin/suricatasc have their interpreter
    set to the path of python in the HOST machine.

    Use distuils' option '-e' to specify a better shabang.

Furthermore, and not least, your patch is missing your signed-off-by,
which is an important part of the commit log. See:
    https://developercertificate.org/
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

Since this is a simple enough patch, I have applied it. Thanks.

Regards,
Yann E. MORIN.

> From 2b20c3490cdc8f3ddd8adc0ca4db984768ae4418 Mon Sep 17 00:00:00 2001
> From: Brock Zheng Techyauld Ltd <yzheng@techyauld.com>
> Date: Sat, 8 Jun 2019 11:16:37 +0800
> Subject: [PATCH 15/15] suricata: fixup wrong shebang
> 
> ---
>  .../0002-fixup-shebang-on-python-script.patch    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 package/suricata/0002-fixup-shebang-on-python-script.patch
> 
> diff --git a/package/suricata/0002-fixup-shebang-on-python-script.patch b/package/suricata/0002-fixup-shebang-on-python-script.patch
> new file mode 100644
> index 0000000000..7587fd7c24
> --- /dev/null
> +++ b/package/suricata/0002-fixup-shebang-on-python-script.patch
> @@ -0,0 +1,16 @@
> +--- suricata-4.1.3.orig/python/Makefile.am	2019-06-08 11:01:36.008059323 +0800
> ++++ suricata-4.1.3/python/Makefile.am	2019-06-08 11:05:58.498057935 +0800
> +@@ -6,11 +6,11 @@ EXTRA_DIST =	setup.py \
> + if HAVE_PYTHON
> + all-local:
> + 	cd $(srcdir) && \
> +-		$(HAVE_PYTHON) setup.py build --build-base $(abs_builddir)
> ++		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base $(abs_builddir)
> + 
> + install-exec-local:
> + 	cd $(srcdir) && \
> +-		$(HAVE_PYTHON) setup.py build --build-base $(abs_builddir) \
> ++		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base $(abs_builddir) \
> + 		install --prefix $(DESTDIR)$(prefix)
> + 
> + uninstall-local:
> -- 
> 2.21.0
> 

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
