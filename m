From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:38:49 +0200
Subject: [Buildroot] [PATCH 2/4] download/git: ensure we have a sane
 repository
In-Reply-To: <8019bec4b6420d014d263c2c3e12e3c985a2ef0d.1523983687.git.yann.morin.1998@free.fr>
References: <cover.1523983687.git.yann.morin.1998@free.fr>
 <8019bec4b6420d014d263c2c3e12e3c985a2ef0d.1523983687.git.yann.morin.1998@free.fr>
Message-ID: <20180419223849.79dc8705@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 18:48:21 +0200, Yann E. MORIN wrote:
> There are cases where a repository might be broken, e.g. when a previous
> operation was killed or otherwise failed unexpectedly.
> 
> We fix that by always initialising the repository, as suggested by
> Ricardo. git-init is safe on an otherwise-healthy repository:
> 
>     Running git init in an existing repository is safe. It will not
>     overwrite things that are already there. [...]
> 
> Using git-init will just ensure that we have the strictly required files
> to form a sane tree. Any blob that is still missing would get fetched
> later on.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/download/git | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
