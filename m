From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 07 Feb 2015 16:11:50 +0100
Subject: [Buildroot] [PATCH] Export BR2_EXTERNAL for post-build/support
 scripts
In-Reply-To: <20150204162117.GC4586@free.fr>
References: <1423064097-1151-1-git-send-email-julian@jusst.de>
 <20150204161907.GB4586@free.fr> <20150204162117.GC4586@free.fr>
Message-ID: <54D62B36.8070002@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Julian, All,

Le 04/02/2015 17:21, Yann E. MORIN a ?crit :
> Julian, All,
> 
> On 2015-02-04 17:19 +0100, Yann E. MORIN spake thusly:
>> On 2015-02-04 16:34 +0100, Julian Scheel spake thusly:
>>> Especially post-build scripts might want to make use of BR2_EXTERNAL variable,
>>> so export it.
>>
>> As discussed on IRC, there is another solution to export BR2_EXTERNAL,
>> which is to add it to EXTRA_ENV, like so:
> [--SNIP--]
> 
> And to complete my previous reply: I don;t really mind which way we're
> doing it: your solution or mine are equaly acceptable to me.
> 
> Regards,
> Yann E. MORIN.
> 
>>> Signed-off-by: Julian Scheel <julian@jusst.de>
>>> ---
>>>  Makefile | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index e554a30..92ae3fa 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -349,6 +349,7 @@ endif
>>>  # Scripts in support/ or post-build scripts may need to reference
>>>  # these locations, so export them so it is easier to use
>>>  export BR2_CONFIG
>>> +export BR2_EXTERNAL

I have applied the same patch to be able to use BR2_EXTERNAL in a post-image
script. But I'm agree that adding BR2_EXTERNAL to EXTRA_ENV is enough.

Best regards,
Romain
>>>  export TARGET_DIR
>>>  export STAGING_DIR
>>>  export HOST_DIR
>>> -- 
>>> 2.2.1
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> -- 
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
