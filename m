From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 26 Jun 2017 11:17:06 +0100
Subject: [Buildroot] [PATCH v3 1/4] infra: add support for MIPS NaN
In-Reply-To: <0860643a-6a85-64c8-b8ae-d4db42f647dd@mind.be>
References: <20170623172825.5778-1-Vincent.Riera@imgtec.com>
 <1c0912da-f972-8b80-1ee0-ea48b52d688f@mind.be>
 <0860643a-6a85-64c8-b8ae-d4db42f647dd@mind.be>
Message-ID: <496427aa-0bf0-9e76-0cec-04dcc20f4ca5@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

first of all, thanks for the review.

On 24/06/17 09:51, Arnout Vandecappelle wrote:
> 
> 
> On 23-06-17 23:56, Arnout Vandecappelle wrote:
>>> +config BR2_MIPS_NAN_LEGACY
>>> +	bool
>>> +	default y		if BR2_MIPS_CPU_MIPS32 || BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64 || BR2_MIPS_CPU_MIPS64R2
>>  Don't put spaces between y and if, and do only one per line.
>>
>>  However, mixing these default y with select from BR2_mips_m5150 etc. is not
>> good. Either you have a list of default y here, or you do select from
>> BR2_MIPS_CPU_MIPS32 etc. I have a slight preference for the latter.
> 
>  Just to be clear: this is the only thing that needs to be changed in this
> patch, then it's OK for me.

I'll change that. Thanks.

There is also one more important change to do for fixing uClibc
compilation. I'll include it as well.

> 
>  Oh, and also what happens with external toolchains configured for the wrong NaN.

Some external toolchains can build code for both NaN. For instance, the
ones that are included in Buildroot...

  toolchain-external-codescape-img-mips
  toolchain-external-codescape-mti-mips
  toolchain-external-codesourcery-mips

...they do support both NaN. In that case, nothing has to be done.

But, if your external toolchain only supports one NaN, then you need to
make that external toolchain depend on either BR2_MIPS_NAN_LEGACY or
BR2_MIPS_NAN_2008.

Regards,

Vincent

> 
>  Regards,
>  Arnout
> 
