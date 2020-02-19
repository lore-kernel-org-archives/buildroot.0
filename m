From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 21:03:13 +0100
Subject: [Buildroot] [RFC PATCH] package/sdbusplus: fix the build
In-Reply-To: <20200210191131.2520-1-michael@walle.cc>
References: <20200210191131.2520-1-michael@walle.cc>
Message-ID: <20200219210313.6f29cc6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Feb 2020 20:11:30 +0100
Michael Walle <michael@walle.cc> wrote:

> Commit d255b67972b4b7f27572581fe0c8c8aa03d850c8 fixed the handling of
> the a package local m4/ directory which might be missing. But this only
> works if it is the very first argument. But for this package this is not
> possible because we already occupy this with the extra include directory
> for autoconf-archive. Bring back the hook to create the m4/ directory to
> fix this.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

The commit log was missing a reference to the autobuilder failure that
this commit fixes, so I've added it and applied to master.

I looked at the discussion with Yann, and yes some more elaborate
solution could perhaps be introduced to avoid the hook. But for now the
work done on autoconf allows to avoid the hook in most situations,
except when autoconf-archive is needed, which is only a small minority
of our packages. For these packages, it is good enough for now to keep
an explicit hook to create the m4 directory.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
