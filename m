From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Jun 2017 10:51:45 +0200
Subject: [Buildroot] [PATCH v3 1/4] infra: add support for MIPS NaN
In-Reply-To: <1c0912da-f972-8b80-1ee0-ea48b52d688f@mind.be>
References: <20170623172825.5778-1-Vincent.Riera@imgtec.com>
 <1c0912da-f972-8b80-1ee0-ea48b52d688f@mind.be>
Message-ID: <0860643a-6a85-64c8-b8ae-d4db42f647dd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-06-17 23:56, Arnout Vandecappelle wrote:
>> +config BR2_MIPS_NAN_LEGACY
>> +	bool
>> +	default y		if BR2_MIPS_CPU_MIPS32 || BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64 || BR2_MIPS_CPU_MIPS64R2
>  Don't put spaces between y and if, and do only one per line.
> 
>  However, mixing these default y with select from BR2_mips_m5150 etc. is not
> good. Either you have a list of default y here, or you do select from
> BR2_MIPS_CPU_MIPS32 etc. I have a slight preference for the latter.

 Just to be clear: this is the only thing that needs to be changed in this
patch, then it's OK for me.

 Oh, and also what happens with external toolchains configured for the wrong NaN.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
