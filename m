From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Nov 2013 00:23:14 +0100
Subject: [Buildroot] [PATCH 1/2] util-linux: nommu: Add patch to use
 vfork in nommu arch.
In-Reply-To: <52840758.10104@mind.be>
References: <1384165765-23210-1-git-send-email-Sonic.adi@gmail.com>
 <52840758.10104@mind.be>
Message-ID: <20131114002314.72c4b4a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Sonic,

On Thu, 14 Nov 2013 00:12:24 +0100, Arnout Vandecappelle wrote:

> > +diff -urN util-linux-2.23.2.old/fdisks/fdiskbsdlabel.h util-linux-2.23.2/fdisks/fdiskbsdlabel.h
> > +--- util-linux-2.23.2.old/fdisks/fdiskbsdlabel.h	2013-07-30 16:54:15.362994206 +0800
> > ++++ util-linux-2.23.2/fdisks/fdiskbsdlabel.h	2013-11-11 14:52:18.285623027 +0800
> > +@@ -50,7 +50,7 @@
> > +     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
> > +     defined (__aarch64__) || defined(__xtensa__) || \
> > +     defined (__x86_64__) || defined (__avr32__) || defined(__cris__) || \
> > +-    defined (__microblaze__)
> > ++    defined(__bfin__) || defined (__microblaze__)
> 
>   This is actually a blackfin change, not a nommu change, so it should be 
> a separate patch.

Just a quick note to mention that util-linux 2.24 has removed this
header, and we have a patch pending to bump util-linux to 2.24. See
http://patchwork.ozlabs.org/patch/290366/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
