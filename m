From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 12:45:58 +0200
Subject: [Buildroot] [PATCH v3] Enable mplayer to be built in arm64
 architectures
In-Reply-To: <7b568f198d2a7b9f6d9c99f2e503641eae0d4ecf.1442394054.git.jpinto@synopsys.com>
References: <7b568f198d2a7b9f6d9c99f2e503641eae0d4ecf.1442394054.git.jpinto@synopsys.com>
Message-ID: <20150916124558.09f3e577@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joao,

Thanks for your new iteration! However there are still a few issues. I
hope you don't mind the number of iterations: we really appreciate your
contributions (it's good to have better support for ARM64!) but we also
believe it's good to explain what are the best practices to contribute
to Buildroot. See below for my comments.

On Wed, 16 Sep 2015 10:10:48 +0100, jpinto wrote:
> configure: Added support for aarch64
> Config.in: Added support for aarch64

This is not really useful. We sometimes do a per-file description when
the commit is complicated, but here it doesn't really make sense,
especially when the description for each file is the same. Maybe you
added this because I asked you to add a "description of the patch", but
I think you might have misunderstood my comment (or I explained myself
improperly). Read on below for more details on this.

> 
> This patch adds support for ARM64 systems to Mplayer 1.1.1 available
> at buildroot.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> Tested-by: Joao Pinto <jpinto@synopsys.com>

As I explained in my review of your VLC patch, having a Tested-by tag
from you does not make much sense: such tags are meant to be given by
other developers.

> diff --git a/package/mplayer/0007-mplayer-enable-aarch64.patch b/package/mplayer/0007-mplayer-enable-aarch64.patch
> new file mode 100644
> index 0000000..7f75756
> --- /dev/null
> +++ b/package/mplayer/0007-mplayer-enable-aarch64.patch

This is *HERE* where we need a description of the patch. Take as an
example
http://git.buildroot.net/buildroot/tree/package/mplayer/0001-disable-install-strip.patch.
See how this file has three things:

 1 A description
 2 A Signed-off-by line
 3 The contents of the patch itself

Your 0007-mplayer-enable-aarch64.patch currently has (3), but is
lacking (1) and (2). So basically, just edit this file, add (1) and
(2), and that's it!

> @@ -0,0 +1,13 @@
> +--- b/configure	2015-09-15 17:30:46.187307557 +0100
> ++++ a/configure	2015-09-15 17:31:11.729307537 +0100
> +@@ -2496,6 +2496,10 @@
> +     arch='arc'
> +     iproc='arc'
> +     ;;
> ++  aarch64)
> ++    arch='arm64'
> ++    iproc='arm64'
> ++    ;;
> + 
> +   *)
> +     echo "The architecture of your CPU ($host_arch) is not supported by this configure script"

Finally, the title of the commit is still not completely good. As I
explained in my review of your vlc patch, the format of the commit
title should always be:

	<package>: <description>

So in the case of this patch, something along the lines of:

	mplayer: enable building on ARM64

Again, sorry about all the nitpicking!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
