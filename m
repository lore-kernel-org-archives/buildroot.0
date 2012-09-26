From: Nathan Lynch <ntl@pobox.com>
Date: Wed, 26 Sep 2012 14:23:30 -0500
Subject: [Buildroot] [PATCH 1/1] allow to pass the number of parallel
 jobs via command line
In-Reply-To: <20120926165756.GB31527@game.jcrosoft.org>
References: <1348568223-13874-1-git-send-email-plagnioj@jcrosoft.com>
 <87txul7sbc.fsf@macbook.be.48ers.dk>
 <20120926062348.GA31527@game.jcrosoft.org>
 <87a9wd6p66.fsf@macbook.be.48ers.dk>
 <20120926165756.GB31527@game.jcrosoft.org>
Message-ID: <1348687410.17060.69.camel@doorstop.aus.2wire.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2012-09-26 at 18:57 +0200, Jean-Christophe PLAGNIOL-VILLARD
wrote:
> On 12:42 Wed 26 Sep     , Peter Korsgaard wrote:
> > >>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> > 
> > Hi,
> > 
> >  >> why not just use make BR2_JLEVEL=x ?
> > 
> >  JC> kconfig overwrite and you can not optarg env as
> >  JC> BR2_JLEVEL is a int so need to use PARALLEL_JOBS
> > 
> > Sorry, I don't understand what you are saying here. BR2_JLEVEL works
> > fine:
> > 
> > make BR2_LEVEL=42
> > ...
> > /usr/bin/make -j42 CC="/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc" ..
> here does not work
> 
> I try this
> 
> with a value of BR2_JLEVEL at 4
> 
> BR2_JLEVEL=13 make
> 
> ...
> /usr/bin/make -j2 -C /opt/work/buildroot/build/test/toolchain/gcc-4.6.3-initial all-gcc
> 
> I want to pass the JLEVEL via env not make option

Use make -e (--environment-overrides)?  I dunno, things might break
depending on what's in your environment.  But if your use case has this
constraint hopefully you are able to sanitize your environment before
invoking Buildroot.
