From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:33:17 +0100
Subject: [Buildroot] Header is nine years old
In-Reply-To: <XnsAB3CA67D5979Efgotham@195.159.176.226>
References: <XnsAB3CA67D5979Efgotham@195.159.176.226>
Message-ID: <20200106213317.693ae331@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frederick,

On Mon, 6 Jan 2020 16:21:59 -0000 (UTC)
Frederick Gotham <cauldwell.thomas@gmail.com> wrote:

> The following header file:
> 
>     #include <linux/list.h>
> 
> was added to the Github for the Linux kernel in May 2011. That was 9 years 
> ago.

This is an internal kernel header.

> So on my Buildroot setup, I navigate to this directory:
> 
>     build/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux

This only contains the kernel headers exposed to userspace, i.e the
UAPI (user-space API). There is absolutely no reason for list.h to be
in there.

> And I check to see if "list.h" is in there. It's not there, and this is why I 
> am unable to build the latest version of Barebox.
> 
> Anyone got any idea why that header file isn't in there?

You need to give more details about the Barebox failure you're seeing:
which version you're trying to build, what is the build error. But the
error is clearly not due to <linux/list.h> being missing from the
compiler sysroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
