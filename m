From: Mats Iderup <mats.iderup@comhem.se>
Date: Fri, 16 May 2008 20:55:04 +0200
Subject: [Buildroot] how can I change IP numbers when using 'defenv'?
In-Reply-To: <1210961478.6164.22.camel@bchome>
References: <1210961478.6164.22.camel@bchome>
Message-ID: <1210964105.6356.11.camel@bchome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Ok,

I find some hints.

?U-Boot> defenv
U-Boot> run config
U-Boot> run get
U-Boot> bootm 21000000


New environment settings is fetched from
host /tftpboot/autoscript.at91sam9260dfc
when invoking the 'run config'.

Still bootargs holds old variables.

Perhaps also updated when I also build rootfiles......

thanks

Mats





On Fri, 2008-05-16 at 20:11 +0200, Mats Iderup wrote:
> Hi,
> 
> I am trying to change the default IP settings before using the 'defenv'
> command in U-Boot on an at91sam9260ek board.
> 
> I have changed ip, serverip, gatewayip and ethaddr in
> "at91sam9260dfc_defconfig" and then configured a minimal system without
> fs and any extra target packages.
> 
> Also searched hole buildroot tree and changed every existing ?ip,
> serverip, gatewayip and ethaddr in files like Config.in and cmd_defenv.c
> to my wanted ip numbers.
> 
> Then using 'make' to generate only bootstrap and u-boot binaries.
> 
> NOW to the problem:
> 
> After downloading, booting the board and invoking the 'defenv' command
> I still get the original settings:
> 
> len=149: root=/dev/ram rw initrd=0x2118C000,6000000 ramdisk_size=15360
> ip=10.175.196.18:10.175.196.221:10.175.196.1:255.255.255.0
> console=ttyS0,115200,mem=64M
> 
> Would appriciate any hint on how/when/where these IP settings can be
> changed.
> 
> regards
> 
> Mats 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
