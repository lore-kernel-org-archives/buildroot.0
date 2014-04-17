From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 Apr 2014 23:47:42 +0200
Subject: [Buildroot] [PATCH] legal-info: Add site to legal info manifest
In-Reply-To: <1396903522-10063-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1396903522-10063-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <53504BFE.2040703@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

Clayton Shotwell wrote:
> I would like to propose adding the site to the legal-info manifest
> files. This gives a little more information on where the sources came
> from without adding much overhead. Please note that is is only for
> packages where the source is not local or set with OVERRIDE_SRCDIR.
>
> This patch works for the most part. The only issue I see with it occurs
> when the SITE for a package uses one of the common url macros such as
> BR2_GNU_MIRROR. The legal info manifest ends up having an extra set of
> double quotes in the site string.
>
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

Thanks for the proposal.

The idea is generally good to me: it provides a useful info with a
little effort.

The project website URL would be nice as well, but that's not easily
extracted.

Of course the double-quote issue with some packages needs to be fixed.
But this is just "implementation details". Note that, besides packages
from GNU_MIRROR it also affects the kernel from kernel.org, probably
U-Boot and Busybox, maybe a few others.

Instead, the case of packages downloaded from custom locations deserves
a little more thought on what we want to do.

When using e.g. BR2_LINUX_KERNEL_CUSTOM_GIT=y, the REPO_URL may point
either to a public server (github, gitorious, silicon vendors...) or to
an enterprise server. In the former case the repository URL is
informative. In the latter case it is not, and some companies may not
like exposing their server names to the public. You know how netadmins
are made... :)

So I'm not sure of what is the best policy when using custom (non-wget)
download methods.

-- 
Luca
