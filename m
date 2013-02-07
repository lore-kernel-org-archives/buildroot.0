From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 15:47:00 +0100
Subject: [Buildroot] [PATCH] boost: Pass staging dir to --with-icu
 option.
In-Reply-To: <20130207134835.GA23603@zenon.in.qult.net>
References: <20130207134835.GA23603@zenon.in.qult.net>
Message-ID: <20130207154700.1d1da42b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ignacy Gawedzki,

On Thu, 7 Feb 2013 14:48:35 +0100, Ignacy Gawedzki wrote:
> When using the --with-icu option without specifying the directory,
> boost's bootstrap.sh script will look at "common" locations (lines
> 289-294):
> 
>     COMMON_ICU_PATHS="/usr /usr/local /sw"
>     for p in $COMMON_ICU_PATHS; do
>       if test -r $p/include/unicode/utypes.h; then
>         ICU_ROOT=$p
>       fi
>     done
> 
> With buildroot it may surely become problematic at some point.

This looks sensible. However, it doesn't explain how Boost could have
been finding ICU before your patch. Any idea?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
