From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Jun 2021 19:30:22 +0200
Subject: [Buildroot] [PATCH] package/netperf: move SITE so s.b.n
In-Reply-To: <87y2bsrxcp.fsf@tarshish>
References: <c160b9eba623c54debf9bf50d69cca4a6d6ed69e.1622119840.git.baruch@tkos.co.il>
 <c60f9708-bc65-28df-7043-729a34b519f7@mind.be> <87y2bsrxcp.fsf@tarshish>
Message-ID: <e0b2c5d4-0368-39c1-0a17-8665244f572b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/06/2021 19:27, Baruch Siach wrote:
> Hi Arnout,
> 
> On Tue, Jun 01 2021, Arnout Vandecappelle wrote:
>> On 27/05/2021 14:50, Baruch Siach wrote:
>>> The original site is gone.
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/8d4a2ef5a7f50ea21b844d6cf806bb83016ae17b/
>>>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>>>  package/netperf/netperf.mk | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
>>> index 8b2280830f3c..0c423249c4c9 100644
>>> --- a/package/netperf/netperf.mk
>>> +++ b/package/netperf/netperf.mk
>>> @@ -5,7 +5,7 @@
>>>  ################################################################################
>>>  
>>>  NETPERF_VERSION = 2.7.0
>>> -NETPERF_SITE = ftp://ftp.netperf.org/netperf
>>> +NETPERF_SITE = http://sources.buildroot.net/netperf
>>
>>  I believe upstream moved to https://hewlettpackard.github.io/netperf/
>>
>>  That one *does* have a configure script. Still need to check if the tarball has
>> the same contents though. The hash doesn't match, that's for sure.
> 
> So what is the right fix here? The new upstream website does not carry
> the tarball we use.

 If the contents is the same (i.e. extract both tarballs and diff -ru them) then
just update the hash.

 NO silly me, that doesn't work, because the hash on s.b.o will be different...
I'll just apply this patch as is then. Sorry for the noise.

 Regards,
 Arnout
