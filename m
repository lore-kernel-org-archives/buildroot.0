From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:11:09 +0200
Subject: [Buildroot] [PATCH 4/5] Linux: Unpatch customer kernel source
 tree before make clean.
In-Reply-To: <1344330577-25159-4-git-send-email-sonic.adi@gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-4-git-send-email-sonic.adi@gmail.com>
Message-ID: <20120811201109.059aa4f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 7 Aug 2012 17:09:36 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Unpatch only patches which match current kernel version.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

What is the use case for this?

Again, you're implementing something completely specific for the linux
package while the logic itself has nothing specific to the Linux
kernel. So if we ever want something like this, we want to implement it
at the package infrastructure level, and clearly not in some random
specific package.

I'm sorry to reject some of your patches this way, but as Buildroot
developers, we have to maintain a good coherency and consistency in the
implementation of the package recipes and the package infrastructure.
And this consistency means that we don't want to implement specific
things in packages that should in fact be implemented at the package
infrastructure level.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
