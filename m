From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:43:35 +0200
Subject: [Buildroot] [PATCH v1] package/cvs: fix mktime related compile
 failure
In-Reply-To: <20200528203204.18142-1-ps.report@gmx.net>
References: <20200528203204.18142-1-ps.report@gmx.net>
Message-ID: <20200528224335.2bb72177@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 22:32:04 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Use ac_cv_func_working_mktime=yes to force the use of a provided
> mktime implementation instead of compiling the failing own one.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5bcd8f4235002da682cc900f866116d2fe87f1c8
> 
>   mktime.c: In function 'ydhms_diff':
>   mktime.c:106:52: error: size of array 'a' is negative
>    #define verify(name, assertion) struct name { char a[(assertion) ? 1 : -1]; }
>                                                       ^
>   mktime.c:170:3: note: in expansion of macro 'verify'
>      verify (long_int_year_and_yday_are_wide_enough,
>      ^~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Why is this suddenly failing? We have had this package for ages, it
hasn't been changed recently.

So instead of just fixing the issue, we always want to understand *why*
we started having an issue.

Do you have some details of this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
