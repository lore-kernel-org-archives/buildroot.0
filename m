From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 17 Dec 2007 18:14:25 +0200
Subject: [Buildroot] Buildroot and Linux/ARM on AT91SAM9260
In-Reply-To: <6E89F2D1-2F8C-4F77-ADA8-2727407BBE6C@oregonstate.edu>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>	<20071129133008.GB20914@real.realitydiluted.com>	<FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
	<6E89F2D1-2F8C-4F77-ADA8-2727407BBE6C@oregonstate.edu>
Message-ID: <4766A061.7060308@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan Ordway wrote:
> I've been using Buildroot with a board based on the AT91SAM9260. I was  
> able to get a successful kernel build (2.6.21.6) and buildroot build  
> (buildroot-atmel-20070521) using gcc 4.0.4, binutils 2.17 and uClibc  
> 0.9.28.3. I've been trying to get an updated build from various  
> different versions of buildroot from buildrooot-atmel-20070607,  
> buildroot-trunk, etc. and while things build fine with some tweaking  
> none of the toolchain combinations seem to generate working binaries.  
> I've tried using EABI vs. OABI, softfloat for gcc, NWFPE vs. FastFPE,  
> etc. The only combination that I can get to work reliably are gcc  
> 4.0.4, binutils 2.17 and uClibc 0.9.28.3 with my 2.6.21.6 kernel with  
> AT91 patches for 2.6.21 applied.
> 
> Is there a magic compiler, binutils and uClibc trinity for Linux/ARM  
> in particular?
> 
> Thanks!
> 
> Ryan
> 

Indeed, I tried svn buildroot with kernel 2.6.22 for Cirrus Logic ARM board
BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABI=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_BINUTILS_VERSION_2_18=y
BR2_GCC_VERSION_4_2_1=y

rootfs was created but when booting:

/sbin/init: can't Kernel panic - not syncing: Attempted to kill init!
load library 'libgcc_s.so.1'

I checked that there is no libgcc_s.so.1 in rootfs image but I have BR2_GCC_SHARED_LIBGCC=y
May be that is a cause why you not getting working rootfs.


Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
