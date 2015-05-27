From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 27 May 2015 08:33:42 -0500
Subject: [Buildroot] [PATCH 1/1] system: rootfs remount feature doesn't
 apply to systemd
In-Reply-To: <1432572925-956-1-git-send-email-james.knight@rockwellcollins.com>
References: <1432572925-956-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <CANQCQpa=CYrfHkVj5LHxM9JhR4aKmGf2a3YuhzHSGvc9TBVrRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On Mon, May 25, 2015 at 11:55 AM, James Knight
<james.knight@rockwellcollins.com> wrote:
> The ability to configure a system to remount a typical read-only mounted
> root as read-write is achieved by adjusting the option
> BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW. The option alters the
> `/etc/inittab` file.
>
> Under systemd, inittab is not used. Adjusting REMOUNT_ROOTFS_RW will not
> affect the result of a built target. There is also a risk that if a
> building target removed the inittab file before the target finalization
> occurs, the build process can fail (ex. removing any generated inittab
> file during a post-build script will result in a build failure).
>
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
<snip>

Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>
