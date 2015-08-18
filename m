From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 22:28:51 +0200
Subject: [Buildroot] [PATCH] wf111: Add mdev dependency
In-Reply-To: <CAE21AQqpiDz0BEA4ruKVGA28k8b4+-NWAkCjKUqX+b=Qta1yrA@mail.gmail.com>
References: <1439277422-26111-1-git-send-email-cdhmanning@gmail.com>
 <55CB2019.5030304@je-eigen-domein.nl>
 <CAE21AQqpiDz0BEA4ruKVGA28k8b4+-NWAkCjKUqX+b=Qta1yrA@mail.gmail.com>
Message-ID: <20150818222851.64d36ea6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Manning,

On Thu, 13 Aug 2015 08:49:26 +1200, Charles Manning wrote:

> It seems the only way forward here is one of:
> * Convince Bluegiga to change their architecture/drivers to not use
> mdev/udev and release a new tarball.
> * Fix mdev so it works properly.
> * Run mdev in a way that just does the fw loading requests and not
> anything else.

 * Use udev
 * Use the in-kernel firmware loader

There is currently no way in Buildroot to say "this package requires a
firmware loading capability". And actually implementing that is not so
easy since the in-kernel firmware loader is only available since (say)
3.7, and Buildroot does not know at configure time the kernel version
you're using, nor whether the in-kernel firmware loader is enabled or
not.

So I believe the right thing to do here is simply to update the wf111
Config.in help text to indicate that this package requires a firmware
loading mechanism to be enabled.

My colleague Antoine T?nart (who wrote the package) is successfully
using wf111, probably with udev (I haven't checked). I've Cc'ed Antoine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
