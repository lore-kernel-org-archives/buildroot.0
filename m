From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 09:35:05 +0200
Subject: [Buildroot] [PATCH] libtommath: add -fPIC
In-Reply-To: <87pot6swzx.fsf@dell.be.48ers.dk>
References: <1462005187-32394-1-git-send-email-francois.perrad@gadz.org>
 <20160430145512.34b475dc@free-electrons.com>
 <87twijrl81.fsf@dell.be.48ers.dk>
 <20160430211311.215e9c1d@free-electrons.com>
 <87pot6swzx.fsf@dell.be.48ers.dk>
Message-ID: <20160501093505.5e98c1b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 21:43:46 +0200, Peter Korsgaard wrote:

>  > Well, as you've seen yourself, this static library is then used inside
>  > a shared library, so it has to be built -fPIC.  
> 
>  > If you want to build the static library without -fPIC, then the
>  > libtommath package should also provide a shared version of its library,
>  > so that it gets used instead of the static one when linked into a
>  > shared library.  
> 
> Hmm, should we do this for all static only libraries in case they would
> ever get used by a shared library? E.G. ezxml is a similar package.

Well, as soon as some object code ends up being used in a shared
library (directly or via linking to a static library), then it must be
compiled with -fPIC, at least on some architectures (x86_64 and mips
are the one who clearly abort the build if that's not the case).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
