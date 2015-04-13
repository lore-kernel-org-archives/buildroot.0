From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 01:09:38 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Change default
 to X.org modular server
In-Reply-To: <20150411183512.GM4221@free.fr>
References: <1428772436-16962-1-git-send-email-bernd.kuhls@t-online.de>
 <20150411195842.52a58aff@free-electrons.com> <20150411181330.GL4221@free.fr>
 <20150411201805.4bac425d@free-electrons.com> <20150411183512.GM4221@free.fr>
Message-ID: <552C4CB2.7070001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/15 20:35, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-04-11 20:18 +0200, Thomas Petazzoni spake thusly:
>> Dear Yann E. MORIN,
>>
>> On Sat, 11 Apr 2015 20:13:30 +0200, Yann E. MORIN wrote:
>>
>>> I would not mind much doing the switch to the modular Xserver by
>>> default. But that would mean proper dependency propagation (i.e. C++).
>>
>> I don't understand what you mean here.
> 
> See below...
> 
>>> However, an alternative solution would be to remove the 'default' clause
>>> altogether from the choice:
>>>
>>>   - if C++ is available, the modular Xserver is enabled by default,
>>>     being the first option in the choice;
>>>
>>>   - if C++ is not enabled, then KDrive is enabled, being the only optionhttp://patchwork.ozlabs.org/patch/400833/
>>>     in the choice.
>>
>> Well, Bernd's patch is doing that in a perfectly fine way. If C++ is
>> available, the default on modular will work. If C++ is not available,
>> since the modular option will not be available, the only remaining
>> option in the choice will be Kdrive, and it will be the selected option.
>>
>> Am I missing something?
> 
> No, not really.
> 
> Even though 'default' in Kconfig is not authoritative, and that's not
> even a warning to default to an option that has unmet dependencies, I
> still find it odd to default to that option.
> 
> And since the default is defaulting to the first entry in the choice, it
> is no longer needed at all.
> 
> At best, we could add a comment summarising the situation.

 Then it's better to go for Bernd's original patch [1] because it explicitly
gives the different defaults for the different situations.

 ThomasP's comment to that was that it is strange that a choice default depends
on the toolchain options. It makes sense to make a default depend on the arch
options, because we consider that something that can't be controlled by the
user, but changing the default based on toolchain options sounds a bit weird.

 But of course, we already have a bunch of those, although it's not as explicit
as in [1]. E.g. the media backend of dvdrw-tools defaults to cdrkit if
kernel-headers >= 3.0, else it defaults to xorriso; gpu-amd-bin-mx51 output
defaults to X11 if X11 is selected, else it defaults to framebuffer.

 So I'm in favour of going back to [1].

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/400833/


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
