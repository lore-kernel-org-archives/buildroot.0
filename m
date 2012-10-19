From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 19 Oct 2012 10:01:11 +0200
Subject: [Buildroot] [PATCH] mxs-bootloader: Barebox entry point symbol
 changed in 2012.08
In-Reply-To: <50805E2A.1010308@mind.be>
References: <1350547326-31407-1-git-send-email-maxime.ripard@free-electrons.com>
 <50805E2A.1010308@mind.be>
Message-ID: <508108C7.3000407@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 18/10/2012 21:53, Arnout Vandecappelle a ?crit :
> On 18/10/12 10:02, Maxime Ripard wrote:
>> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
>> ---
>>   boot/mxs-bootlets/barebox_ivt.bd |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/boot/mxs-bootlets/barebox_ivt.bd
>> b/boot/mxs-bootlets/barebox_ivt.bd
>> index e02ddd6..0c67e9c 100644
>> --- a/boot/mxs-bootlets/barebox_ivt.bd
>> +++ b/boot/mxs-bootlets/barebox_ivt.bd
>> @@ -28,7 +28,7 @@ section (0) {
>>       //----------------------------------------------------------
>>
>>           load barebox;
>> -        load ivt (entry = barebox:exception_vectors)>  0x8000;
>> +        load ivt (entry = barebox:start)>  0x8000;
>>       hab call 0x8000;
>>
>>   }
> 
>  Shouldn't this somehow depend on the selected barebox version then?

Well, I thought so at first, but since the next barebox release is in
less than two weeks now, and the 2012.07 (the only one we support that
is still using exception_vectors symbol) will be removed at that time,
so I finally gave up to write that code, just to have it removed/be
irrelevant in two weeks.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
