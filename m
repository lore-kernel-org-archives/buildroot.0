From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Oct 2012 08:40:48 +0200
Subject: [Buildroot] XZ extracting issue
In-Reply-To: <508785f1a6df00.62361493@wp.pl>
References: <508785f1a6df00.62361493@wp.pl>
Message-ID: <20121024084048.5f1a0581@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Wed, 24 Oct 2012 08:08:49 +0200, Jerzy Grzegorek wrote:

> When Buildroot-2012.08 is trying to extract any xz compressed file,
> the following issue appears, for example: 
> linux 3.2.30 Extracting
> xzcat -xzOf /home/builder/tarballs/linux-3.2.30.tar.xz | tar
> --strip-components=1
> -C /home/builder/buildroot-2012.08/output/build/linux-3.2.30  -xf -
> xzcat: wrong option -- 'x'
> 
> I ran this command with -df option
> 
> xzcat -df /home/builder/tarballs/linux-3.2.30.tar.xz | tar
> --strip-components=1
> -C /home/builder/buildroot-2012.08/output/build/linux-3.2.30  -xf -
> 
> and extracting passed successfully.
> Should I change any Buildroot configuration option?

Can you check:

 $ grep XZCAT .config

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
