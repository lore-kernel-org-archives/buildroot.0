From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 16 Apr 2008 22:47:23 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
References: <20080415214647.D2C693C53C@busybox.net><20080415223131.GB27329@cloud.net.au>	<002f01c89f7b$fae7fb00$050514ac@atmel.com>
	<004301c89f7f$51139540$050514ac@atmel.com>
	<480595BE.3030105@eclis.ch>
	<008401c89f9c$9a0b8560$050514ac@atmel.com>
	<4805F17C.7050107@eclis.ch>
	<065801c89fcd$c457f570$dfb5fea9@atmel.com>
	<480643F6.1070800@eclis.ch>
Message-ID: <000601c8a058$c21680c0$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> "Advanced build" is a selection done in the target/linux/Config.in's.
> 
> I my test I never changed the Linux kernel configuration, only the top 
> level ".config". In fact I used exactly this command:
> 
> git clean -dfx && git reset --hard && git svn rebase && ( yes "" | make 
> at91sam9261ek_defconfig ) && mv .config .config.def && sed 
> 's#/tftpboot#/var/lib/tftpboot#' < .config.def > .config  && ( yes "" | 
> make )
> 


And you can also create your own custom board
Do the following (Once!):

1) cd ~
2) mkdir -p buildroot
3) mkdir -p buildroot/local
4) Edit "~/.bashrc"
    export BUILDROOT_LOCAL=~/buildroot/local
    <save>
5) make at91sam9261ek_defconfig
6) make menuconfig
    Change BR2_LINUX_COPYTO_TFTPBOOT to "n"
    <save>
7) make saveconfig

================
Now, if you downloaded a new svn, you only have to do (IIRC)

make BOARD=at91sam9261ek getconfig
make


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
