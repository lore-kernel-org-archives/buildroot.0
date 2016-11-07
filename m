From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 7 Nov 2016 15:12:34 +1100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-05
In-Reply-To: <20161106150623.2b7fd549@free-electrons.com>
References: <20161106073024.E75F820798@mail.free-electrons.com>
 <20161106150623.2b7fd549@free-electrons.com>
Message-ID: <20161107041234.GA31219@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 06, 2016 at 03:06:23PM +0100, Thomas Petazzoni wrote:

[snip]

> >  powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/fee300664d4d76186e4e2378e397ae3054dc6549
> 
> undefined reference to symbol 'XRenderCreatePicture'
> 
> Sam?

This seems to be similar to some others: a library (libXcursor) is being
incorrectly built as static, which causes downstream link failures. I
had a quick look at other X11R7 libraries and they all seem to include
the same old version of autotools that can't detect dynamic linker
support on powerpc64le.

Before I go and fix every one manually: is there some better way to
handle this across many packages, or even just many X11R7 packages?

Should I prepare one big patch that fixes them all?

Cheers,
Sam.
