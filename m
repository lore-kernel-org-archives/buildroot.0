From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:49:59 +0200
Subject: [Buildroot] Which order: $(MAKE) $(TARGET_CONFIGURE_OPTS) or
 $(TARGET_CONFIGURE_OPTS) $(MAKE)
In-Reply-To: <CAAXf6LVwhzcCnEXKaBku5WfwKeR7GHX0v4VFu4kvdxMobW=g9w@mail.gmail.com>
References: <CAAXf6LUHH5Lo=LSSfjGRQ=onT4Bm_WfLAFc0RDjfcT_ZmADmbA@mail.gmail.com>
 <20170329213552.6455f568@free-electrons.com>
 <CAAXf6LVwhzcCnEXKaBku5WfwKeR7GHX0v4VFu4kvdxMobW=g9w@mail.gmail.com>
Message-ID: <20170329214959.54454e17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 21:43:18 +0200, Thomas De Schampheleire wrote:

> But, on the other hand, if a package would do:
> 
> CFLAGS = -I../include
> 
> then we cannot use either approach because one approach will ignore
> the -I../include, and the other will ignore our own settings. In that
> case, a patch of the package is required, right?

Correct. But I guess in many cases we don't realize when the package
"ignores" our CFLAGS, because there is nothing in our CFLAGS that is
really mandatory for the thing to build.

Of course, the fact that our CFLAGS may be ignored means that the
package may not have the correct optimization level, debugging level,
stack smashing protection flags, etc. I remember at some Buildroot
meeting, we discussed the idea of injecting a fake CFLAGS, and then
checking in the toolchain wrapper that we have this fake flag. But I'm
sure this would cause lots and lots of false positives.

> Is there a recommendation for the case that the package allows either way?

I don't really have a good suggestion. We tend to fix those issues on a
case by case basis, with no well defined "best practice".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
