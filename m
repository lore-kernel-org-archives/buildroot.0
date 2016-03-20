From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Mar 2016 20:39:20 +0100
Subject: [Buildroot] [PATCH v2 08/17] uclibc: context functions are not
 Thumb-compatible
In-Reply-To: <20160319190733.7d7c0535@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ED7C39.6010104@mind.be> <20160319190733.7d7c0535@free-electrons.com>
Message-ID: <56EEFC68.2030908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/16 19:07, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 19 Mar 2016 17:20:09 +0100, Arnout Vandecappelle wrote:
[snip]
>> uclibc: context functions are not Thumb-compatible
>>
>> On platforms that do support the ARM instruction set, there is no problem, as
>> the context functions are built unconditionally in ARM mode.
>>
>> However, on platforms that only support the Thumb instruction set, the context
>> functions cannot be built since the assembler code is not Thumb-ready.
>> Therefore, these functions must be disabled. All Thumb1 platforms support ARM
>> instructions, so this is only relevant for Thumb2 platforms (i.e., Cortex-M).
>
> I would do: "only relevant for Thumb2-only platforms". Cortex-A is a
> Thumb2 platform, but does not have any problem as it also supports the
> ARM instruction set.

  Right!

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
