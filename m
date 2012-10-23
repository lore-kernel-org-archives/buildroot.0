From: Jean-Mickael Guerin <jean-mickael.guerin@6wind.com>
Date: Tue, 23 Oct 2012 08:45:30 +0200
Subject: [Buildroot] external toolchains and sysroot
In-Reply-To: <20121021114154.3d23d89b@skate>
References: <508118F0.3030202@6wind.com>
 <20121019093805.GA2382@mail.sceen.net> <50812162.7090809@6wind.com>
 <20121019095730.GA6397@mail.sceen.net> <20121019100213.GA7355@mail.sceen.net>
 <50813429.3010107@6wind.com> <20121021114154.3d23d89b@skate>
Message-ID: <50863D0A.40809@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/2012 11:41, Thomas Petazzoni wrote:
> I am the one who wrote the external toolchain support as it is now.
> Initially, things were working as you suggested, i.e keep the sysroot
> in its original place, and use -I/-L to point to the headers and
> libraries that Buildroot adds. It/mostly/  works, but causes for some
> packages horrible problems with libtool.

>
> I don't have the time right now to dig into the archives, but this is a
> problem we worked on around December 2008, and it has allowed the
> external toolchain support to work nicely and properly since then.

>
> If you have problems with external toolchain support, don't hesitate to
> point me to the toolchain you're using, and how to reproduce your
> problem. I am fairly sure it is not related to the fact that we're
> copying the sysroot.

Well, the issue *is* this large copy.

We can improve the share of toolchains among multiple builds, and 
simplify this code for ext toolchain support (btw there is hack to avoid 
too big usr/locale..).

I can propose the patch, but which are the options to get confident?
Do we have ext-toolchain in the serie of daily auto-build?

I could find in archive some discussion about Qtopia, DirectFB, but 
nothing explicitly related to sysroot or library path.
Someone else may remember other problem? a specific toolchain?

Regards,
Jean-Mickael
