From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 07 Sep 2014 09:56:23 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140907100918.6b017a09@free-electrons.com>
References: <20140907063013.1CB98101499@stock.ovh.net>
 <20140907100918.6b017a09@free-electrons.com>
Message-ID: <540C55F7.9040506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/07/2014 05:09 AM, Thomas Petazzoni wrote:

>>    powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/a7f95353f5592a9399c542d8d56c3ca040f8a61a/
> 
> e_start_main.c:478:42: error: 'PT_GETSIGINFO' undeclared (first use in this function)
>                                r = ptrace(PT_GETSIGINFO, child, NULL, &sig);
> 
> Gustavo, maybe?

Hi.
Outdated uclibc ptrace.h header, sparc is also affected by this however
since there's no autobuilder for that target it's going unnoticed.
glibc has the necessary definitions, so a uclibc header update is in order.
We can exclude ptrace for powerpc & sparc in the meantime.
Regards.
