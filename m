From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Sep 2017 15:39:48 +0200
Subject: [Buildroot] build failure netsniff-ng-0.6.3
In-Reply-To: <15ed250fe80-c0a-be1e@webjas-vaa234.srv.aolmail.net>
References: <15ed250fe80-c0a-be1e@webjas-vaa234.srv.aolmail.net>
Message-ID: <7b3b5d9d-cb0a-e290-1c78-d50bc2224909@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ross,

Le 30/09/2017 ? 12:24, grunpferd at netscape.net a ?crit?:
> G'day Romain,
> 
> Le 30/09/2017 ? 04:56, grunpferd at netscape.net <mailto:grunpferd@netscape.net> a
> ?crit?:
>>> The following compile errors occurred during building?netsniff-ng-0.6.3.
>>>
>>> This used to work successfully previously. Using an internal toolchain ggc6 /
> glibc.
>>>
>>> Changed to latest linux-4.13.4 kernel.?
>>>
>>> The following compile errors get reported:
>>>
>>> Building mausezahn:
>>> ?CC ???str.c
>>> ?CC ???die.c
>>> ?CC ???dev.c
>>> ?CC ???sock.c
>>> ?CC ???link.c
>>> ?CC ???sysctl.c
>>> ?CC ???xmalloc.c
>>> ?CC ???staging/layer1.c
>>> ?CC ???staging/layer2.c
>>> ?CC ???staging/layer3.c
>>> ?CC ???staging/layer4.c
>>> ?CC ???staging/hextools.c
>>> ?CC ???staging/tools.c
>>> staging/tools.c: In function ?get_ip6_range_count?:
>>> staging/tools.c:485:10: error: ?UINT64_MAX? undeclared (first use in this
> function)
>>> ??return UINT64_MAX;
>>> ?????????^~~~~~~~~~
>>> staging/tools.c:485:10: note: each undeclared identifier is reported only once
>>> for each function it appears in
>>> Makefile:184: recipe for target 'mausezahn/staging/tools.o' failed
>>> make[1]: *** [mausezahn/staging/tools.o] Error 1
>>>
>>>
>>> It looks that UINT64_MAX is not declared.
>>>
>>> This was working fine recently. Using latest buildroot git master along with
>>> latest linux-4.13.4.
> 
>> Missing stdint.h header in staging/tools.c ?
>> Adding it fixes the issue.
> 
> This is correct. It again seems to be flushed out by the upgrade to glibc 2.26.
> I suspect that there might have been a nested include that previously brought
> stdint.h into play.
> 
> I guess buildroot needs to cover this for now.

Thanks for reporting the issue, it's very appreciated.
I would like to suggest you to look at the upstream repository to see if the
issue is already fixed.

This is the case here [1], you have to backport this specific patch in the
Buildroot package. It will be removed with the next version bump.

Best regards,
Romain

[1]
https://github.com/netsniff-ng/netsniff-ng/commit/551aa0ee996132e443b5d12cbb6f114ac9aabcd3

> 
> Regards,
> 
> Ross
> 
