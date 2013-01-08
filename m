From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 15:27:44 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
 pointing to our .config
In-Reply-To: <201301081446.01172.yann.morin.1998@free.fr>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
 <201301081351.38832.yann.morin.1998@free.fr> <50EC1A1B.5080804@mind.be>
 <201301081446.01172.yann.morin.1998@free.fr>
Message-ID: <50EC2CE0.2050106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/01/13 14:46, Yann E. MORIN wrote:
> Arnout, All,
>
> On Tuesday 08 January 2013 14:07:39 Arnout Vandecappelle wrote:
>> On 08/01/13 13:51, Yann E. MORIN wrote:
>>> On Tuesday 08 January 2013 07:50:51 Arnout Vandecappelle wrote:
>>>> On 07/01/13 22:52, Yann E. MORIN wrote:
>>> [--SNIP--]
>>>>> +# Scripts in support/ may need to parse out .config, so give
>>>>> +# them easy access
>>>>> +export BR2_CONFIG_FILE=$(CONFIG_DIR)/.config.
>>>>
>>>>     Convention is that BR2_* is set by Kconfig. I kind of like that, it
>>>> helps us developers to understand a variable's meaning.
>>>
>>> I am afraid CONFIG_FILE as is could clash with some packages.
>>> Maybe DOT_CONFIG instead? I'll use that.
>>
>>    DOT_CONFIG is equally likely to conflict.
>>
>>    (None of our own files use CONFIG_FILE, cfr. 'git grep -w CONFIG_FILE').
>
> I was not referring to our .mk files, but rather to the packages themselves.
> I did a quick survey in 110+ packages, and:
>    - kconfig-based packages are not affected: kernel, uClibc, busybox, ct-ng
>    - packages using CONFIG_FILE:
>      - gdb:     gdb/sim/ppc/Makefile.in:CONFIG_FILE = @sim_config@
>      - xbmc:    xbmc/lib/freetype/builds/detect.mk:ifndef CONFIG_FILE
>    - no package uses DOT_CONFIG
>    - openbricks is using DOT_CONFIG, too

  But if you anyway change the name, BUILDROOT_CONFIG is better than the 
non-specific DOT_CONFIG.

  How long can we discuss about a name? :-)


  Regards,
  Arnout

>
> List of tested packages in attached file, searched for with:
>      grep --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn  \
>           -r -E '\<(CONFIG_FILE|DOT_CONFIG)\>' * 2>/dev/null
>
> Regards,
> Yann E. MORIN.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
