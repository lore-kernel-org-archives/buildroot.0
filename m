From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Aug 2019 11:23:59 +0200
Subject: [Buildroot] Notifications about outdated packages
In-Reply-To: <CAB0FRssnr8UrMQB1J51FY9VJnWNedjctQmnuD7J61y0w=PfJ-g@mail.gmail.com>
References: <20190815121841.114f8f64@windsurf.home>
 <CAB0FRssnr8UrMQB1J51FY9VJnWNedjctQmnuD7J61y0w=PfJ-g@mail.gmail.com>
Message-ID: <20190827112359.38e154ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Thanks for your feedback!

On Sat, 17 Aug 2019 20:03:12 +0200
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> release-monitoring.org has a CPAN backend.
> We have currently 110 packages using the perl/cpan infrastructure.
> The current http://autobuild.buildroot.net/stats/ shows 4 packages found by
> `distro`, others are in the status 'Not found'.
> 
> I think that 110 packages could be found by `guess`, because with the
> perl/cpan infrastructure, we have the distribution name.
> For example, with perl-foo-bar:
>      PERL_FOO_BAR_NAME=perl-foo-bar
>      PERL_FOO_BAR_DISTNAME=Foo-Bar (used by the target perl-foo-bar-upgrade)
> 
> So, the search must use *_DISTNAME instead of *_NAME

This indeed seems to work for a number of packages.

> Note: the luarocks infrastructure supplies an equivalent which is named
> *_NAME_UPSTREAM.

I've tried with a few luarocks packages, and it didn't give any useful
results with release-monitoring.org.

But for the Perl case, what we could do is:

 - pkg-stats extracts the DIST_NAME variable (it already extracts
   VERSION, LICENSE and LICENSE_FILES), and store it in some "upstream
   name" member of the Package class.

 - pkg-stats then uses this "upstream name" if available when querying
   release-monitoring.org.

Fran?ois, since Victor is about to finish his internship (end of this
week), he won't have the time to work on this. Do you want to work on
it and propose a patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
