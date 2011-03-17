From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 17 Mar 2011 14:50:03 -0700
Subject: [Buildroot] Buildroot in use
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835815BCC604@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>	<20110315180743.5e34890b@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>	<20110315192211.3c59f861@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>	<20110315210538.1973f87f@surf>	<779935.72384.qm@web161802.mail.bf1.yahoo.com>	<4D81FB3E.7060307@carallon.com>	<1D6034426110564DA0DEA9EE9793B3835815B51A9B@NBE-MBX01.americas.swk.pri>
	<4D82421C.9020704@gmail.com>
	<1D6034426110564DA0DEA9EE9793B3835815BCC604@NBE-MBX01.americas.swk.pri>
Message-ID: <4D82820B.4010600@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/11 12:42, Heyendal, Carl wrote:
> Makes sense.
>
> Another thing I have noticed that is frustrating is that a 'make clean' acts more like 'make distclean' and therefore you lose any configuration changes you have previously made.
>
> As a work around, can I copy the relevant .configs before the 'make clean' and add them back once the rebuild is complete (assumed that I need to delete the .stamp_compiled files as well)?
>
> /carl h.
>
Hi Carl,

Please don't top post and trim stuff after your message.

Yes, "make clean" destroys buildroot's .config. I have a "bsp" type 
directory with stuff specifically for the project I am working on. I do 
a sym-link from configs/beagleboard_defconfig to my bsp config. Then 
after a make clean I do a "make beagleboard_defconfig" to copy in my 
saved configuration. I also put the linux and u-boot and whatever 
configs in my bsp and point to the appropriate config in the buildroot 
.config. Dont forget to update your bsp config whenever you change 
buildroot with a make menuconfig.

Regards, Steve
