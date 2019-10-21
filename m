From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 16:18:28 +0200
Subject: [Buildroot] [PATCH] pkgconf: Add HOST_MAKE_ENV sytem include
 and lib
In-Reply-To: <20191021123810.23135-1-thomas.preston@codethink.co.uk>
References: <20191021123810.23135-1-thomas.preston@codethink.co.uk>
Message-ID: <20191021161828.6ee9f412@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 13:38:10 +0100
Thomas Preston <thomas.preston@codethink.co.uk> wrote:

> Recently, a change to the pkg-config wrapper made it more explicit about
> where the system include and library directories are, so that pkgconf
> does not print them. See upstream commit 9cc8680.
> 
> By default, we configure the pkg-config wrapper for the target sysroot,
> however the default system include and library directories are not
> reconfigured for the host build environment (they still point at the
> target sysroot). Fix this by adding the host system include and library
> directories to HOST_MAKE_ENV.
> 
> Note: this isn't likely to fix any bugs at present, but the incorrect
> configuration may hide an include-order related error which the original
> patch was supposed to fix!

I think this could potentially fix:

  https://bugs.busybox.net/show_bug.cgi?id=11776
  https://bugs.busybox.net/show_bug.cgi?id=12131

which are precisely include-order related.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
