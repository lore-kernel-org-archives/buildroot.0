From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 12:24:19 +0200
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <53831210.40406@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
 <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
 <20140526113840.3473ed77@free-electrons.com>
 <53831210.40406@zacarias.com.ar>
Message-ID: <20140526122419.213075c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 26 May 2014 07:06:08 -0300, Gustavo Zacarias wrote:

> > No, we want to install .a files as well in my opinion. In fact, the
> > patch series I have to rename BR2_PREFER_STATIC_LIB makes things
> > even clearer, with three possibilities: pure static, static and
> > shared, pure shared.
> 
> Sorry but i didn't see your patchset so relax a bit :)

Yeah, no problem :)

> That being said do we really want a pure dyn scenario? Since we
> purge .a files from the target anyway since they're not required for
> runtime it wouldn't hurt a bit to keep the dual mode and just static
> i think. Regards.

There is an advantage with the pure dynamic scenario: build time.

When you have dyn+static, you build all object files (for packages that
do it correctly): once for static without -fPIC, and once for dynamic
with -fPIC. Here is what I have in my commit log about this:

    For example, a static+shared build of libglib2 takes 1 minutes and
    59 seconds, with a final build directory of 96 MB. A shared-only
    build of libglib2 takes only 1 minutes and 31 seconds (almost a 25%
    reduction of the build time), and the final build directory weights
    89 MB (a reduction of almost 8%).

A 25% reduction in build time is certainly nice for users who don't
care about static libraries, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
