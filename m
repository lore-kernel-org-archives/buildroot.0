From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2011 18:16:09 +0200
Subject: [Buildroot] [PATH 0/1] package/ncurses: disable use of the GPM
	library
In-Reply-To: <201109141206.40645.yann.morin.1998@anciens.enib.fr>
References: <1315958717-9861-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <20110914092105.78c61a10@skate>
 <201109141206.40645.yann.morin.1998@anciens.enib.fr>
Message-ID: <201109141816.10815.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 14 September 2011 12:06:40, Yann E. MORIN wrote:
> On Wednesday 14 September 2011 09:21:05 Thomas Petazzoni wrote:
> > Le Wed, 14 Sep 2011 02:05:16 +0200,
> > 
> > "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :
> > > That host-ldd is then installed as $(HOST_DIR)/usr/bin/ldd, which is
> > > first in the PATH.
> > 
> > When you build uClibc for ARM, uClibc installs an host-ldd ?
> 
> Well, this time it was for MIPS.
> 
> > Why is this ldd necessary ?
> 
> Probably not `necessay' for buildroot, but this host-ldd tries to be the
> Holy Grail of cross-compilation: an ldd that can interpret the target
> ELF files, and behaves the same as if it was run on the target.

 It should then be called <arch-tuple>-ldd, like the crosstool-ng one, right?

[snip]
> But you're right. The proper way to fix this is to decide whether that
> host-ldd is usefull or not.

 It's useful in the same way that cross-gdb is useful.

 However, there sure is something broken about it: it should use the staging 
directory as sysroot, not /.  This would also fix the ncurses case.  
(Actually, also the cross-gdb could benefit from this; now you always have to 
do a 'set solib-absolute-prefix ...' for remote debugging.)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
