From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 11 Nov 2013 15:22:54 -0500
Subject: [Buildroot] [PATCH 2/2] busybox: ensure $(BUSYBOX_BUILD_CONFIG)
 is writable
In-Reply-To: <0b4acecdd3e9fb7d9510c206338ebbdfa483ca9e.1384191560.git.yann.morin.1998@free.fr>
References: <cover.1384191560.git.yann.morin.1998@free.fr>
 <0b4acecdd3e9fb7d9510c206338ebbdfa483ca9e.1384191560.git.yann.morin.1998@free.fr>
Message-ID: <CANxTyt5qCLXrOCnp5hrxwTkzfoH3DORs6uoDiBr5Jr1w3+0R2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 11, 2013 at 12:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: Nathan Lynch <ntl@pobox.com>
>
> If $(BUSYBOX_CONFIG_FILE) is read-only (eg. because Buildroot's
> source dir is), the sed fixups to $(BUSYBOX_BUILD_CONFIG) fail.

These share the same issue:

- linux.mk:  $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
- uclibc,mk:  $(UCLIBC_DIR)/.oldconfig

Danomi -
