From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Mar 2008 15:33:15 +0100
Subject: [Buildroot] initramfs doesn't need root to create an image
In-Reply-To: <1206799922.3224.157.camel@nigel-x60> (Nigel Kukard's message of
	"Sat\, 29 Mar 2008 14\:12\:02 +0000")
References: <1206773941.3224.126.camel@nigel-x60>
	<20080329140004.GA25949@cloud.net.au>
	<1206799922.3224.157.camel@nigel-x60>
Message-ID: <87myoh8us4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

 >> > Attached a patch which removes the requirement on fakeroot & makedevs
 >> > and prevents files from being created in /dev instead of devices when
 >> > one builds buildroot as a non-priv user.
 >> 
 >> Why? Was there a problem with fakeroot?

 Nigel> Not fakeroot itself, but you cannot create a device if you're
 Nigel> a non-priv user. So ... nothing fails, makedevs generates
 Nigel> lovely zero size files instead of devices & fakeroot appears
 Nigel> to hide the errors.

But that's the point of fakeroot. Applications run from within
fakeroot believes the trickery and sees the (fake) device nodes. I
haven't looked into the initramfs stuff, but why wouldn't that work
there as well?

-- 
Bye, Peter Korsgaard
