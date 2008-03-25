From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 11:21:06 +0100
Subject: [Buildroot] question about /tftpboot
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
	<47E3F85A.7000608@eclis.ch>
Message-ID: <071301c88e62$eced8f30$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Habib Bouaziz-Viallet a ?crit :
> Hi all !
> 
> I would like my tftp server provides access to another directory (e.g
> /var/... param configured with /etc/inetd.conf  with my GNU Debian)
> 
> '/ tftpboot'. Changing '/ tftpboot' is apparently not possible from
> 'make menuconfig'
> 
> How do i do ? Many thanks
> 

There is a symbol BR2_LINUX_COPYTO to adjust that. Some time ago I found 
it broken by the target/linux/Makefile.in.advanced file and I proposed a 
patch in this bug report: http://bugs.uclibc.org/view.php?id=2384

Maybe the situation is better now.
-- 

The linux kernel should possibly be copied several times, and
you cannot use a single symbol for this.


Best Regards
Ulf Samuelsson
