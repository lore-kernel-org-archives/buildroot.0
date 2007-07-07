From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 07 Jul 2007 21:43:50 +0200
Subject: [Buildroot] <package>_VER vs <package>_VERSION
In-Reply-To: <1183836807.19912.12.camel@elrond.sweden.atmel.com>
References: <004201c7c0a2$9420c900$dcc4af0a@atmel.com>
	<468FB5F5.1070205@realitydiluted.com>
	<1183836807.19912.12.camel@elrond.sweden.atmel.com>
Message-ID: <1183837431.19912.20.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-07-07 klockan 21:33 +0200 skrev Ulf Samuelsson:
> l?r 2007-07-07 klockan 10:49 -0500 skrev Steven J. Hill:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Ulf Samuelsson wrote:
> > > Some packages use <package>_VER  and some use  <package>_VERSION
> > > and some does not use this at all and hardcodes the version.
> > > 
> > > Suggest we clean this up so we use a single template.
> > > 
> > > Suggest we do it using the following template, allowing user to override.
> > > 
> > > ifeq    ($(<package>_VERSION),)
> > > <package>_VERSION:=X.Y.Z
> > > endif
> > > 
> > That's an interesting idea. I agree on the _VER and _VERSION clean-up. How
> > about you submit a patch for that first? Thanks.
> > 
> > - -Steve
> 
> Some packages do not have a version:
> customize
> gnuconfig
> hostap		Always use a snapshot
> microcom	This is not clean, version = 1.02, 
> 		package is m102.tar.gz
> jpeg	   	6b vs v6b
> mtd		Configurable from menuconfig or snapshot
> sfdisk		No version, this is located on www.uclibc.org so we 
> 		should change to sfdisk-1.00.tar.bz2
> tinylogin	Makefile force use of snapshot,
> 		Configure using menuconfig?
> ttcp		No version

Now with the correct attachment (zipped, to meet list limit)
Sorry about the confusing mess in the previous emails, getting tired...

> 
> Best Regards
> Ulf Samuelsson
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: VERSION.patch.tar.bz2
Type: application/x-bzip-compressed-tar
Size: 13886 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070707/7b4fb310/attachment.bin 
