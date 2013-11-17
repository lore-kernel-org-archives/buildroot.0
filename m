From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Nov 2013 23:44:22 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131117175034.GC4425@free.fr>
References: <20131116223632.462c6e60@skate> <20131117172917.GB4425@free.fr>
 <20131117175034.GC4425@free.fr>
Message-ID: <20131117234422.6744ba64@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 17 Nov 2013 18:50:35 +0100, Yann E. MORIN wrote:

> Here are a few more (note: I'm only doing analysis for now):
> 
> http://autobuild.humanoidz.org/results/5f7/5f7003615207adc737c482edc8271557d9f2ce79/
>   -> valloc missing
>   -> config is using uClibc snapshot
>   -> since e806570 (2013-04-04), valloc is hidden behind SUSV2_LEGACY
>      which is missing from our uclibc-snapshot.config

This has been discussed recently. See
http://lists.busybox.net/pipermail/buildroot/2013-November/082106.html
and the following e-mails.

> http://autobuild.humanoidz.org/results/95f/95fe1ed8b2e51e7eb1712958d9e4d891bb38e35b/
>   -> gzip: /home/test/test/2/dl/aiccu_20070115.tar.gz: not in gzip format
>   -> the file is 6.4KiB in size, which is wrong
>   -> downloaded from here, the file is 68KiB, and is a correct .tar.gz
>   -> spurious network/server error?

File removed from the server.

> http://autobuild.humanoidz.org/results/a50/a5078a8759242ac8198bf55fe6c61da3c793522c/
>   -> error: #warning requested reentrant code, but thread support was
>      disabled [-Werror=cpp]
>   -> but BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
>   -> libpfm4-4.3.0 needs threads?

Only dependency is oprofile on PowerPC, so adding threads as a
dependency doesn't seem horrible :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
