From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 10:52:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: add patch to compile
 with glibc >= 2.28
In-Reply-To: <20180912083447.5169-1-F.LaRoche@pilz.de>
References: <20180912083447.5169-1-F.LaRoche@pilz.de>
Message-ID: <20180912105228.1c0ec200@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 10:34:47 +0200, Florian La Roche wrote:
> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> and therefore <sys/sysmacros.h> must be included explicitly when
> major()/minor() are used.
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>

Thanks a lot for this patch.

> ---
>  package/mongodb/mongodb.patch | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 package/mongodb/mongodb.patch
> 
> diff --git a/package/mongodb/mongodb.patch b/package/mongodb/mongodb.patch
> new file mode 100644
> index 0000000000..d429b4e891
> --- /dev/null
> +++ b/package/mongodb/mongodb.patch

Since mongodb upstream is maintained in Git, we like to have a Git
formatted patch. So could you instead clone
https://github.com/mongodb/mongo.git, checkout the 3.3.4 tag, make the
fix, do a commit, and then "git format-patch HEAD^", and use the
generated 0001 file ?

BTW, I see that in the latest version of mongodb, this file no longer
exists. Our package of mongodb is quite old, so if you have some
specific interest in mongodb, it might be useful to update it. Or maybe
Sergio can comment on this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
