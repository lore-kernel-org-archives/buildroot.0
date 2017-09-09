From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 23:05:52 +0200
Subject: [Buildroot] [PATCH 1/1] smcroute: bump to version 2.3.1
In-Reply-To: <20170907130908.22964-1-thomas.faivre@6wind.com>
References: <20170907130908.22964-1-thomas.faivre@6wind.com>
Message-ID: <20170909230552.782b38b8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Sep 2017 15:09:08 +0200, Thomas Faivre wrote:
> Signed-off-by: Thomas Faivre <thomas.faivre@6wind.com>

Since the patch is doing more than a version bump, it would have be
good to have a short note in the commit log about the added libcap
optional dependency (especially how it's related to the version bump).

> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +SMCROUTE_DEPENDENCIES = libcap

We like to explicitly pass --with-libcap here, so I've adjusted your
patch accordingly.

Applied to master with those two nits fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
