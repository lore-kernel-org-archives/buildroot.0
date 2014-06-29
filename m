From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Sun, 29 Jun 2014 16:48:19 +0000
Subject: [Buildroot] [PATCH v2] uclibc: enable parallel building of
 libraries
In-Reply-To: <CAAXf6LV3ecayevWGt2QJ5Xw6VAkgcTuixOUGNgt3oqgGRynrBw@mail.gmail.com>
References: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
 <CAAXf6LU3yfD-6mUJ+smNhVDyChPCFv53s7PPVFJYm0A6cdGMgw@mail.gmail.com>
 <4881796E12491D4BB15146FE0209CE6464B4B7C8@DE02WEMBXB.internal.synopsys.com>
 <CAAXf6LV3ecayevWGt2QJ5Xw6VAkgcTuixOUGNgt3oqgGRynrBw@mail.gmail.com>
Message-ID: <1404060498.7954.8.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2014-06-29 at 14:43 +0200, Thomas De Schampheleire wrote:
> 
> Sure, we can wait a short while before enabling $(MAKE) for the other
> targets. But I think we should certainly do it, because the buildroot
> default is $(MAKE) not $(MAKE1). So using $(MAKE1) should only be done
> if there are good reason.
> 
> One particular reason that I want to go for $(MAKE) is for the
> menuconfig target, as I'm working on a kconfig-package infrastructure
> that will line up the kconfig handling in busybox, uclibc, linux, ...
> Since uclibc uses MAKE1 here, it deviates from the other packages
> using kconfig, posing a problem for commonalization in
> kconfig-package.

Makes perfect sense!
If this topic is important for you may I ask you to remind me about it
in a while if I forget to do/test/post mentioned changes in coming
weeks?

It's not a rocket science but mostly a matter of testing how changes
impact building. Even with this patch (which is already applied - kudos
to Thomas P) I faced troubles trying to build uClibc tests: for x86 due
to pretty old uClibc I had to find and apply this patch:
====
test: tls: fix build with newer binutils
http://git.uclibc.org/uClibc/commit/test?id=931e8391565323ed2e589c83b83a7345813a5514
====

-Alexey
