From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 23:10:04 +0100
Subject: [Buildroot] [PATCH] add pre-build script
In-Reply-To: <20130214180402.6b2dbb17@skate>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
 <CAEBucnA1BebDBHWb4PcQBGiUpyiAcT0=vs3Tu4D+LVw1YdN0_A@mail.gmail.com>
 <20130214085604.52619b06@skate>
 <CAEBucnCBe83aOfTPOTfjvVjKNAdE0CbYp540-OPZy-ecgEYuMA@mail.gmail.com>
 <20130214180402.6b2dbb17@skate>
Message-ID: <511D60BC.9000205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/13 18:04, Thomas Petazzoni wrote:
> Dear Spenser Gilliland,
>
> On Thu, 14 Feb 2013 10:28:24 -0600, Spenser Gilliland wrote:
>
>> I'm not doing this with the specific implementation posted.  I'm just
>> saying it would be a nice feature to have.  Many device trees specify
>> processor/arch features and optimized cflags can be constructed from
>> this data.
>>
>> I currently do this outside of buildroot and just provide
>> BR2_TARGET_OPTIMIZATION on the make command line from the buildscripts
>> for the hardware.
>>
>> It would be nice to have buildroot completely self contained and not
>> require the software developers to download the additional hardware
>> files.
>
> Indeed, but the pre-build script approach you posted would not allow to
> customize the CFLAGS.

  Spenser didn't post it...

> The CFLAGS are part of Buildroot .config file,
> which is loaded at the time you run "make".

  Ah, right, major shortcoming if the pre-build script can't update the 
.config...

> So when your pre-build
> script gets executed by Buildroot, make has already loaded the value of
> BR2_TARGET_OPTIMIZATION.
>
> You would have to make a specific script that returns custom CFLAGS,
> and add some code in Buildroot that does:
>
> CUSTOM_CFLAGS = $(shell ./your/custom/script)

  This is a good place to do := instead of =, otherwise the script gets 
re-run for every build step...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
