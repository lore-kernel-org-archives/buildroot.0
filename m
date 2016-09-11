From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Sep 2016 23:15:00 +0200
Subject: [Buildroot] [PATCH RFC] pkg-kconfig: support alternative
 .config location
In-Reply-To: <20160911181150.GO5740@free.fr>
References: <1473613650-8245-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20160911173403.GN5740@free.fr> <20160911200726.7dac0633@itchy>
 <20160911181150.GO5740@free.fr>
Message-ID: <9746cd53-1ad9-f4df-01bb-f442dc518cd6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-16 20:11, Yann E. MORIN wrote:
> ?ric, All,
> 
> On 2016-09-11 20:07 +0200, Eric Le Bihan spake thusly:
>> Le Sun, 11 Sep 2016 19:34:03 +0200,
>> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
>>
>>> On 2016-09-11 19:07 +0200, Eric Le Bihan spake thusly:
>>>> Kconfig clones, such as openconf used by xvisor [1], do not look
>>>> for .config at the root of the build directory, but in a
>>>> subdirectory (e.g. build/openconf).
>>>>
>>>> This patch introduces a new Makefile variable named
>>>> $(2)_KCONFIG_BUILD_FILE, which defaults to $$($(2)_DIR)/.config and
>>>> can be overridden in the package Makefile.
>>>>
>>>> This allows the use of the kconfig-package infrastructure with
>>>> packages relying on such clones.
>>>>
>>>> [1] https://github.com/xvisor/xvisor/tree/master/tools/openconf
>>>>
>>>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>>>> ---
>>>>  package/pkg-kconfig.mk | 14 ++++++++------
>>>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
>>>> index b0f5178..82561de 100644
>>>> --- a/package/pkg-kconfig.mk
>>>> +++ b/package/pkg-kconfig.mk
>>>> @@ -36,6 +36,7 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
>>>>  $(2)_KCONFIG_OPTS ?=
>>>>  $(2)_KCONFIG_FIXUP_CMDS ?=
>>>>  $(2)_KCONFIG_FRAGMENT_FILES ?=
>>>> +$(2)_KCONFIG_BUILD_FILE ?= $$($(2)_DIR)/.config  
>>>
>>> I think it would be better to name the variable
>>> $(2)_KCONFIG_DOTCONFIG_FILE or maybe just $(2)_KCONFIG_DOTCONFIG.
>>
>> OK.
> 
> Before changing the variable name, please a bit ofr others to comment.

 I definitely agree with _DOTCONFIG. And the rest of the patch looks good to me
as well, at first sight.

 Regards,
 Arnout

> 
>>> Otherwise, the rest of the patch is a mere search-and-replace, so
>>> looks pretty OK.
>>>
>>> However, I don't see the point in having that in Buildroot without an
>>> actuall package that uses that. Do you plan in sending such a package
>>> (like xvisor)?
>>
>> Yes, I will send a patch to add a xvisor package shortly.
> 
> Great! Can you make that a series: this patch followed by the xvisor one?
> 
> Regards,
> Yann E. MORIN.
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
