From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 09:34:56 +0200
Subject: [Buildroot] Crosstool/Buildroot integration issue
In-Reply-To: <201007071919.28956.yann.morin.1998@anciens.enib.fr>
References: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
	<201007071919.28956.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100708093456.61bf5501@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 7 Jul 2010 19:19:28 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> Well, I'd rather we had something like:
> - in menuconfig:
>     () Additional dirs to copy from sysroot
>       Help:
>         This is a space-separated list of paths that you want to copy
>         from the sysroot to the target. Make the paths relative to the
>         sysroot. Example:
>           /usr/lib/gconv /usr/include
> 
> - and in ext-tool.mk (to replace your changes, above):
>   $(Q)for d in $(BR_EXT_TOOL_DIRS_EXTRA); do \
>         if [ -d "$(ARCH_SYSROOT_DIR)$${d}" ]; then
>           mkdir -p "$(TARGET_DIR)$${d}"
>           cp -a "$${d}/." "$(TARGET_DIR)${d}/."
>         else
>           echo "No such directory '$${d}' whiel trying to copy from sysroot"
>         fi
>       done
> 
> But that's just my 2-cent advice...

At first look, I'm not a big fan of this solution, as it requires a lot
of knowledge from the Buildroot user about dependency details that
precisely Buildroot is supposed to handle.

I'd prefer to understand why and when these gconv files are needed, and
depending on that, see how it should fit in our configuration system.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
