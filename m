From: Rajendra Dendukuri <rajendra@broadcom.com>
Date: Thu, 6 Jun 2013 19:33:30 +0000
Subject: [Buildroot] UCLIBC_EXTRA_CFLAGS in uClibc overridden while using
	buildroot
Message-ID: <43F7AEDD312F9E499A1A4E3608E505ED2ABF12D3@SJEXCHMB09.corp.ad.broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot-2012.11 version to build a uClibc toolchain for ARMv7a. I find that uClibc/Rules.mak file defaults to -Os. However I wish to include "-fno-omit-frame-pointer" even when -Os optimization is used. I cannot find a hook in buildroot or uClibc where this can be done. I tried setting the value of UCLIBC_EXTRA_CFGLAGS in the uClibc config file. However that is not being considered. Instead the values passed by buildroot in  "toolchain/uClibc/uclibc.mk" are being used.

This seems to be a very stiff limitation while using uClibc with buildroot. Any suggestions on how we can overcome this.

/rajen
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130606/829770ba/attachment.html>
