From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 14 Feb 2013 10:28:24 -0600
Subject: [Buildroot] [PATCH] add pre-build script
In-Reply-To: <20130214085604.52619b06@skate>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
 <CAEBucnA1BebDBHWb4PcQBGiUpyiAcT0=vs3Tu4D+LVw1YdN0_A@mail.gmail.com>
 <20130214085604.52619b06@skate>
Message-ID: <CAEBucnCBe83aOfTPOTfjvVjKNAdE0CbYp540-OPZy-ecgEYuMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 14, 2013 at 1:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Spenser Gilliland,
>
> On Wed, 13 Feb 2013 19:04:30 -0600, Spenser Gilliland wrote:
>
>> I have a use case for this.  In Microblaze builds, it would be nice to
>> generate optimal cflags from the dts/mhs for use in all software.
>> This could be accomplished by a pre script.
>
> Do you have the example of pre-build script that does this? Changing
> the CFLAGS requires changing some internal Buildroot make variables, so
> I'm not sure how you're doing this from a pre-build script.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

I'm not doing this with the specific implementation posted.  I'm just
saying it would be a nice feature to have.  Many device trees specify
processor/arch features and optimized cflags can be constructed from
this data.

I currently do this outside of buildroot and just provide
BR2_TARGET_OPTIMIZATION on the make command line from the buildscripts
for the hardware.

It would be nice to have buildroot completely self contained and not
require the software developers to download the additional hardware
files.

Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
