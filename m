From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 15:53:49 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-09
In-Reply-To: <20141110073015.A5296101317@stock.ovh.net>
References: <20141110073015.A5296101317@stock.ovh.net>
Message-ID: <5460DF8D.6090705@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-11-09

>       mipsel |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/e2d343535955b5bdbdcc299e4ebc139629a43268/
>       mipsel |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/ff9ed332803d6cff38b94bbc4db8baab2a94f73f/

Both fail because of this:

setreuid.c:(.text+0x0): multiple definition of `setreuid'

Re-reported upstream:
  http://lists.uclibc.org/pipermail/uclibc/2014-October/048699.html

>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/bb8ab5ea7ed02cf17c46522903b4e46035e47f16/

I thought this was already fixed upstream... I need to report this
again. It's a failure with MIPS64 n32, probably because it's not taken
into account that MIPS64 n32 has 32-bit pointers and integers instead of
64-bit.

>       mipsel |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/5fa1c9a33702881827b99fb67dc9b3409c0e2bd6/

Not MIPS specific. It fails when building with debug symbols.

Reported upstream:
  http://lists.libsdl.org/pipermail/sdl-libsdl.org/2014-November/096804.html

Related:
  http://patchwork.ozlabs.org/patch/400969/

>     mips64el |     xserver_xorg-server-1.16.1 | NOK | http://autobuild.buildroot.net/results/df92d9b682976b77d9e1e4c39afca52b7512d847/

Reported upstream:
  https://bugs.freedesktop.org/show_bug.cgi?id=79939

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
