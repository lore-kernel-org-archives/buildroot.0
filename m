From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 22:33:18 +0100
Subject: [Buildroot] [PATCH 2/2 v3] xtensa: support configurable
 processor configurations
In-Reply-To: <50A169FC.6010708@zankel.net>
References: <509d9db2.4883440a.7065.016e@mx.google.com>
 <509DA516.40007@mind.be> <50A169FC.6010708@zankel.net>
Message-ID: <50A16B1E.8030703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/12 22:28, Chris Zankel wrote:
> Hi Arnout,
>
> On 11/09/2012 04:51 PM, Arnout Vandecappelle wrote:
>> On 11/10/12 01:20, Chris Zankel wrote:
>>> +config BR2_xtensa_custom
>>> +	bool "Custom Xtensa processor configuration"
>>> +config BR2_xtensa_fsf
>>> +	bool "fsf - Default configuration"
>>> +endchoice
>>    Put empty lines between the different config options.
> Done.
>>    All config names should be in capitals - the only exception is the
>> arch name itself (i.e. BR2_xtensa, but BR2_XTENSA_FSF).
> To give you some background, 'fsf' describes the default configuration
> used in the various toolchain packages (gcc, buildroot, etc.). The idea
> is to append the name of the processor configuration (for example,
> dc232b), so to follow other architectures, I think it would be best to
> keep lower-case for processor names, and upper case for other options.
>
> For the case above, it would look like this:
>
> config BR_XTENSA_CUSTOM
> ...
>
> config BR_xtensa_fsf
> ...
>
> config BR_xtensa_dc232b
> ...
>
> etc.
>
> I actually think that this makes a nice distinction between processor
> names and buildroot configuration options.

  ACK good point.

>
>
>>> +
>>> +config BR2_xtensa_custom_name
>>> +	string "Custom Xtensa processor configuration anme"
>>    anme ->  name
> Done
>>
>>> +	depends on BR2_xtensa_custom
>>> +	default ""
>>> +	help
>>> +	  Name given to a custom Xtensa processor configuration.
>>> +
>>> +config BR2_xtensa_core_name
>>> +	string
>>> +	default BR2_xtensa_custom_name	if BR2_xtensa_custom
>>> +	default ""			if BR2_xtensa_fsf
>>    Minor detail: missing "depends on BR2_xtensa".
> Done.
>>    Perhaps it's better to move the condition to a
>> if BR2_xtensa
>> ...
>> endif
>> around the entire file.  Thomas has a patch lined up to move all
>> the conditions outside of the Config.in.*
> It seems Xtensa would be the only one that uses that scheme, so maybe
> wait for the generic patch from Thomas?

  I don't think so. Then it means more work for Thomas to refresh his
patch.  There will be a merge conflict anyway between the two, but
with the condition outside the file the conflict will be small.

  That said, Peter hasn't merged Thomas's patch even though I acked
it, so maybe he has some fundamental objection to the principle.
Or maybe it's just because I didn't test it.

  Bottom line: this issue won't stop my ack.

[snip]

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
