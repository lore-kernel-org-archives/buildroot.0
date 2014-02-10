From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 18:34:50 +0100
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <CAEqQue1SBkXUggJfRZ_J1x5FmWwSAYxiDoVZhSQpmuqD6b=_Dg@mail.gmail.com>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>	<20140130200821.2c0559d8@skate>	<CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>	<20140131090444.725c88d4@skate>	<CAEqQue1m_d_ouJMoHqzjyvWawHFry_1C9S39E=1AeyJqFD6R9Q@mail.gmail.com>	<52F0ADF4.8080509@mind.be>	<CAEqQue2LWkRXk6xDW=znSzenJ41kGeRNc_uGj0bOM0ChhkEKeQ@mail.gmail.com>
 <CAEqQue1SBkXUggJfRZ_J1x5FmWwSAYxiDoVZhSQpmuqD6b=_Dg@mail.gmail.com>
Message-ID: <52F90DBA.5040706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/09/14 13:12, servo gmrt wrote:
> 2.  My host system is "i686" but i am building linux for "i486", whenever
> i executed the "make linux-menuconfig", buildroot only builds the
> linux-kernel modules, it is not building the rtai modules, while testing
> the new build system and rtai, kernel reports the "unknown symbols in
> rtai modules".
> 
> 3.  Is there any provision in buildroot, to automatically build the RTAI
> modules whenever "make linux-menuconfig" executed ?

 Since I never used RTAI myself, I'm just guessing here, but I guess the
rtai modules are patched directly into the kernel with the rtai patch. In
that case, it's the kernel's build system that takes care of dependency
tracking. Normally the kernel build system is quite good at getting the
dependencies right, but perhaps the rtai people fumbled it. Note, BTW,
that 'make linux-menuconfig' doesn't rebuild anything, you have to do a
'make' again to actually build.

 If the rtai modules are not patched into the kernel but are built as
part of the rtai package, then you have to do an explicit 'make
rtai-rebuild' after the menuconfig. When you do a partial rebuild,
buildroot doesn't try to guess which packages should be rebuilt as well.
This is intentional, because it would be pretty complex to do, and not
guaranteed to be correct anyway.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
