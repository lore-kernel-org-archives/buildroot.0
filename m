From: Chris Zankel <chris@zankel.net>
Date: Tue, 29 Oct 2013 13:11:46 -0700
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029204108.5d707d09@skate>
References: <20131029204108.5d707d09@skate>
Message-ID: <52701682.2040208@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Great statistics. Xtensa definitely needs some work here ;-)

I looked into the failures a while ago and started to create patches. 
However, one major issue was lacking NPTL support in uClibc. We are 
currently working on it and are getting close to support it. This 
already should push the pct columns higher :-)

Thanks,
-Chris



On 10/29/13, 12:41 PM, Thomas Petazzoni wrote:
> Hello all,
>
> This e-mail is intentionally Cc'ed to a number of people who are
> working on specific architectures in Buildroot, and specifically the
> architectures having the highest number of problems in the autobuilders.
>
> I generated some statistics of the number of failed builds vs.
> successful builds since July, 1st 2013, and here are the results
> (ordered from the worst architecture to the best one) :
>
> +------------+---------+----------+-------+------------+------------+
> | arch       | success | failures | total | pctsuccess | pctfailure |
> +------------+---------+----------+-------+------------+------------+
> | bfin       |      10 |      607 |   617 |     1.6207 |    98.3793 |
> | microblaze |       6 |      308 |   314 |     1.9108 |    98.0892 |
> | nios2      |       2 |       49 |    51 |     3.9216 |    96.0784 |
> | xtensa     |      13 |      314 |   327 |     3.9755 |    96.0245 |
> | avr32      |      34 |      305 |   339 |    10.0295 |    89.9705 |
> | mips64el   |     162 |      498 |   660 |    24.5455 |    75.4545 |
> | aarch64    |      82 |      243 |   325 |    25.2308 |    74.7692 |
> | arc        |      95 |      234 |   329 |    28.8754 |    71.1246 |
> | sh4a       |     158 |      171 |   330 |    47.8788 |    51.8182 |
> | mipsel     |     172 |      168 |   340 |    50.5882 |    49.4118 |
> | mips       |     172 |      165 |   337 |    51.0386 |    48.9614 |
> | arm        |    2302 |     1788 |  4097 |    56.1875 |    43.6417 |
> | powerpc    |    2794 |     1616 |  4411 |    63.3416 |    36.6357 |
> | sh4        |     208 |      120 |   328 |    63.4146 |    36.5854 |
> | x86_64     |     874 |      412 |  1288 |    67.8571 |    31.9876 |
> | i686       |    2369 |      572 |  2943 |    80.4961 |    19.4359 |
> +------------+---------+----------+-------+------------+------------+
>
> It would be really nice if the people working on those architectures in
> Buildroot could contribute a little bit more to fix the autobuilders
> failures, or at least get in touch with us to discuss how to solve
> them, or if they have no clue how to solve them.
>
> Thanks,
>
> Thomas
