From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 23:01:48 +0100
Subject: [Buildroot] arch support
In-Reply-To: <87iqokh9mt.fsf@macbook.be.48ers.dk>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>
	<496B5427.6040103@sonycom.com>  <87iqokh9mt.fsf@macbook.be.48ers.dk>
Message-ID: <1232056908.4757.58.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


...
> 
> I use a script like this:
> 
> cat ~/bin/br-build-arch                                             ~
> #!/bin/sh
> 
> [ -e Config.in ] || { echo Must be in buildroot dir >&2; exit 1; }
> 
> unset GREP_OPTIONS
> rm -f .config
> make menuconfig
> 
> ARCH=$(grep BR2_ARCH= .config|cut -f2 -d\")
> 
> # use download dir, gcc 4.3.2 and kernel headers 2.6.28
> sed -i  -e 's~BR2_DL_DIR=.*$~BR2_DL_DIR="/var/lib/downloads"~' \
>  -e 's~^.*BR2_GCC_VERSION_4_2_4.*$~# BR2_GCC_VERSION_4_2_4 is not set~' \
>  -e 's~^.*BR2_GCC_VERSION_4_3_2.*$~BR2_GCC_VERSION_4_3_2=y~' \
>  -e 's~^.*BR2_KERNEL_HEADERS_2_6_27.*~# BR2_KERNEL_HEADERS_2_6_27 is not set~' \
>  -e 's~^.*BR2_KERNEL_HEADERS_2_6_28.*~BR2_KERNEL_HEADERS_2_6_28=y~' \
>  .config
> yes ''|make oldconfig
> make O=/tmp/br/$ARCH 2>&1 | tee /tmp/br/$ARCH.log
> 
> 
> Where /var/lib/downloads is my local download dir.
> 

export BUILDROOT_DL_DIR=/var/lib/downloads

in .bashrc will work as well 
and you do not mess up your .config if you want to provide it
to others.

BR
Ulf Samuelsson
