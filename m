From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 May 2015 09:33:12 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150507040526.GS8309@waldemar-brodkorb.de>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
 <20150507040526.GS8309@waldemar-brodkorb.de>
Message-ID: <20150507093312.5e6840ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Thu, 7 May 2015 06:05:26 +0200, Waldemar Brodkorb wrote:

> Fixed in uClibc-ng. 
> wbx at helium:~/buildroot $ grep UCLIBC_VERSION_NG .config                                                                                                    
> BR2_UCLIBC_VERSION_NG=y
> wbx at helium:~/buildroot $ file output/target/usr/bin/genisoimage                                                                                              
> output/target/usr/bin/genisoimage: ELF 32-bit LSB executable, ARM,
> version 1 (SYSV), statically linked, stripped
> 
> It is not fixed in uClibc master.

Ok, thanks for the confirmation.

So here is my proposal:

 1/ For the 2015.05 release, we simply add exceptions to the
    autobuilder script to avoid such problematic cases.

 2/ For the 2015.08 release, we switch to uClibc-ng as the default
    uClibc version, and I rebuild all uClibc based external toolchains
    to use uClibc-ng.

What do others think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
