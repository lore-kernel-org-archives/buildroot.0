From: Ignacy Gawedzki <i@lri.fr>
Date: Thu, 7 Feb 2013 16:24:26 +0100
Subject: [Buildroot] [PATCH] boost: Pass staging dir to --with-icu
	option.
In-Reply-To: <20130207154700.1d1da42b@skate>
References: <20130207134835.GA23603@zenon.in.qult.net>
 <20130207154700.1d1da42b@skate>
Message-ID: <20130207152426.GA27115@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 07, 2013 at 03:47:00PM +0100, thus spake Thomas Petazzoni:
> Dear Ignacy Gawedzki,
> 
> On Thu, 7 Feb 2013 14:48:35 +0100, Ignacy Gawedzki wrote:
> > When using the --with-icu option without specifying the directory,
> > boost's bootstrap.sh script will look at "common" locations (lines
> > 289-294):
> > 
> >     COMMON_ICU_PATHS="/usr /usr/local /sw"
> >     for p in $COMMON_ICU_PATHS; do
> >       if test -r $p/include/unicode/utypes.h; then
> >         ICU_ROOT=$p
> >       fi
> >     done
> > 
> > With buildroot it may surely become problematic at some point.
> 
> This looks sensible. However, it doesn't explain how Boost could have
> been finding ICU before your patch. Any idea?

The answer to this question may be in the following lines of bootstrap.sh.  If
ICU is not found in any of those "common" locations, then bjam is called
without any -sICU_PATH option and it may be that it finds the correct location
automatically (by using passed LDFLAGS or something).

I started using Boost with ICU very recently, so I can't tell from my own
experience if this is what happens indeed.

-- 
Information wants to be beer, or something like that.
