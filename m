From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Oct 2015 22:20:54 +0100
Subject: [Buildroot] [PATCH 04/21 v2] core: commonalise the bundled and
 br2-external %_defconfig rules
In-Reply-To: <20151026205650.GB3788@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <3b01a81ac78b8ca787b1e0308e819d8eb2ece1df.1445545973.git.yann.morin.1998@free.fr>
 <562E8CCC.20505@mind.be> <20151026205650.GB3788@free.fr>
Message-ID: <562E9936.6060202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26-10-15 21:56, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-10-26 21:27 +0100, Arnout Vandecappelle spake thusly:
>> On 22-10-15 22:33, Yann E. MORIN wrote:
[snip]
>>> ---
>>>  Makefile | 13 ++++++-------
>>>  1 file changed, 6 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 60cea32..052f58a 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -789,13 +789,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>>>  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
>>>  
>>>  # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
>>
>>  This comment should go inside the define
> 
> Why? The macro only generates Makefile code, so we don;t care that
> comment being replicated for both cases.

 Because the comment should be as close as possible to statement it relates to.
So actually it should be placed after the %_defconfig (which is possible now
since there is only one).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
