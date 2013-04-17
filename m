From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 18:42:24 +0200
Subject: [Buildroot] [PATCH v5 1/7] arch: toolchain: Introduce binary
 formats BINFMT_*.
In-Reply-To: <20130416205103.6ecd9bd9@skate>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <20130416205103.6ecd9bd9@skate>
Message-ID: <516ED0F0.6070804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/13 20:51, Thomas Petazzoni wrote:
> Dear Sonic Zhang,
>
> On Fri, 12 Apr 2013 18:18:23 +0800, Sonic Zhang wrote:
>
>> +# Set up target binary format
>> +choice
>> +	prompt "Target Binary Format"
>> +	default BR2_BINFMT_FDPIC if BR2_bfin
>> +	default BR2_BINFMT_ELF
>> +
>> +config BR2_BINFMT_ELF
>> +	bool "ELF"
>> +	depends on !BR2_bfin
>> +	help
>> +	  ELF (Executable and Linkable Format) is a format for libraries and
>> +	  executables used across different architectures and operating
>> +	  systems.
>
> I do agree with Arnout on one point here: we can hide this choice
> when !BR2_bfin. However, contrary to Arnout, I'd like to keep this
> BR2_BINFMT_ELF choice as an invisible option, that is always selected
> on !BR2_bfin. Yes it's useless, but I think it makes the binfmt options
> clearer.

  OK for me. Most important is that the choice is hidden when empty.

  Regards,
  Arnout

>
> Sonic, once this is changed, you have my Acked-by: Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> on this patch.
>
> Thanks!
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
