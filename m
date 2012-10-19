From: Richard Braun <rbraun@sceen.net>
Date: Fri, 19 Oct 2012 12:02:13 +0200
Subject: [Buildroot] external toolchains and sysroot
In-Reply-To: <20121019095730.GA6397@mail.sceen.net>
References: <508118F0.3030202@6wind.com> <20121019093805.GA2382@mail.sceen.net>
 <50812162.7090809@6wind.com> <20121019095730.GA6397@mail.sceen.net>
Message-ID: <20121019100213.GA7355@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 19, 2012 at 11:57:30AM +0200, Richard Braun wrote:
> On Fri, Oct 19, 2012 at 11:46:10AM +0200, Jean-Mickael Guerin wrote:
> > I would expect the wrapper the use -I and -L to help the lookup of
> > headers and libraries installed afterwards. Why --sysroot?
> 
> -I and -L extend the default list of search directories whereas
> --sysroot replaces them. This completely avoids using native libraries
> by mistake.

I might have answered a bit fast. I suppose what you have in mind is let
the toolchain use its own sysroot, defined at compile time (when the
toolchain was built) and then extend it with -I and -L. The problem with
this is that it would force everyone to use the very same path for one
toolchain, which can be tedious for external toolchains (you might have
several with the same built-in sysroot).

-- 
Richard Braun
