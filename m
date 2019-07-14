From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Jul 2019 21:05:01 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/Config.in: fix alphabetical
 order
In-Reply-To: <20190714123415.GB18236@scaer>
References: <20190611204946.3848-1-jerzy.m.grzegorek@gmail.com>
 <20190714123415.GB18236@scaer>
Message-ID: <64500993-4908-3f86-8b73-2355ac75edab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/07/2019 14:34, Yann E. MORIN wrote:
> On 2019-06-11 22:49 +0200, Jerzy Grzegorek spake thusly:
>> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
>> ---
>> Changes v1 -> v2:
>>  - swap patches 1 and 2 (Arnout)
>>  - change alphabetical order (Arnout)
>>    real alphabetical order: '-', digits, capitals, '_', lowercase
>>    order after change: '-', '_', digits, capitals, lowercase
>> ---
>>
>>  package/Config.in | 30 +++++++++++++++---------------
>>  1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index f61009410d..fcb61c61e0 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -288,10 +288,10 @@ comment "Graphic libraries"
>>  	source "package/directfb/Config.in"
>>  	source "package/directfb-examples/Config.in"
>>  	source "package/efl/Config.in"
>> +	source "package/fb-test-app/Config.in"
>>  	source "package/fbdump/Config.in"
>>  	source "package/fbgrab/Config.in"
>>  	source "package/fbset/Config.in"
>> -	source "package/fb-test-app/Config.in"
> Actually, I am not a fan of this ordering.
> 
> I am a human, not a machine, so when I try to find something in an
> ordered list in my head, I definitely do not run qsort() using the
> C locale. Instead, I just ignore '-' or '_' when sorting; I just
> sort on the letters and numbers, and anything else is silently
> ignored.
> 
> So, again, this is a mechanical sort suited for machines, not humans.
> This is sad... :-(

 The intention was to go to a consistent ordering, not necessarily 'suited for
machines' (i.e. ascii ordering). See Jerzy's comment in the patch changelog
about ordering: _ is ordered before digits and letters instead of between
capital and lowercase.

 We could indeed do something similar for -, or replace - by nothing. However,
it's not as if things were ordered like that everywhere before this patch.

 So feel free to suggest an alternative ordering, and of course contribute a
patch to change it :-)

 BTW, I don't really agree that - or _ should be ignored while sorting. For me,
the following order looks wrong:

aaa
a-ba
abr

"a-ba" to me sounds like two words, and for me it feels more natural to order
"a ba" before "aaa".

 But this, obviously, is bikeshedding :-)


 Regards,
 Arnout
