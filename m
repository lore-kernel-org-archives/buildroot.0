From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Nov 2012 10:01:58 +0100
Subject: [Buildroot] How to regenerate zImage?
In-Reply-To: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
References: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
Message-ID: <20121120100158.15b1b159@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Tue, 20 Nov 2012 08:17:54 +0000 (UTC), Woody Wu wrote:
> After I made any small changes in kernel source, I can force the kernel
> to be rebuilt by removing the .stamp_built under the
> output/build/linux-version directory.  But, it's strange that the
> output/zImage file always not get recreated or rebuilt.
> 
> How should I force the buildroot to regenerate the zImage file for me?

make linux-rebuild

However, note that making changing to the source code anywhere in
output/build/... is a really stupid idea, as all those changes will be
lost next time you do 'make clean'.

Best regard,s

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
