From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 3 Dec 2008 22:34:38 +0100
Subject: [Buildroot] [PATCH] allow module-init-tools on uClinux
In-Reply-To: <alpine.LFD.2.00.0812031618170.14328@xanadu.home>
References: <alpine.LFD.2.00.0812031545010.14328@xanadu.home>
	<20081203210728.GE8563@mx.loc>
	<alpine.LFD.2.00.0812031618170.14328@xanadu.home>
Message-ID: <20081203213438.GH8563@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 03, 2008 at 04:21:11PM -0500, Nicolas Pitre wrote:
>On Wed, 3 Dec 2008, Bernhard Reutner-Fischer wrote:
>
>> On Wed, Dec 03, 2008 at 03:47:47PM -0500, Nicolas Pitre wrote:
>> >Matching *-*-linux* is too restrictive.
>> 
>> yes, but
>> 1) you would be better off to set BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y in
>> your toplevel .config, i.e. use the busybox module tools.
>
>That won't help me at all for the _cross_ installation of kernel 
>modules.

Sure it would. Busybox doesn't have that configuration issue, works fine
on every arch and is even smaller. You don't _need_ module-init-tools in
the first place, if i'm not mistaken.
>
>> 2) The current version is 3.5
>> 3) Please fix this upstream, iff it is still required for 3.5
>
>Eventually.  In the mean time this allows for the kernel to build and 
>its modules to be installed.

Not sure if i understand you here. Why do you need a cross module-init-tools
to build or install a kernel? Just curious..
