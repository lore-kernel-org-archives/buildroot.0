From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 14:05:27 +0200
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <53831F94.7000900@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
 <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
 <20140526113840.3473ed77@free-electrons.com>
 <53831210.40406@zacarias.com.ar>
 <20140526122419.213075c3@free-electrons.com>
 <53831F94.7000900@zacarias.com.ar>
Message-ID: <20140526140527.3d6bd86c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 26 May 2014 08:03:48 -0300, Gustavo Zacarias wrote:

> >     For example, a static+shared build of libglib2 takes 1 minutes
> > and 59 seconds, with a final build directory of 96 MB. A shared-only
> >     build of libglib2 takes only 1 minutes and 31 seconds (almost a
> > 25% reduction of the build time), and the final build directory
> > weights 89 MB (a reduction of almost 8%).
> > 
> > A 25% reduction in build time is certainly nice for users who don't
> > care about static libraries, no?
> 
> Ok, so then we can go for it, i don't think anyone will care about the
> space saving though, but time is a whole different matter.

Agreed, the disk space saving nobody really cares, especially if it's
only ~8%. But a build time saving of 25% is quite nice, in my opinion.
Normally, all packages using libtool should be affected, but I haven't
checked.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
