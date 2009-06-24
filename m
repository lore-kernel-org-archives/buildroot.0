From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Jun 2009 22:41:18 +0200
Subject: [Buildroot] cannot find patches for mpfr package when buildroot
In-Reply-To: <693969.74850.qm@web53508.mail.re2.yahoo.com> (jing han's message
	of "Wed\, 24 Jun 2009 07\:40\:28 -0700 \(PDT\)")
References: <693969.74850.qm@web53508.mail.re2.yahoo.com>
Message-ID: <87prct2wlt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jing" == jing han <jing_han_66@yahoo.com> writes:

 jing> Hi All,

 jing> I experienced a problem when I make MIPS64 environment. Even if
 jing> I disabled mpfr package, When I make, I still encountered the
 jing> following error:

It gets built (for the host) because it's needed by the toolchain.

 jing> --10:11:10--  http://www.mpfr.org/mpfr-2.4.1/patches
 jing> Resolving www.mpfr.org... failed: Temporary failure in name resolution.
 jing> --10:11:30--  http://buildroot.net/downloads/sources//patches
 jing> Resolving buildroot.net... 140.211.167.224
 jing> Connecting to buildroot.net|140.211.167.224|:80... connected.
 jing> HTTP request sent, awaiting response... 404 Not Found
 jing> 10:11:30 ERROR 404: Not Found.

mpfr.org is down. We have a fallback system where it will then try to
download from buildroot.net instead if that fails - Unfortunately this
doesn't work because the patch file is simply called patches on
mpfr.org and we rename it after download to mpfr-2.4.1.patch after
downloading.

I have fixed it by adding a patches -> mpfr-2.4.1.patch symlink on
buildroot.net - So it should work now.

-- 
Bye, Peter Korsgaard
