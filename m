From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 14:09:08 +0200
Subject: [Buildroot] rsync forces configure step
In-Reply-To: <1f09233e5be11d75394054a20c4631cd@openmailbox.org>
References: <1f09233e5be11d75394054a20c4631cd@openmailbox.org>
Message-ID: <20140613140908.532d1852@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Marie,

On Fri, 13 Jun 2014 10:54:20 +0200, C?dric Marie wrote:

> I have recently upgraded from Buildroot 2014.02 to 2014.05, and I have 
> noticed that some developments related to top-level parallel build have 
> resulted in a small change of behaviour, which I would consider as a 
> regression.
> 
> When a package is used in rsync mode, make <pkg>-rebuild also forces the 
> configure step.
> 
> This has been introduced by this commit:
> http://git.buildroot.net/buildroot/commit/package/pkg-generic.mk?id=6c5c08b854e4490697076ae3c5a9c587d8672c63
> ... and this line in particular:
> $$($(2)_TARGET_CONFIGURE): $$($(2)_TARGET_RSYNC)
> 
> I believe the right way to support parallel build without forcing the 
> configure step in case of rsync, is to use an order-only prerequisite 
> (with a pipe):
> $$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)
> 
> I have checked this correction successfully.

This indeed seems correct. I've Cc'ed Fabio who is working on the
top-level parallel build feature, I guess he'll have a look and give
you more feedback and/or send a patch fixing this issue.

Thanks a lot for the report!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
