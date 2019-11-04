From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:38:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <20191103060113.4884-1-heiko.thiery@gmail.com>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
Message-ID: <20191104223848.5e67d301@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Nov 2019 07:01:14 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> The sysrepoctl and sysrepocfg executables are used in install steps
> of the package. Since there are hard-coded install pathes,
> this leeds to wrong installation directories in host and staging
> install steps.
> 
> Only sysrepoctl and sysrepocfg executables are needed from host build.
> So build and install only the executables in this step.

So far, ok.

> The staging step only needs to install the library with the
> corresponding files like the headers and the pkg-config.

I don't understand this however. Is there a problem with keeping a
simple "make install" for the staging installation ? After all, for
TARGET_DIR, you've kept the default "make install" behavior, so it
should be fine for staging as well. Could you comment on this ?

Also does this commit fix any autobuilder failure ? If it does, then
please add a reference to it, like this:

Fixes:

   http://autobuild.buildroot.net/results/bcd9bdd3bc83c1f2ab0b24348d51de27d88649b4/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
