From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 24 Jan 2008 09:28:18 +0100
Subject: [Buildroot] [Merak Spam 5.26] can't develope any programs using
	ssl in the root
In-Reply-To: <00c401c85e2a$9de7f140$8119fea9@MingChing>
References: <479802C7.9090108@redtone.com>
	<00c401c85e2a$9de7f140$8119fea9@MingChing>
Message-ID: <20080124082818.GA1078@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 24, 2008 at 09:44:10AM +0800, Ming-Ching Tiew wrote:
> 
> I have found a workaround for it, I delete the entire
> 
>    /usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/
> 
> Looks to me like a bug. Since I can proceed now, I am staying with
> this for a while.

weird but not sure why.

> BTW, the sstrip thingie looks to me also a bug. It happens to not
> just SSL shared library. The uClibc libraries could also be
> sstripped. This will be quite disasterous.

Not unless you want to build within the buildroot. I do sstrip on all
libraries on the resulting rootfs (floppyfw and others) but you are
probably right about sstripping when you have
CONFIG_BR2_PACKAGE_GCC_TARGET set.

When building the floppyfw devkit I also set CONFIG_BR2_STRIP_none.

I would consider it a but if any of the packages .mk files 
does strip anything even when CONFIG_BR2_STRIP_none is set.

Bbut stripping the libraries when the target is a normal rootfs seems
correct to me.


Thomas.
