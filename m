From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 16:24:34 +0100
Subject: [Buildroot] [PATCH v10 4/4] toolchain-external: create symlink
 ARCH_LIB_DIR->lib
In-Reply-To: <1453302547-24314-4-git-send-email-patrickdepinguin@gmail.com>
References: <1453302547-24314-1-git-send-email-patrickdepinguin@gmail.com>
 <1453302547-24314-4-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160120162434.5ac86865@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 20 Jan 2016 16:09:07 +0100, Thomas De Schampheleire wrote:

> +       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> +       if [ "$${ARCH_LIB_DIR}" != "lib" -a "$${ARCH_LIB_DIR}" != "$(SKELETON_LIB_SYMLINK)" ]; then \

Where is SKELETON_LIB_SYMLINK defined? Shouldn't this be
TOOLCHAIN_LIB_SYMLINK ?

Or better, can we indeed name the variable SKELETON_LIB_SYMLINK, have
it under skeleton.mk, and replace this test by something that simply
tests if ARCH_LIB_DIR exists or not. If it exists (i.e it's the lib/
directory, or one of the lib32/ or lib64/ symlinks), there is nothing
to do, otherwise you need to create the symlinks.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
