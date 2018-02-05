From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 5 Feb 2018 23:51:46 +0100
Subject: [Buildroot] [PATCH 00/15 v2] fs: support parallel filesystems
 build
In-Reply-To: <cover.1517820133.git.yann.morin.1998@free.fr>
References: <cover.1517820133.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpYifzmRdZtt1z2qtRkXEqZ_5zdbjU3VVHg_MRW=LMR3SA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Feb 5, 2018 at 9:42 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hello All!
>
> TL;DR: filsystems are not parallel-safe, so we generate an intermediate
> tarball from target/, which then serves as input for the various
> filesystems; we also run pre-gen hooks under fakeroot, and get rid of
> post-fs package-provided hooks.
>

I ran a build using master with this patchset to create a tar, romfs,
cpio gz uboot, and squashfs gz compressed images.  Once that initial
build completed, I enabled the existing parallel build option and
observed my filesystems being re-created in parallel (used -j 6).

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
