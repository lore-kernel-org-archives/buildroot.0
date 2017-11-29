From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 10:44:01 +0100
Subject: [Buildroot] [PATCH 1/3 v3] zlib-ng: new package
In-Reply-To: <20171128232936.23067-1-stefan.froberg@petroprogram.com>
References: <20171128232936.23067-1-stefan.froberg@petroprogram.com>
Message-ID: <20171129104401.49254392@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration!

On Wed, 29 Nov 2017 01:29:34 +0200, Stefan Fr?berg wrote:
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> 
> Changes v2 -> v3:
> 
> - Add myself to DEVELOPERS files (by Thomas).
> - Update github download url.
> - Keep only sha256 of the locally computed hashes.
> - Add few cmake switches and also check for ARM support.
> - Convert to use virtual package infrastructure (by Thomas).

Changes should go after the --- mark, i.e...

> 
> ---

... here.

However, there's a bigger problem with your series: it's not bisectable.

If I apply just PATCH 1/3, then zlib-ng is available, but will
conflict/overwrite files installs by zlib. Not good.

If I apply just PATCH 1/3 and PATCH 2/3, then all packages that use
zlib are broken because it's now called libzlib.

So basically, you need to squash PATCH 2/3 and 3/3 into a single patch,
and make that the first patch of the series (of course removing the
zlib-ng support in it).

And then as a second patch, introduce the zlib-ng package, as a new
provider for zlib.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
