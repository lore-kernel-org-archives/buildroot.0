From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Sun, 7 Mar 2021 00:29:15 +0100
Subject: [Buildroot] [PATCH 7/8] package/optee-test: add deps on openssl
 when enabled
In-Reply-To: <20210306231545.GY2275@scaer>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
 <20201030075045.6960-7-etienne.carriere@linaro.org>
 <20210306231545.GY2275@scaer>
Message-ID: <CAN5uoS_SCWJgm8UF5p92BFPW7-2W=SGtH_8Eygz-GRYibTaT7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

J?r?me in copy, from the optee_test.git maintainers.

On Sun, 7 Mar 2021 at 00:15, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> ?tienne, All,
>
> On 2020-10-30 08:50 +0100, Etienne Carriere spake thusly:
> > Add a dependency on openssl upon BR2_PACKAGE_LIBOPENSSL=y to
> > enable some for OP-TEE embedded tests.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>
> Applied to next, with the following changes:
>
>   - match the depenency to libopenssl, since that's is what is used in
>     the condition (BR2_PACKAGE_LIBOPENSSL)
>   - add a blurb to explain why libopenssl is used, not the virutal
>     openssl
>
> Thanks!
>
> BTW, there are openssl headers and a pre-built libcrypto.a for arm and
> AArch64 in optee-test 3.12.0. Was that intentional?

That's an ugly hack (sorry j?r?me) for when build env is missing an openssl.
Since the build env proposed in OP-TEE release, maybe we don't need
them anymore.

J?r?me, do you think we still need the repbuilt openssl libs in optee_test?

br,
etienne

>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/optee-test/optee-test.mk | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
> > index 1f4f586672..189956651b 100644
> > --- a/package/optee-test/optee-test.mk
> > +++ b/package/optee-test/optee-test.mk
> > @@ -10,6 +10,9 @@ OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
> >  OPTEE_TEST_LICENSE_FILES = LICENSE.md
> >
> >  OPTEE_TEST_DEPENDENCIES = optee-client optee-os
> > +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> > +OPTEE_TEST_DEPENDENCIES += openssl
> > +endif
> >
> >  OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_OS_SDK)
> >
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
