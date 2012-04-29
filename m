From: Nigel Sollars <nsollars@gmail.com>
Date: Sun, 29 Apr 2012 09:27:16 -0400
Subject: [Buildroot] Buildroot fails to build when selecting build
	packages
In-Reply-To: <201204291144.26712.arnout@mind.be>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <201204291144.26712.arnout@mind.be>
Message-ID: <CAG6aBkVmLoN-fHkGWUiOfjRM7k2swUvzNQ38p=schi+Y2Ug1hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I dont have either of those set for environment vars, ( went through
profile / profile.d and env )

here is the output:

configure:28819: checking for DBUS1
configure:28826: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
configure:28829: $? = 0
configure:28842: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
configure:28845: $? = 0
configure:28882: result: yes

Perhaps I missed something?

Regards
Nige


2012/4/29 Arnout Vandecappelle <arnout@mind.be>

>  Hoi Nigel,
>
>  I ignored the original error because I got distracted by the fenv issue
> :-)
>
> On Wednesday 25 April 2012 01:49:44 Nigel Sollars wrote:
> > The build fails since as a dependency glib2 is selected this fails with a
> > dbus like so:
> >
> > gdbus-proxy-threads.c:34:31: fatal error: dbus/dbus-shared.h: No such
> file
> > or directory
> > compilation terminated.
> > make[7]: *** [gdbus-proxy-threads.o] Error 1
> > make[7]: *** Waiting for unfinished jobs....
> > make[7]: Leaving directory
> >
> `/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2/gio/tests'
> > make[6]: *** [all-recursive] Error 1
>
>  Still works for me :-)
>
>  The dbus dependency of libglib2 is only there for the tests.  Since you
> don't have dbus selected, the configure script should detect that and
> disable the gio tests...
>
>  Can you post the output/build/libglib2-2.30.2/config.log file?  It
> should report in the beginning that the host directory is in the front
> of the path, and near the end you should get this:
>
> configure:28819: checking for DBUS1
> configure:28826: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
> Package dbus-1 was not found in the pkg-config search path.
> Perhaps you should add the directory containing `dbus-1.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'dbus-1' found
> configure:28829: $? = 1
> configure:28842: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
> Package dbus-1 was not found in the pkg-config search path.
> Perhaps you should add the directory containing `dbus-1.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'dbus-1' found
> configure:28845: $? = 1
> configure:28858: result: no
> No package 'dbus-1' found
>
>
>  Hang on...  You don't have DBUS1_CFLAGS or DBUS1_LIBS set in your
> environment, do you?  In that case, the configure script would enable
> the gio tests unconditionally...
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>



-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120429/8c2b929b/attachment.html>
