From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Oct 2009 15:12:17 +0100
Subject: [Buildroot] uboot patch
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJOyWIY1gOxLoBbCpKpnu5EBAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJOyWIY1gOxLoBbCpKpnu5EBAAAAAA==@cimeq.qc.ca>
Message-ID: <20091030151217.7f8c64f1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Oct 2009 08:50:47 -0400,
"Jonathan dumaresq" <jdumaresq@cimeq.qc.ca> a ?crit :

> I try to figure where I should put my u-boot patch to get them applied
> correctly ?
> 
> I have added my board as per the documentation, now, I try to add my
> custom uboot patch. 

Two solutions:

 1. Add your u-boot patch into your
    target/device/<company>/<board>/u-boot/ directory, and add:

U_BOOT_ARCH_PATCH_DIR:=target/device/<company>/<board>/u-boot

 2. Set the configuration option BR2_TARGET_UBOOT_CUSTOM_PATCH in your
    Buildroot configuration

See target/u-boot/Makefile.in, line 73 and the next ones to see how the
u-boot source gets patched.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
