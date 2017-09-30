From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Sat, 30 Sep 2017 06:24:38 -0400
Subject: [Buildroot] build failure netsniff-ng-0.6.3
In-Reply-To: <f46ffca2-da09-7e70-5387-7aa220d65a69@smile.fr>
Message-ID: <15ed250fe80-c0a-be1e@webjas-vaa234.srv.aolmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

G'day Romain,


Le 30/09/2017 ? 04:56, grunpferd at netscape.net a ?crit :
>> The following compile errors occurred during building netsniff-ng-0.6.3.
>> 
>> This used to work successfully previously. Using an internal toolchain ggc6 / glibc.
>> 
>> Changed to latest linux-4.13.4 kernel. 
>> 
>> The following compile errors get reported:
>> 
>> Building mausezahn:
>>  CC    str.c
>>  CC    die.c
>>  CC    dev.c
>>  CC    sock.c
>>  CC    link.c
>>  CC    sysctl.c
>>  CC    xmalloc.c
>>  CC    staging/layer1.c
>>  CC    staging/layer2.c
>>  CC    staging/layer3.c
>>  CC    staging/layer4.c
>>  CC    staging/hextools.c
>>  CC    staging/tools.c
>> staging/tools.c: In function ?get_ip6_range_count?:
>> staging/tools.c:485:10: error: ?UINT64_MAX? undeclared (first use in this function)
>>   return UINT64_MAX;
>>          ^~~~~~~~~~
>> staging/tools.c:485:10: note: each undeclared identifier is reported only once
>> for each function it appears in
>> Makefile:184: recipe for target 'mausezahn/staging/tools.o' failed
>> make[1]: *** [mausezahn/staging/tools.o] Error 1
>> 
>> 
>> It looks that UINT64_MAX is not declared.
>> 
>> This was working fine recently. Using latest buildroot git master along with
>> latest linux-4.13.4.

> Missing stdint.h header in staging/tools.c ?
> Adding it fixes the issue.

This is correct. It again seems to be flushed out by the upgrade to glibc 2.26.
I suspect that there might have been a nested include that previously brought stdint.h into play.


I guess buildroot needs to cover this for now.


Regards,


Ross



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170930/002a1eb8/attachment.html>
