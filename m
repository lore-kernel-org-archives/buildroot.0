From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Aug 2018 08:52:55 +0200
Subject: [Buildroot] [PATCH 1/1] cutelyst: link with libatomic when
 needed
In-Reply-To: <87y3cr79n8.fsf@dell.be.48ers.dk>
References: <20180827164102.21147-1-fontaine.fabrice@gmail.com>
 <87y3cr79n8.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W8145BW4JwaHX6pzFTF5pEjR73FAgT4b7RjajXmAmswzZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Le mar. 28 ao?t 2018 ? 00:00, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > On some architectures, atomic binutils are provided by the libatomic
>  > library from gcc. Linking with libatomic is therefore necessary,
>  > otherwise the build fails with:
>
>  > sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding
> symbols: DSO missing from command line
>
>  > This is often for example the case on sparcv8 32 bit.
>
>  > Fixes:
>  >  -
> http://autobuild.buildroot.net/results/9e307ab9c7067b26d7b33a572204394808e25772
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
>  >  package/cutelyst/cutelyst.mk | 4 ++++
>  >  1 file changed, 4 insertions(+)
>
>  > diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/
> cutelyst.mk
>  > index e8695a7b3a..1f1a5249be 100644
>  > --- a/package/cutelyst/cutelyst.mk
>  > +++ b/package/cutelyst/cutelyst.mk
>  > @@ -16,6 +16,10 @@ CUTELYST_CONF_OPTS += \
>  >      -DPLUGIN_CSRFPROTECTION=ON \
>  >      -DPLUGIN_VIEW_GRANTLEE=OFF
>
>  > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  > +CUTELYST_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>
> I know we are doing this elsewhere as well, but doesn't this override
> TARGET_LDFLAGS then?
>
Indeed, we're already doing this for gnuradio but you're right, I will
update my patch to use CMAKE_CXX_FLAGS.

>
> --
> Bye, Peter Korsgaard
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180828/1d9ec552/attachment.html>
