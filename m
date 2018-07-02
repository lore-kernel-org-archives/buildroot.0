From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Jul 2018 16:28:26 -0500
Subject: [Buildroot] [PATCH 01/50] package/busybox: backport upstream
 patch to fix install-noclobber
In-Reply-To: <2222ddf7fb0c17011ad26da66ff6fa5664f66240.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <2222ddf7fb0c17011ad26da66ff6fa5664f66240.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpaHyrRo1Rjc7icJgEkAKRkaVPKUVyLk8EHbFTg1qU5sSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Jul 2, 2018 at 4:11 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, we shoehorn the noclobber option with a sed call, but
> upstream has applied a set of 4 patches that adds support to do
> an install without clobbering.
>
> Backport those patches, and use the new install rule.
>
> Note that the 3rd and 6th patches do not seem like they would be usefull
> to backport, but a user may well have a custom config that enables shell
> wrappers, or installs no wrapper (to install then at runtime), so it
> still makes sense to backport them (especially since the 3rd was part of
> the noclobber series upstream, and the 6th, a fix of it).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
