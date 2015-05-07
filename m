From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 7 May 2015 06:05:26 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150506094236.114894a2@free-electrons.com>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
Message-ID: <20150507040526.GS8309@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,
> >       x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2bd48ed578a143749d4503aca96f661647afe525/
> 
> multiple definition of `__lll_lock_wait_private'
> multiple definition of `__lll_unlock_wake_private'
> 
> This is a uClibc static linking problem. Waldemar, can you let us know
> whether it was fixed upstream and/or in uClibc-ng ?

Fixed in uClibc-ng. 
wbx at helium:~/buildroot $ grep UCLIBC_VERSION_NG .config                                                                                                    
BR2_UCLIBC_VERSION_NG=y
wbx at helium:~/buildroot $ file output/target/usr/bin/genisoimage                                                                                              
output/target/usr/bin/genisoimage: ELF 32-bit LSB executable, ARM,
version 1 (SYSV), statically linked, stripped

It is not fixed in uClibc master.

best regards
 Waldemar
