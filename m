From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:16:51 +0100
Subject: [Buildroot] [PATCH 2/2] package/uboot-tools: env/script
 generation need BINARIES_DIR
In-Reply-To: <20210125145742.42460-2-matthew.weber@rockwellcollins.com>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
 <20210125145742.42460-2-matthew.weber@rockwellcollins.com>
Message-ID: <20210125221651.10112779@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 08:57:42 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> 
> The host build of uboot-tools can occur early in the build process and may
> require the creation of BINARIES_DIR before generation of an enabled envimage
> and/or boot script binary.
> 
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Hum, while this works, I'm in fact not too happy with the proposed
solution. I would prefer that we move the mkenvimage/$(MKIMAGE)
invocations to a BUILD_CMDS step, that produces its results in $(@D),
and then INSTALL_CMDS does a $(INSTALL) ... of that file, which with
the -D option would create $(BINARIES_DIR).

I know it's a bit bike-shedding, but it feels a little bit better. What
do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
