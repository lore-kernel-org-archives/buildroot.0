From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Feb 2011 15:28:37 +0200
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <201102241359.42509.dargaud@lpsc.in2p3.fr>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
	<AANLkTimvTBzuBY5gpdGmcWDVdMAntznMRPTB6stdK=6F@mail.gmail.com>
	<201102241359.42509.dargaud@lpsc.in2p3.fr>
Message-ID: <20110224132837.GC5481@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

On Thu, Feb 24, 2011 at 01:59:42PM +0100, Guillaume Dargaud wrote:
> On Thursday 24 February 2011 12:30:51 Daniel Nystr?m wrote:
> > 2011/2/24 Guillaume Dargaud <dargaud@lpsc.in2p3.fr>:
> > > # Put a getty on the serial port
> > > ttyUL0::respawn:/sbin/getty -L ttyUL0 115200 vt100 # GENERIC_SERIAL
> > 
> > Try replace this line with:
> > ::respawn:-/bin/sh
> > 
> > And see if that works?
> 
> Boot stops after:
> Freeing unused kernel memory: 108k init
> 
> I have a feeling the mounts at the begining of inittab don't work... As seen 
> from the NFS server, there's nothing in /proc, /tmp. /dev/pts, /sys...

These content of these directories (virtual filesystems) is only seen on the 
target machine, not the host.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
