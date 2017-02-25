From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 25 Feb 2017 02:47:38 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170224154857.61f03dfd@free-electrons.com>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <c5d029d5-f610-6709-852a-b84c7ad6313d@free.fr>
 <20170224154857.61f03dfd@free-electrons.com>
Message-ID: <20170225014738.GF12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Fri, 24 Feb 2017 15:37:00 +0100, Julien Boibessot wrote:
> 
> > > Static linking issue. Julien B.?  
> > 
> > It seems that adding "-static" to final linking command solves the
> > problem. It's strange that other static builds on other ARCH are working ?
> 
> Waldemar can answer this question I believe.

It might be an ARC specific issue. I have found some strange issues
when using static builds with ARC. I have to report it to the
Synopsis developers. I can not even run a simple hello world
statically compiled on NSIM - ARC simulator.

But when -static is not passed to the final linking command on a
static-only build, some circular dependencies in the threading code
will not be automatically resolved by gcc. This shouldn't be a
architecture specific problem, but is uClibc-ng specific.

best regards
 Waldemar
