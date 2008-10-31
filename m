From: hartleys <hartleys@visionengravers.com>
Date: Fri, 31 Oct 2008 14:32:08 -0400
Subject: [Buildroot] [PATCH] External toolchain C++ cross-compiler fix
In-Reply-To: <20081031151328.1baafffd@surf>
References: <20081031151328.1baafffd@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C29169@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, October 31, 2008 7:13 AM, Thomas Petazzoni wrote:
> External toolchain C++ cross-compiler fix
>
> package/Makefile.in resets CXX to "" in TARGET_CONFIGURE_OPTS if
> BR2_GCC_CROSS_CXX is not set to 'y'. However, when using an
> external toolchain, BR2_GCC_CROSS_CXX is not set even if the
> toolchain has a C++ cross-compiler.
>
> This patch adds a new BR2_GCC_CROSS_CXX option in the external
> toolchain configuration menu, so that just like BR2_INET_RPC,
> BR2_INET_IPV6 and the others, it can be set according to the
> external toolchain configuration.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Yah! Someone else had the same problem.

I posted a message about this back on 8/13/2008 with a similar fix (but
not a patch) and never got a reply. I was starting to think it was just
me.

For what it's worth:

Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>
