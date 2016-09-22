From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 19:49:41 +0200
Subject: [Buildroot] [PATCH 1/2 v3] linux/tools: make it a real,
	separate package
In-Reply-To: <874m58ouba.fsf@dell.be.48ers.dk>
References: <cover.1473171931.git.yann.morin.1998@free.fr>
 <7af6b231b19828564aae1a098568e96e15843a62.1473171931.git.yann.morin.1998@free.fr>
 <874m58ouba.fsf@dell.be.48ers.dk>
Message-ID: <20160922194941.7bc0f7da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 16:58:17 +0200, Peter Korsgaard wrote:

> In this case there isn't actually a real circular dependency, as the
> only dependency between openssl and cryptodev-linux is the cryptodev.h
> header, right?
> 
> So another solution could have been to split the cryptodev-linux package
> in two, like we do for mesa3d and mesa3d-headers.

Yes, possibly this could have been done. However, mesa3d/mesa3d-headers
is not about a split really. mesa3d-headers is only here to provide the
OpenGL headers when they are not provided by the selected OpenGL
implementation. So you never use mesa3d+mesa3d-headers, for example.

> The cryptodev-linux package would build the kernel module (and depend
> on linux), whereas the cryptodev-linux-headers package would only
> install cryptodev.h (and not have a compile time dependency on linux).

Correct. But there was really no reason for those "Linux tools" to be
built as part of the linux package, so I think Yann's approach is just
fine.

BTW, Yann sent his initial series on July 8th, so 2.5 months ago, so
you should have proposed alternate solutions by then :-) Why do you
wait for me to apply the patches to start the discussion ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
