From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:53:27 +0100
Subject: [Buildroot] [PATCH 0/7] support/download: reproducible archives
 whatever tar version (branch yem/dl-git-tar-pax)
In-Reply-To: <cover.1605821010.git.yann.morin.1998@free.fr>
References: <cover.1605821010.git.yann.morin.1998@free.fr>
Message-ID: <20201119225327.48a2a6d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Nov 2020 22:23:47 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (7):
>       core/pkg-infra: prepare for alternate default source archives
>       WIP: support/download: change format of archives generated from git
>       WIP: boot+packages: update hash to new git-tarballs format
>       WIP: support/testing: update git-hash checks with new archive format
>       support/download: change format of archives generated from svn
>       support/dependencies: drop check for maximal tar version
>       package/tar: drop specific version for host variant

I reviewed the series, and overall it looks good to me. Of course, I
haven't actually tested/verified that the new magic set of tar options
makes things reproducible, but it seems like the amount of research on
this has been significant.

The only thing that bothers me a bit is that this series uses the
one-time bullet of switching from .tar.gz to .tar.xz, and I'm wondering
if we will not have other situations like this, and we won't have much
solution as we would already be using .tar.xz.

Just in my Go/Cargo vendoring, I'm encountering a similar problem: due
to the vendoring, the tarballs are changing and so are their hashes.
Since only two packages are impacted, I'm using the trick of bumping
them at the same time as I enable vendoring for them. But perhaps it
would be better to have a mechanism to support having different
tarballs for the same package ? I'm not sure how that would work
really, I don't have any clear idea.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
