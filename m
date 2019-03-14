From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:33:07 +0100
Subject: [Buildroot] [PATCH] package/bash: add upstream patches up to
 patch level 23
In-Reply-To: <20190313093955.27965-1-peter@korsgaard.com>
References: <20190313093955.27965-1-peter@korsgaard.com>
Message-ID: <20190314213307.50c9d817@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 10:39:55 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> We unfortunately cannot easily download these because of the file names (not
> ending in patch) and patch format (p0), so convert to p1 format and include
> in package/bash with the following script:
> 
> j=1; for i in 19 20 21 22 23; do
>     file=$(printf '%04d-patch44-0%d.patch' $j $i)
>     cat > $file << EOF
> From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> EOF
>     curl https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i | \
>         sed -e 's|^\*\*\* \.\./|*** |' -e 's|^--- |--- b/|' >> $file
> 
>     j=$(( j + 1 ))
> done
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/bash/0001-bash44-019.patch |  54 +++++++++++
>  package/bash/0002-bash44-020.patch | 181 +++++++++++++++++++++++++++++++++++++
>  package/bash/0003-bash44-021.patch |  61 +++++++++++++
>  package/bash/0004-bash44-022.patch |  65 +++++++++++++
>  package/bash/0005-bash44-023.patch |  56 ++++++++++++
>  5 files changed, 417 insertions(+)
>  create mode 100644 package/bash/0001-bash44-019.patch
>  create mode 100644 package/bash/0002-bash44-020.patch
>  create mode 100644 package/bash/0003-bash44-021.patch
>  create mode 100644 package/bash/0004-bash44-022.patch
>  create mode 100644 package/bash/0005-bash44-023.patch

Applied to master, thanks. The bash project really has some creative
way of sharing those bug fixes :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
