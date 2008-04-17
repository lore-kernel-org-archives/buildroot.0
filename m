From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 17 Apr 2008 13:56:42 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/sfdisk
In-Reply-To: <20080417133534.GA32044@real.realitydiluted.com>
References: <20080417132321.210B43C4FC@busybox.net>
	<20080417133534.GA32044@real.realitydiluted.com>
Message-ID: <1208440602.17959.104.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > * Add index & rindex defines if they're not defined either (legacy susv4 functions)
> > 
> > 
> > Added:
> >    trunk/buildroot/package/sfdisk/sfdisk.005.no-llseek-fix.patch
> >    trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch
> > 
> Please revert the index/rindex patch. You should be patching the code to
> NOT use those functions, not define them again. Remove the usage of them
> and then submit a patch to the upstream maintainer of sfdisk.

You probably already submitted your patch
util-linux-remove-deprecated-functions.patch upstream, which I just saw
fixes the same problem. sfdisk appears to be from util-linux, which is
also included under the package dir, which I just added a patch for
which fixes the index/rindex issue and doesnt hide it.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080417/53047c3f/attachment.pgp 
