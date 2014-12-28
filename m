From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:08:29 +0100
Subject: [Buildroot] [PATCH] package/mke2img: do not overshoot
 user-specified size
In-Reply-To: <1419797482-28041-1-git-send-email-yann.morin.1998@free.fr>
References: <1419797482-28041-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141228220829.7fbea483@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 28 Dec 2014 21:11:22 +0100, Yann E. MORIN wrote:
> Currently, we forcibly expand the generated filesystem by 1300 blocks
> (i.e. a bit more than 1MiB) when we need to generate an ext3 or ext4
> filesystem, even if the user already supplied us with the size it wants
> the filesystem to be.
> 
> In that case, we overshoot what the user requested, which is bad because
> the filesystem may no longer fit in the partition it is supposed to be
> written into.
> 
> Only add extra blocks when we do compute the required size, not when the
> user specifies the size.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/mke2img/mke2img | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Thanks, applied after doing some quick testing: an ext2 image with a
user-specified size, and an ext3 image with an automatically calculated
size.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
