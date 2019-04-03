From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:56:16 +0200
Subject: [Buildroot] [PATCH] gnutls: security bump to 3.6.7.1
In-Reply-To: <b8fc60a6fc72431a6caa166bd3ebb19a01077cb8.camel@spectralink.com>
References: <20190403061405.27273-1-stefan.sorensen@spectralink.com>
 <87h8bffrga.fsf@dell.be.48ers.dk>
 <b8fc60a6fc72431a6caa166bd3ebb19a01077cb8.camel@spectralink.com>
Message-ID: <20190403215616.5c7882f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Wed, 3 Apr 2019 08:11:35 +0000
"S?rensen, Stefan" <Stefan.Sorensen@spectralink.com> wrote:

> On Wed, 2019-04-03 at 10:01 +0200, Peter Korsgaard wrote:
> 
> > These issues were fixed in 3.6.7, weren't they? I don't see 3.6.7.1
> > announced yet, what is the delta?  
> 
> Guess I might have jumped the gun a bit...
> 
> Only change is that a file was missing from the release tarball:
> https://gitlab.com/gnutls/gnutls/issues/745

There is a 3.6.7.1 tarball: https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/

However, your patch breaks legal-info for gnutls:

ERROR: doc/COPYING has wrong sha256 hash:
ERROR: expected: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
ERROR: got     : e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Note: don't do just a hash update: compare the COPYING file
before/after the bump, and document the change in the commit log to
explain why the hash has changed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
