From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Sep 2014 09:57:12 +0200
Subject: [Buildroot] [PATCH 12/12] libffi and python: need threads
 support
In-Reply-To: <1410537011-29662-13-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-13-git-send-email-jezz@sysmic.org>
Message-ID: <20140913095712.223528dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 12 Sep 2014 17:50:11 +0200, J?r?me Pouiller wrote:
> libffi depends on pthreads.
> 
> Python depends on libffi (it can provide a builtin libffi, but also depends on
> pthreads). Thus this patch also disable Python support if toolchain is compiled
> w/o treads support.
> 
> Fixes http://sysmic.org/~jezz/results/204099dd:
> 
> ../src/closures.c:119:21: fatal error: pthread.h: No such file or directory

This seems weird. We have a no threads toolchain in our autobuilders
and it was never detected, even though I'm pretty sure libffi was built
a number of times. Do you have the configuration that exhibits the
problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
