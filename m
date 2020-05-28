From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 23:29:07 +0200
Subject: [Buildroot] [PATCH v1] package/cvs: fix mktime related compile
 failure
In-Reply-To: <20200528231649.0d34fed1@gmx.net>
References: <20200528203204.18142-1-ps.report@gmx.net>
 <20200528224335.2bb72177@windsurf.home>
 <20200528231649.0d34fed1@gmx.net>
Message-ID: <20200528232907.171972ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 23:16:49 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Sorry for being (too) short in the commit log, the failure/assert comes from the lines:
> 
>   verify (long_int_year_and_yday_are_wide_enough,
>           INT_MAX <= LONG_MAX / 2 || TIME_T_MAX <= UINT_MAX);
> 
> And happens with musl libc, I believe another fail out from the y2038
> time_t conversion from 32bit to 64bit...

So it's happening since the upgrade of musl to musl 1.2.0 ?

And yes, a more detailed commit log would be good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
