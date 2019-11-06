From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 6 Nov 2019 14:54:42 +0100
Subject: [Buildroot] [PATCH] package/linux-serial-test: new package
In-Reply-To: <20191105195449.GN2710@scaer>
References: <20191105115607.5406-1-yegorslists@googlemail.com>
 <20191105195449.GN2710@scaer>
Message-ID: <CAGm1_kvMy8dBjXxBKU=VFLEdmPsE-g76etr+yKyaVG3WPf5+vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 5, 2019 at 8:54 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Yegor, All,
>
> On 2019-11-05 12:56 +0100, yegorslists at googlemail.com spake thusly:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> [--SNIP--]
> > diff --git a/package/linux-serial-test/linux-serial-test.hash b/package/linux-serial-test/linux-serial-test.hash
> > new file mode 100644
> > index 0000000000..4f94bff436
> > --- /dev/null
> > +++ b/package/linux-serial-test/linux-serial-test.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256  d04f4420abfeda5ee62662e790ea6ae5ddc2e758870e04ab76fa35d6de9cdce0  linux-serial-test-9965dad53ba63eea0eea05a0f9d5cb851425fcba.tar.gz
>
> I've added a hash for the license file, and pushed to master now.

Thanks.

It would be great to have such a test in utils/check-package. Though
it can be tricky as for now each Class handles its own file type.

Regards,
Yegor

> Thanks!
>
> Regards,
> Yann E. MORIN.
>
> > diff --git a/package/linux-serial-test/linux-serial-test.mk b/package/linux-serial-test/linux-serial-test.mk
> > new file mode 100644
> > index 0000000000..e10a45ce90
> > --- /dev/null
> > +++ b/package/linux-serial-test/linux-serial-test.mk
> > @@ -0,0 +1,12 @@
> > +################################################################################
> > +#
> > +# linux-serial-test
> > +#
> > +################################################################################
> > +
> > +LINUX_SERIAL_TEST_VERSION = 9965dad53ba63eea0eea05a0f9d5cb851425fcba
> > +LINUX_SERIAL_TEST_SITE = $(call github,cbrake,linux-serial-test,$(LINUX_SERIAL_TEST_VERSION))
> > +LINUX_SERIAL_TEST_LICENSE = MIT
> > +LINUX_SERIAL_TEST_LICENSE_FILES = LICENSES/MIT
> > +
> > +$(eval $(cmake-package))
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
