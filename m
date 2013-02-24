From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 05:14:16 +0100
Subject: [Buildroot] sdkdir in xorg-server.pc
In-Reply-To: <87ehgemw3t.fsf@dell.be.48ers.dk>
References: <511D7A62.1040004@mind.be>
	<87ehgemw3t.fsf@dell.be.48ers.dk>
Message-ID: <20130224051416.4e0d4d52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 17 Feb 2013 23:08:54 +0100, Peter Korsgaard wrote:

>  Arnout>  By the way, Peter, Thomas, do the autobuilders ever compile
>  Arnout> the full Xorg server? I don't see how
>  Arnout> xdriver_xf86-input-synaptics can ever build with this issue...
> 
> They should as long as the needed toolchain dependencies are
> available (wchar/largefile/c++).
> 
> gcc10.fsffrance.org uses:
> 
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> 
> So that should be sufficient. Gcc14/114 don't have C++. Thomas' glibc
> toolchains should also catch it.

And in practice full X.org never gets selected, see the mail I just
sent on the same thread, which explains what's happening.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
