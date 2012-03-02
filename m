From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Mar 2012 23:00:01 +0000
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target
	device (flash drive)
In-Reply-To: <20120301175921.5811b398@skate>
References: <jio6ql$25v$1@dough.gmane.org> <20120301175921.5811b398@skate>
Message-ID: <201203022300.01500.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 01 March 2012 16:59:21 Thomas Petazzoni wrote:
> You need to run grub so that it installs itself on your /dev/sdc
> device. Something like:
> 
> printf "device (hd0) /dev/sdc\nroot (hd0,0)\nsetup (hd0)\nquit\n" | output/staging/sbin/grub --device-map=/dev/null --no-floppy
> 
> Let us know if that works. We should certainly extend the documentation
> with more details about this.

 It probably won't work if your target is uclibc-based (unless your host
happens to be uclibc-based as well :-).  You'd need a host-grub to get
that right.  I tried to do that half a year ago, but it wasn't so easy -
unfortunately I don't remember why not.  Could be a problem with 32/64 bit.
Or with ccache.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
