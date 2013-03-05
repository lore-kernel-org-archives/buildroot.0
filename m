From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Mar 2013 07:40:56 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate> <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
Message-ID: <51359378.3010307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/13 11:16, Kevin Chadwick wrote:
> Not saying this is the way to go at all as I haven't got stuck into mdev
> yet but thought I may as well air another option which Gentoo was
> following due to broken boot for seperate /usr without initramfs, which
> is to stay at the udev version 17? (I think before the 192?
> amalgamation or inheritance by an ignoramus) until the time that eudev
> is said to be ready for production.

  And this is exactly what Olivier Schonken's patch does, right? For 
systemd init systems, systemd's udev is used; for other init systems, the 
old udev 17 is used.

  As to compatibility of the udev library users: we can make them depend 
on BR2_ROOTFS_DEVICE_CREATION_SYSTEMD_DYNAMIC_UDEV if they really require 
the new udev. It's of course a pity that some simple package like 
libatasmart requires a specific init system to be installed, but that's 
what you get when you enter Leonard Poettering's cathedral...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
