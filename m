From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 23:03:45 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <20160118214704.GA3380@free.fr>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr> <87y4bn6y5s.fsf@dell.be.48ers.dk>
 <20160118214704.GA3380@free.fr>
Message-ID: <20160118230345.52b8f054@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 18 Jan 2016 22:47:04 +0100, Yann E. MORIN wrote:

> Yes, it *is* functionally equivalent. It just looks weird that you have
> to define the kernel version after (as 'as a conseuence of) the headers
> version, since logically, it is the opposite that one would want.
> 
> However, as you said, it would not be very practical to implement that
> in a user-friendly way:
>   - on one hand, it seems totally more logical to define the toolchain
>     options before enblign a kernel,
>   - on the other hand, the kernel headers version is very dependent on
>     the running kernel version.
> 
> Chicken'n'egg problem... :-(
> 
> So, do we agree that we should drop this patch?

I also don't like the way the patch is implemented, but I think the
problem raised by this patch is real. Sometimes people have kernel
sources that contain some custom kernel headers needed for their
userspace libraries/applications, and we have no mechanism to allow
them to use their custom kernel source for the linux-headers package,
which is a bit annoying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
