From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 6 Jul 2013 21:07:28 -0400
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <51D52F67.8050508@gmail.com>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
 <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
 <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
 <51D155A0.3010205@gmail.com> <51D26E29.6030805@mind.be>
 <20130702093415.5db13282@skate>
 <20130702071112.d2bed52344e1786c14494b36@lavabit.com>
 <87d2r0sknt.fsf@dell.be.48ers.dk>
 <CA+-urNQB5-1ZjvzV2mVdtFq2cnbb3R5r-LWLuVj0Si=LtKjOUQ@mail.gmail.com>
 <87ehbfrc4e.fsf@dell.be.48ers.dk> <51D52F67.8050508@gmail.com>
Message-ID: <CA+-urNT34vW4LptbJK0+ZuxXQppDrcGEJXE-7+jt0L_gsMf1fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 4, 2013 at 4:16 AM, Zoltan Gyarmati
<mr.zoltan.gyarmati@gmail.com> wrote:
> Hello,
>
> I'm also going to check this overall patch ( i don't know how i didn't
> find it earlier, thanks for the hint), and let the community know about
> my results.
>

The overall patch is missing a Makefile fix for passing flags to the
device tree compiler. This causes the am335x-boneblack.dtb file to be
incorrect and prevents capes (notably the eMMC virtual cape) from
coming up on boot.

Apply this patch (after the overall one) to fix:

https://github.com/fhunleth/buildroot-bbb/blob/bbb/board/beagleboneblack/linux-0001-Add-missing-DTC-flags.patch

Ethernet and other basic functionality is looking good so far...

Frank
