From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Sep 2016 16:18:10 +0200
Subject: [Buildroot] [PATCH] i2c-tools: install devt headers to staging
 dir
In-Reply-To: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
References: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20160924161810.09ee4fa5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 16:06:44 +0200, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> On debian (and maybe other distribs), there is a package named libi2c-dev
> that install a useful header from i2c-tools (for the one wanting to write
> I2C applications). See https://packages.debian.org/fr/wheezy/libi2c-dev.
> Do the same in Buildroot. Note that "install" target in i2c-tools Makefile
> would do the job, but BR installs i2c-tools's stuff manualy.
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>

We already merged exactly the same patch in commit
ff673f9a22b1467878f1a117f2c6198e9683d5c7, and finally reverted it in
41711cfdeda6f5fd9b2531f538f3643854d7d3ea, with the following commit log:

commit 41711cfdeda6f5fd9b2531f538f3643854d7d3ea
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Tue Mar 4 19:14:26 2014 +0100

    Revert "i2c-tools: Add i2c-dev.h to staging directory for userspace i2c drivers."
    
    This reverts commit ff673f9a22b1467878f1a117f2c6198e9683d5c7, as the
    modified i2c-dev.h from i2c-tools has some definitions that conflict
    with the i2c.h from the kernel headers. This means that a userspace
    program or library that includes both will fail to build, as is the
    case with libsoc.
    
    Fixes:
    
      http://autobuild.buildroot.org/results/1f4/1f451a338487a2a3c8a8f9b18540d41b90ee5aac/
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

So, if we are going to merge the same patch again, I'd like to be sure
that we won't fall into the exact same problems we had the previous
time. Could you check this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
