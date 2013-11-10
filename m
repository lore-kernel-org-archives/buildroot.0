From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Nov 2013 08:25:25 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
Message-ID: <20131110062525.GB1030@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Nov 09, 2013 at 07:15:43PM +0100, Thomas Petazzoni wrote:
> If you're Cc'ed on this e-mail, it means that there is a question for
> you below. Here is a summary of who should look at what problems (note
> that some problems are not affected to anyone, either because the
> reason is unknown or because there is no clear "owner" for the problem):
> 
> Markos Chandras			aespipe, fdk-aac, gmp, libiscsi
> Sonic Zhang, Aaron Wu		boost, icu, openpgm
> Chris Zankel			cdrkit
> Peter Korsgaard			gst1-plugins-bad, pulseaudio
> Gustavo Zacarias		protobuf-c, mplayer, nettle (ARM), php
> Simon Dawson			libcap-ng, util-linux, zeromq, zmqpp
> Spenser Gilliland		libglib2, nettle (Microblaze), openssl
> Ezequiel Garcia			libnspr
> Mischa Jonker			pulseaudio, ti-utils
> Fatih A??c?			qt5base
> Tzu-Jung Lee			tstools
> 
[snip]
> >     xtensa |                  cdrkit-1.1.11 | NOK | 
> >     http://autobuild.buildroot.net/results/0315c117986f3aac8c0719d744cb47ee03738ee9/
> 
> [ 58%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/record.o
> ../libusal/libusal.a(scsi-remote.o):(.literal+0xe0): undefined reference to `valloc'
> 
> Chris, can you have a look at this one, since it's apparently a
> Xtensa-specific problem?

uClibc valloc() depends on UCLIBC_SUSV2_LEGACY which is not enabled in the 
default uClibc config. Should we enable it?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
