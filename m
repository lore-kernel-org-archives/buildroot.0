From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 14:24:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/ccache: add wrapper for
 internal toolchain
In-Reply-To: <CABbD_XCocg8xyZHE5rxAA3FUH5p2eGaFiKdaJhoaXhdFVingug@mail.gmail.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
 <1430040062-46308-2-git-send-email-kaszak@gmail.com>
 <20150426113742.182fa26b@free-electrons.com>
 <CABbD_XCocg8xyZHE5rxAA3FUH5p2eGaFiKdaJhoaXhdFVingug@mail.gmail.com>
Message-ID: <20150426142444.51f5b4d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Sun, 26 Apr 2015 11:45:06 +0200, K?roly Kasza wrote:

> That is true, so the wrapper for external toolchains also needs the
> extrafiles/hash solution. I simply missed this.

No problem, but it would indeed be nice to have a solution that covers
both cases.

> > I must say I don't quite like the fact that the solution used here is
> > different between internal and external toolchain, but I haven't
> > thought too much of the problem.
> 
> I thought this would be more efficient, but the above statement kills it.

I certainly don't want to kill anything. This ccache problem has been
around for a long time, and it's definitely great to see someone taking
care of this relatively complicated issue.

> > How would ccache work with external toolchains?
> >
> 
> Well, using mtime is out of question because of the BR built wrapper, so it
> requires the
> same solution: a wrapper for ccache and using extrafiles/hash as for the
> internal.

Indeed. But maybe the existing external toolchain wrapper can be used.
We probably don't want to have a shell wrapper call a C wrapper
calling the compiler.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
