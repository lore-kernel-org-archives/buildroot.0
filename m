From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 15:01:11 +0100
Subject: [Buildroot] [PATCH] toolchain: expose
 BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS for all toolchain types
In-Reply-To: <20191027134946.11701-1-matthew.weber@rockwellcollins.com>
References: <20191027134946.11701-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191027150111.2001e07a@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 08:49:46 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This patch extends the "copy extra GCC libraries to target" feature to
> also work for internal toolchains. The variable has been renamed to be
> BR2_TOOLCHAIN_EXTRA_LIBS and the configuration option moved under the
> generic toolchain package. For external toolchains, the step that does
> the copy is still in the copy_toolchain_lib_root() helper which copies
> from the sysroot to the target.  For the internal toolchain, the host
> gcc-final package does a post install hook to copy the libraries from
> the toolchain build folders to both the sysroot and target(!static).
> 
> Examples where this can be useful is for adding debug libraries to the
> target like the GCC libsanitizer (libasan/liblsan/...).
> 
> Cc: Markus Mayer <mmayer@broadcom.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This seems reasonable. However, Config.in.legacy handling is missing.
See Config.in.legacy which explains how to do it for string options. 

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
