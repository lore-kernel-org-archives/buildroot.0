From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 10:56:07 +0200
Subject: [Buildroot] [PATCH] download/git: fix transform regexp for
 older tar versions
In-Reply-To: <20180420073632.5047-1-yann.morin.1998@free.fr>
References: <20180420073632.5047-1-yann.morin.1998@free.fr>
Message-ID: <20180420105607.6c0b4218@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 09:36:32 +0200, Yann E. MORIN wrote:
> Older versions of tar (e.g. 1.27.1) incorrectly interpret the escaping
> of the regexp separator, and generate broken tarballs.
> 
> For example, given the following transform expression:
>     --transform="s/^\.\//squashfs-e38956b92f738518c29734399629e7cdb33072d3\//"
> 
> the resulting paths in the generated tarball would be:
>     squashfs-e38956b92f738518c29734399629e7cdb33072d3\/
> 
> i.e. a directory which last character is indeed a '\'.
> 
> We fix that by using a separator which is very unlikely to occur in a
> filename.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/742/7427f34e5c9f6d043b0fe6ad2c66cc0f31d2b24f/
> 
> and probably a slew of others as well...
> 
> Take this opportunity to fix indetation on the following line (leading
> spaces, not tABs).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  support/download/git | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
