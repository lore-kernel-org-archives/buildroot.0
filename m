From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Apr 2011 15:35:02 +0200
Subject: [Buildroot] Binary ATI driver package in buildroot
In-Reply-To: <1302088845-15193-1-git-send-email-a@awn.dk>
References: <1302088845-15193-1-git-send-email-a@awn.dk>
Message-ID: <20110406153502.13c6affd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Apr 2011 13:20:44 +0200
"Allan W. Nielsen" <a@awn.dk> wrote:

> I would like to use ATI's binary device drivers in my buildroot
> project. I have therefore created the package fglrx. Right now it
> will only work for 64bit, and it does not detect of the target system
> is x86 or not. These things should of cause be fixed if the package
> are to be included in buildroot.

If the driver is architecture-dependent, then you can just make the
package depends on BR2_x86_64 for example.

> My question is whether such a package should exist in buildroots
> repository or not.

If it is useful, then I think it should be part of Buildroot.

> Also, I would like comments if this is the right way to build and
> include external binary device drivers. (Sorry, I'am still new to
> hacking buildroot)

We don't have that many binary device drivers, so there isn't yet any
good practice in Buildroot on how to package them.

However, your package does not use the GENTARGETS infrastructure, which
it should do. We don't include packages that don't rely on one of the
GENTARGETS, AUTOTARGETS or CMAKETARGETS infrastructure.

Regards!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
