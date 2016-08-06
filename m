From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 21:36:21 +0200
Subject: [Buildroot] Buildroot 2016.08-rc1 released
In-Reply-To: <87h9ay9oyt.fsf@dell.be.48ers.dk>
References: <87lh0a9qcr.fsf@dell.be.48ers.dk>
 <20160806120842.1574e227@free-electrons.com>
 <87h9ay9oyt.fsf@dell.be.48ers.dk>
Message-ID: <20160806213621.7183038a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 06 Aug 2016 12:22:18 +0200, Peter Korsgaard wrote:

>  > Are you sure? According to http://autobuild.buildroot.net/stats/, there
>  > are still 90 packages without hashes. Moreover, the hashes are
>  > currently not checked for packages not sourced from http/ftp.  
> 
> A quick check of package/ seemed to show that the only ones missing were
> people with custom _SITE_METHOD, but I didn't check the other dirs.

Hum, quick example: the slirp package doesn't have a custom
_SITE_METHOD, it's just using Git. And it doesn't have a hash file.
Same psplash, and many other packages.

> So for the packages where we currently can check hashes, we are now
> doing it. I might clarify the description for the final release mail.

This is not completely correct: thanks to Yann's work, the tarballs we
produce locally when fetching from Git are reproducible. So technically
speaking, all packages fetched from Git could and should now have a
hash file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
