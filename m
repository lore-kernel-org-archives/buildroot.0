From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 24 Aug 2015 23:42:07 +0200
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
In-Reply-To: <CAAMcf8COScfy62sEC4uPKHw=LgyLWWtic9ypCF0DZMfu21hzdg@mail.gmail.com>
References: <CAAMcf8CO9XsiTBOJX3APO+ZXtyPLDZmHq2EU0LPT3UXKhTC-=g@mail.gmail.com>
 <55D6F4A8.3000104@openwide.fr>
 <CAAMcf8COScfy62sEC4uPKHw=LgyLWWtic9ypCF0DZMfu21hzdg@mail.gmail.com>
Message-ID: <55DB8FAF.7060509@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente

Le 21/08/2015 19:56, vj a ?crit :
> Hello Romain,
> 
> On Fri, Aug 21, 2015 at 10:51 AM, Romain Naour <romain.naour@openwide.fr> wrote:
>> Hi Vicente,
>>
>> Le 21/08/2015 02:30, vj a ?crit :
>>> Hello Romain,
>>> I've tested you efl update
>>> https://github.com/RomainNaour/buildroot/tree/efl-1.15.0-v1
>>> It did not work, :(
>>> But applying the two patches below works again!
>>> The first one was already commented in a previous e-mail.
>>
>> Yes, sorry I haven't looked at your issue yet.
>>
>> libmount seems to be optional and can be disabled with --disable-libmount:
>> https://github.com/RomainNaour/buildroot/blob/efl-1.15.0-v1/package/efl/efl.mk#L35
> 
> Without that dependency it failed with 1.14.2.
> When I saw the dependency was not there in 1.15.0, I just added it
> again without checking.
> Just now I've tried it again without that patch and it's fine, so, you
> can forget it.
> Sorry for the hassle.

It's ok ;-) I haven't heavily tested with a minimal config.
Maybe next time can you post the last ~100 build log lines, it not always easy
to reproduce a build issue...

> 
>>
>> But since it's not recommended to disable it, I'll apply your patch :)
>>
>>> The second is related to a regression in efl-1.15.0.
>>
>> Can you report your issue to the efl mailing list ?
> 
> I know it would be better to have it fixed upstream, but have no time
> for that now.
> If you would like to, feel free to report it.
> To debug it, it helps enabling the WRN and DGB macros in eina_module.c.

Well, I can't really report an issue that I can't reproduce.

See, I reported the issue about SDL2 dependency and it's now fixed in the efl
1.15.1. So, I can drop the last patch and avoid to autoreconf the package.

Also, I'm probably not the good person to report an efl issue.
Honestly, I don't know what to do with -fvisibility=default.
It would be better if you can send just an email to the enlightenment mailing
list to report your issue.

> 
>>
>>> The testing I've done has been with the musl libc and with
>>> BR2_PACKAGE_EFL_RECOMMENDED_CONFIG unset.
>>> Basically the same config as in the previous e-mail.
>>>
>>> A minor issue: check the spelling of recommanded.
>>
>> Ha indeed recommanded is used in Config.in prompt
>> (my French was turned on sorry ;-) )
>>
>> Thanks for testing!
> 
> Thanks for adding musl and maintaining efl!

You're welcome!

Best regards,
Romain
