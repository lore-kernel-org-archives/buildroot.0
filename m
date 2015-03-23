From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Mar 2015 22:41:39 +0100
Subject: [Buildroot] [PATCH 1/5] kconfig-package: add support for config
 fragments
In-Reply-To: <20150323183116.GA4214@free.fr>
References: <550D86D4.7060808@mind.be>
 <495352807.1720289.1427098157544.JavaMail.root@openwide.fr>
 <20150323183116.GA4214@free.fr>
Message-ID: <55108893.2060003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/03/15 19:31, Yann E. MORIN wrote:
> J?r?my, All,
> 
> On 2015-03-23 09:09 +0100, Jeremy Rosen spake thusly:
>> ----- Mail original -----
>>> On 21/03/15 00:11, Yann E. MORIN wrote:
>>>> Floris, All,
>>>>
>> [...]
>>>> use a shell construct here, like:
>>>>
>>>>     $$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
>>>>         echo "Unable to perform $(1)-update-config when fragment
>>>>         files are set"; exit 1)
>>>
>>>  Or perhaps it's better to simply disable the update targets when
>>>  fragments are set:
>>>
>>> # Cannot update (def)config with fragments
>>> ifneq ($$($(2)_KCONFIG_FRAGMENT_FILES),)
>>> $(1)-update-config: ...
>>> ...
>>> endif
>>>
>>> [snip]
>>
>> I'm not sure... we are in a case where the user knows that the target
>> is supposed to exist. an unknown target message would be more
>> confusing than the OP's proposed error message. I would not be 
>> suprised if someone reported the missing target as a bug here...
> 
> Agred, But I guess that what Arnout suggested would be something like:
> 
>     $(1)-update-config:
>     ifneq ($$($(2)_KCONFIG_FRAGMENT_FILES),)
>         ...
>     else
>         echo ERROR.
>     enfi

 Actually I did mean what I said, but I also agree with Jeremy that it could be
confusing. So +1 to Yann's suggestion.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
