From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 09:34:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add option for
	static client
In-Reply-To: <1476850246-12883-1-git-send-email-christian@paral.in>
References: <1476850246-12883-1-git-send-email-christian@paral.in>
Message-ID: <20161019093408.0ce0f8a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 00:10:46 -0400, Christian Stewart wrote:
> Adds an option to selectively enable a static client.
> 
> This is useful when bind-mounting the docker client binary into
> containers for a docker-in-docker setup.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

We normally don't provide per-package options to build statically.
Indeed, if we were to start doing this, we would have to create one
additional option for every package in Buildroot.

Though, if there's a really serious use-case for having just the docker
client built statically, maybe we can make an exception.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
