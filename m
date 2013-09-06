From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 08:28:27 +0200
Subject: [Buildroot] [PATCH 01/17] libsepol: new package
In-Reply-To: <5228B55E.2090505@mind.be>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
 <20130905094446.3f139253@skate>
 <OF7340EC06.079EF0FB-ON86257BDD.00464188-86257BDD.004745F1@rockwellcollins.com>
 <5228B55E.2090505@mind.be>
Message-ID: <20130906082827.5b05c498@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 05 Sep 2013 18:46:22 +0200, Arnout Vandecappelle wrote:

>   I don't think it's really necessary to do this move just because it 
> looks nicer. I think it's better to stay with upstream. Although this 
> would be the first package to install anything in $(HOST_DIR)/lib, we 
> anyway already have
> 
> HOST_LDFLAGS  += -L$(HOST_DIR)/lib ...
> 
>   We don't have an rpath for it, though, so maybe that should be added.

Yes, that's the other option. I don't have a strong feeling about this.

At some point, I was thinking of proposing to remove $(HOST_DIR)/usr
and have everything under $(HOST_DIR)/ directly. The advantage is that
the binaries of the toolchain would be directly under $(HOST_DIR)/bin,
which would mean creating a tarball of $(HOST_DIR) would create a
toolchain that is more similar to other cross-compilation toolchains
you can find around (Linaro, CodeSourcery, etc.).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
