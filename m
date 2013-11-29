From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Nov 2013 07:04:26 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131129095110.3c7fc674@skate>
References: <20131129073003.AF5B01014F0@stock.ovh.net>
 <20131129095110.3c7fc674@skate>
Message-ID: <529866AA.7090206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/29/2013 05:51 AM, Thomas Petazzoni wrote:
>>       bfin |                    hostapd-2.0 | NOK | http://autobuild.buildroot.net/results/d4a9f44effeb08eda6c4b32764274ae81d185d5e/
> 
> Missing pthread in the link command line?
> 
> /home/test/test/1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libnl-3.a(cache_mngt.o): In function `_nl_cache_mngt_unprovide':
> cache_mngt.c:(.text+0x6e): undefined reference to `_pthread_rwlock_wrlock'
> cache_mngt.c:(.text+0x10a): undefined reference to `_pthread_rwlock_unlock'

libnl doesn't account for pthread usage in its PC files.
I'll take a look.
Regards.
