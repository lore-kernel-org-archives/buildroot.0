From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jun 2015 18:41:14 +0200
Subject: [Buildroot] [PATCH 2/4] core/pkg-kconfig: move the kconfig
 fixups to a macro
In-Reply-To: <20150612221758.GH3583@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>	<cdb72fa7204d35b88f2b74e79d4d1117b797712d.1433591404.git.yann.morin.1998@free.fr>	<20150612233350.4511dc7c@free-electrons.com>
 <20150612221758.GH3583@free.fr>
Message-ID: <557C5D2A.6020705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/13/15 00:17, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-06-12 23:33 +0200, Thomas Petazzoni spake thusly:
>> On Sat,  6 Jun 2015 13:54:24 +0200, Yann E. MORIN wrote:
>>>  # In order to get a usable, consistent configuration, some fixup may be needed.
>>>  # The exact rules are specified by the package .mk file.
>>> -$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
>>> +define $(1)_FIXUP_KCONFIG
>>>  	$$($(2)_KCONFIG_FIXUP_CMDS)
>>>  	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>>
>> We could use $(@D) instead of $$($(2)_DIR) here.
> 
> Yes, and Arnout suggested the same in another series I sent.
> 
> My reasoning for using $($(2)_DIR) is that we are in the infra, and we
> do have this variable, while $$(@D) only works when there is an actual
> file being generated, which is not always the case.
> 
> See for example the followup patch, for which we have to fake @D because
> of those package-provided macros that may need it.
> 
> So, I prefer using $($(2)_DIR) because I /know/ what it is, while $(@D)
> I don;t know beforehand if it would be set.

 I was going to stick to my guns and say it has to be @D (cfr. the workaround I
proposed on the following patch). However, what you say makes complete sense, so
let's keep it at $(2)_DIR. It's also more readable anyway.

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
