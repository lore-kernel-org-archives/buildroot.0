From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Jan 2016 09:22:45 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <569CD915.5090302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/01/16 20:11, Thomas Petazzoni wrote:

>>       powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/cef2fe3d87b742743a54a2fdbc585771e175a9e6/
>
> In file included from secoid.c:1915:0:
> verref.h: In function 'SECOID_Init':
> verref.h:22:9: error: #pragma GCC diagnostic not allowed inside functions
> verref.h:23:9: error: #pragma GCC diagnostic not allowed inside functions
> cc1: warnings being treated as errors
>
> old compiler problem.

This one is fixed via http://patchwork.ozlabs.org/patch/563960/

>>           arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0581889edfb7bf5ca0f23e3111ac6eeffbee3376/
>>      mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/1abb03babacacf13db33ae9fe89b5d52925b58b1/
>
> 2 different dependency problems.

Fixed via http://patchwork.ozlabs.org/patch/564312/
(more a backport of 2.10.x features than really trying to fix that 
particular failure).

I'll look at the others time allowing.
Regards.
