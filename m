From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 May 2012 14:33:37 +0200
Subject: [Buildroot] cp210x needed
In-Reply-To: <CAFC29aUB7tC3dh1U47_aMJ2bT2Twr_s4tTTz=WmbCuSM17Lyfg@mail.gmail.com>
References: <CAFC29aV9nhzG8_ZAG8j1QCGqY_Qv1tg39sGac-5sTUvQL=uRJw@mail.gmail.com>
 <20120517222149.3c657ce1@skate>
 <CAFC29aX+g8jJXvp=hMXuXX7WKLNXGuAQ9KeQFZ4Hdf822MNpfQ@mail.gmail.com>
 <20120517224505.31267c33@skate>
 <CAFC29aUB7tC3dh1U47_aMJ2bT2Twr_s4tTTz=WmbCuSM17Lyfg@mail.gmail.com>
Message-ID: <4FB8E4A1.3040508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/12 22:56, Ron Eggler wrote:
> reg at SemiosDesktop-reg:/usr/local/src/E10-buildroot/br1202-main$ make linux-menuconfig
[snip]
> > >> linux 3.2.7 Configuring
> cp "board/synapse/e10/linux-3.2.6-config"
> /usr/local/src/E10-buildroot/br1202-main/output/build/linux-3.2.7/arch/arm/configs/buildroot_defconfig
> cp: cannot create regular file
> `/usr/local/src/E10-buildroot/br1202-main/output/build/linux-3.2.7/arch/arm/configs/buildroot_defconfig': No such file
> or directory

  Until recently, buildroot was missing a dependency to make this
work the first time.  For now, just run

make linux-patch; make linux-menuconfig


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
