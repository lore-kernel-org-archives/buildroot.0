From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Sat, 15 Nov 2008 09:28:28 -0000
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <COL102-DS21DE57562B03C89036385DC110@phx.gbl>
References: <20081111183231.E74AC3C989@busybox.net><BD79186B4FD85F4B8E60E381CAEE1909CEAAE5@mi8nycmail19.Mi8.com><20081112085548.105af9b2@surf><1363312C-9914-45B9-9A58-86C6CB8AD38B@valka.is><e4c675870811142206p1100c2a6ha571f1fbe5a5ba1e@mail.gmail.com>
	<COL102-DS21DE57562B03C89036385DC110@phx.gbl>
Message-ID: <COL102-DS82F70DDCA07D89BA0B990DC110@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have also found some stuff suggesting
-R /PATH/To/LIBRARIES can be passed to LD_FLAGS

perhaps we could use that?
i.e
-R $(STAGING_DIR)/lib -R$(STAGING_DIR)/usr/lib

As is seems LD__RUN_PATH gets overridden all the time.

Any one with advice welcome!
Daniel Laird

--------------------------------------------------
From: <danieljlaird@hotmail.com>
Sent: Saturday, November 15, 2008 9:22 AM
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>; "Arnar Mar Sig" 
<antab@valka.is>
Cc: <buildroot@uclibc.org>
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package

> We have some issues regarding this patch.
> The problem is that buildroot when it builds its own compiler gets rpath 
> etc
> setup properly.
> If you try to build buildroot with an external toolchain then this fails 
> and
> various issues are seen.
>
> Currently Thomas and myself have posted various forms of a patch that 
> tries
> to get buildroot working
> with an external toolchain as both of us (I believe) require this
> functionality.
>
> The problem appears to be that if *-gcc is compiling to a object file then
> the --rpath-link options are not necessary and it complains.
> currently however when gcc is doing the linking then it requires 
> the --rpath
> options.
>
> I am not a gcc expert or a particular toolchain expert so I would love
> someone who might know to try and
> help us on how to use an external toolchain with buildroot and the
> correct --rpath flags at the right time.
>
> I have found some stuff on LD_RUN_PATH, maybe this could be used? any help
> is really appreciated,
> it currently seems a shame that buildroot and external toolchain support 
> is
> not quite as good as it could be!
>
> cheers
> daniel Laird
> --------------------------------------------------
> From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
> Sent: Saturday, November 15, 2008 6:06 AM
> To: "Arnar Mar Sig" <antab@valka.is>
> Cc: <buildroot@uclibc.org>
> Subject: Re: [Buildroot] svn commit: trunk/buildroot/package
>
>> 2008/11/12 Arnar Mar Sig <antab@valka.is>:
>>>
>>> On Nov 12, 2008, at 8:55 AM, Thomas Petazzoni wrote:
>>>
>>>> Le Tue, 11 Nov 2008 20:09:06 -0500,
>>>> "hartleys" <hartleys@visionengravers.com> a ?crit :
>>>>
>>>>> Each source file hit with CC produces a warning message. Everything
>>>>> hit with LD is fine. Here's a snip of the output:
>>>>>
>>>>> ...
>>>>> LD      lib/zlib_inflate/zlib_inflate.o
>>>>> LD      lib/zlib_inflate/built-in.o
>>>>> CC      lib/audit.o
>>>>> arm-linux-gcc: --rpath-link: linker input file unused because linking
>>>>> not done
>>>>> arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/lib:
>>>>> linker input file unused because linking not done
>>>>> arm-linux-gcc: --rpath-link: linker input file unused because linking
>>>>> not done
>>>>> arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/usr/
>>>>> lib:
>>>>> linker input file unused because linking not done
>>>>
>>>> Odd. I did try to build the kernel and didn't see this messages. I
>>>> will
>>>> try something else.
>>>>
>>>> Sincerly,
>>>>
>>>> Thomas
>>>
>>>
>>> This also happen when building for AVR32.
>>
>> It happens in i586 too, please take a look to this report
>>
>> http://busybox.net/bugs/view.php?id=6324
>>
>> may be it is related with your changes.
>>
>> Ciao,
>> -- 
>> /roberto
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
