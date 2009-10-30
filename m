From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 30 Oct 2009 15:00:15 -0400
Subject: [Buildroot] uboot patch
In-Reply-To: <20091030151217.7f8c64f1@surf>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJOyWIY1gOxLoBbCpKpnu5EBAAAAAA==@cimeq.qc.ca>
	<20091030151217.7f8c64f1@surf>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANEr3mVj5otIh7j025d/8NMBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I try this

Regards

Jonathan

-----Message d'origine-----
De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] De
la part de Thomas Petazzoni
Envoy??: 30 octobre 2009 10:12
??: buildroot at busybox.net
Objet?: Re: [Buildroot] uboot patch

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
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
