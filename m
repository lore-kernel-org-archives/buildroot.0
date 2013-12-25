From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 21:28:29 +0100
Subject: [Buildroot] [PATCH] fio: new package
In-Reply-To: <20131225201731.GA7812@localhost>
References: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131225173455.0c413356@skate> <20131225201731.GA7812@localhost>
Message-ID: <20131225212829.603981b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 25 Dec 2013 17:17:32 -0300, Ezequiel Garcia wrote:

> > Thanks, I've applied this, after making several changes.
> > 
> 
> All the changes look good to me, thanks for doing this and
> sorry for being lazy and not take better care to push this
> submission.

We still have the problem that fio uses posix_madvise(), which isn't
supported in uClibc 0.9.33. It is supported in uClibc git, and we have
backported the patch in package/uclibc/, so Buildroot internal
toolchains are working fine.

But older uClibc toolchains do not work, and are causing build failures
such as
http://autobuild.buildroot.org/results/f7a/f7ae7ac2b5da9afc6314f1e813300597896e5ca6/build-end.log.

I believe the best solution for now is to mark this package as not
available for uClibc toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
