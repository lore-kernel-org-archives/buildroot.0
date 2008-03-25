From: John Voltz <john.voltz@gmail.com>
Date: Tue, 25 Mar 2008 10:38:15 -0400
Subject: [Buildroot] Glib2 build problem
In-Reply-To: <47E90A0E.6000800@st.com>
References: <47E8FFCE.8090706@st.com>
	<46a136670803250708x7c002b28xb7ba002608228299@mail.gmail.com>
	<47E90A0E.6000800@st.com>
Message-ID: <46a136670803250738r3b697b10y8bc5845d66a6b3d8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't have any experience using buildroot with an external toolchain.
Maybe someone else here can help with that one. I know a very nasty and
hackish way though, you could symlink the include and lib directories out to
the external toolchain. If you don't mind polluting your toolchain
directories.

John

On Tue, Mar 25, 2008 at 10:19 AM, Christian SCHWARZ <
christian.schwarz@st.com> wrote:

> ok thanks, in fact the linker did not find libintl:
>  arm-linux-uclibc/bin/ld: cannot find -lintl
>
> Do you have an idea how I can tell the toolchain to look also in
> $(BUILDROOT)/linux-toolchain/include and
> $(BUILDROOT)/linux-toolchain/lib ? If not, I have to copy generated libs
> & header files into the toolchain's own lib/ and include/ dirs.
>
> cheers,
> Christian
>
> John Voltz wrote:
> > Take a look inside config.log. You can find the compiler error there
> > that caused the configure script to fail. That usually tells a lot about
> > the real problem.
> >
> > John
> >
> >
> > On Tue, Mar 25, 2008 at 9:36 AM, Christian SCHWARZ
> > <christian.schwarz at st.com <mailto:christian.schwarz@st.com>> wrote:
> >
> >     Dear all,
> >
> >     I encounter a build problem with glib2 for an ARM11 target. The
> error
> >     message is the following:
> >
> >     ---------------snip---------------------
> >     [...]
> >     checking libintl.h usability... yes
> >     checking libintl.h presence... yes
> >     checking for libintl.h... yes
> >     checking for ngettext in libc... no
> >     checking for bindtextdomain in -lintl... no
> >     checking if -liconv is needed to use gettext...
> >     checking for ngettext in -lintl... no
> >     configure: error:
> >     *** You must have either have gettext support in your C library, or
> >     use the
> >     *** GNU gettext library.
> >     (http://www.gnu.org/software/gettext/gettext.html
> >     ---------------------snap-------------------------------------
> >
> >     It seems as though I should configure ngettext support in libintl,
> but I
> >     don't know how to do so. Is the alternative rebuilding the uclibc,
> >     similar to what has been discussed on the mailing list?:
> >
> http://www.nabble.com/Kindly-help-me-to-build-glib2-on-arm926-platform-td12012803.html
> >
> >     Buildroot snapshot is 2008-17-03. A cross-compiling toolchain for
> ARM
> >     Linux has been built (previously) with buildroot.
> >
> >     thanks for any hints,
> >     Christian
> >
> >     _______________________________________________
> >     buildroot mailing list
> >     buildroot at uclibc.org <mailto:buildroot@uclibc.org>
> >     http://busybox.net/mailman/listinfo/buildroot
> >
> >
> >
> > ------------------------------------------------------------------------
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080325/63d4cbf6/attachment.htm 
