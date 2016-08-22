From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Mon, 22 Aug 2016 19:22:55 +0530
Subject: [Buildroot] [PATCH 1/1] trousers: fix build issue with musl
In-Reply-To: <20160820144139.77d3e36a@free-electrons.com>
References: <1471694164-2094-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160820144139.77d3e36a@free-electrons.com>
Message-ID: <57BB03B7.2090600@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Saturday 20 August 2016 06:11 PM, Thomas Petazzoni wrote:
> Hello,
>
>
> This seems like the wrong approach to fix the problem. Indeed, musl
> does have a definition of HOST_NAME_MAX, except it's in <limits.h>.
>
> uClibc and glibc also have HOST_NAME_MAX defined when <limits.h> is
> included, so the right fix is to drop completely the <bits/local_lim.h>
> inclusion, and include <limits.h> instead.
>
> I've tested the following program:
>
> ==
> #include <limits.h>
> #include <stdio.h>
>
> int main(void)
> {
> 	printf("%d\n", HOST_NAME_MAX);
> 	return 0;
> }
> ==
>
> and it builds fine with glibc, uClibc and musl.
>
> Could you rework your patch accordingly, and also submit the patch
> upstream to the trousers project?
>

Thanks for comments. Even on Trousers project mailing list someone 
proposed similar patch. 
https://sourceforge.net/p/trousers/mailman/message/35261558/

Since we can't download it and it's based on upstream master branch, I 
will add separate patch here and I don't need to submit it upstream as 
it's likely to get merged.


Thanks,
Rahul
