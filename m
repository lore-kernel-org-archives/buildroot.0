From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 17:14:22 +0200
Subject: [Buildroot] [PATCH v2 01/13] package/irrlicht: new package
In-Reply-To: <20170612205410.20230-1-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
Message-ID: <20170624171422.400d7309@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 22:53:58 +0200, Romain Naour wrote:
> +# Bundled libraries: bzip2, libaesGladman, libpng, lzma, zlib,
> +# The handcrafted Makefile can only use bundled libraries.
> +IRRLICHT_LICENSE = Zlib (irrlicht), bzip2 license, jpeg-license (BSD-3-Clause-like), Libpng

Why didn't you use SPDX license codes here? Also, what we put between
parenthesis is not details about the license, but the components on
which the license applies. So I've changed this line to:

IRRLICHT_LICENSE = Zlib (irrlicht), BSD-3-Clause (libaesGladman), bzip2-1.0.5 (bzip2), IJG (libjpeg), Libpng (libpng)

Applied to master after fixing this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
