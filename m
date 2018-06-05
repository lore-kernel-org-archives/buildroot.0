From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 5 Jun 2018 17:40:28 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] More complete usage string.
In-Reply-To: <e3d565da-4f03-65d8-dca2-dc5c0e195911@mind.be>
References: <20180605123959.21925-1-F.LaRoche@pilz.de>
 <e3d565da-4f03-65d8-dca2-dc5c0e195911@mind.be>
Message-ID: <1988012410.1374894.1528231228001.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Florian La Roche" <F.LaRoche@pilz.de>, "buildroot" <buildroot@buildroot.org>, "Carlos Santos"
> <casantos@datacom.ind.br>
> Cc: "ratbert90" <aduskett@gmail.com>
> Sent: Tuesday, June 5, 2018 5:06:39 PM
> Subject: Re: [Buildroot] [PATCH 1/1] More complete usage string.

> [+ Carlos who is working on init scripts]
> 
> On 05-06-18 14:39, Florian La Roche wrote:
>> More complete usage string for the logging service.
>> 
>> 
>> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
>> ---
>>  package/busybox/S01logging | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/package/busybox/S01logging b/package/busybox/S01logging
>> index 4632a4cc99..fcb3e7d236 100644
>> --- a/package/busybox/S01logging
>> +++ b/package/busybox/S01logging
>> @@ -33,7 +33,7 @@ case "$1" in
>>  	start
>>  	;;
>>    *)
>> -	echo "Usage: $0 {start|stop|restart}"
>> +	echo "Usage: $0 {start|stop|restart|reload}"
> 
> For this one, we should perhaps first decide on what we want to do in general
> with the init scripts. Do we want to define a reload target? And if we do, and
> it is equal to the restart target, do we want to have it in the help text?
> 
> First some statistics. We currently have:
> 
> - 109 init scripts
> -  75 define 'reload', 12 define 'force-reload', 6 both (so 81 total)
> -  63 define 'reload' as 'restart'
> -   7 define 'reload' as something else
> - 107 provide help text
> -  31 provide help text for 'reload'
> -  13 of the 63 that define reload == restart provide help text for reload
> -   7 of the 7 that define reload != restart provide help text for reload
> 
> 
> So my proposal for the "norm" would be:
> 
> - always defines reload
> - only document reload if reload != restart

I'd document it anyway, since it is still a valid argument.

> - decide what to do with force-reload later
> 
> Carlos, what do you think?

I agree. Reload in general means "keep running but reload the
configuration" while restart means stop, pause, start.

> In short, I would not apply this patch.

I would apply the patch, for the same reason above.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
