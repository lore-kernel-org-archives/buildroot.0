From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 09:36:01 +0200
Subject: [Buildroot] [PATCH 4/6] libsepol: bump to version 2.5
In-Reply-To: <1466736201-17310-4-git-send-email-Aduskett@gmail.com>
References: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
 <1466736201-17310-4-git-send-email-Aduskett@gmail.com>
Message-ID: <20160624093601.1b6a9b3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Glad to see that there are some people interested by SELinux support!
We still have lots of pending patches about SELinux, especially the
one adding the refpolicy package. See
http://patchwork.ozlabs.org/project/buildroot/list/?submitter=&state=&q=selinux&archive=&delegate=.

Some comments below though.

On Thu, 23 Jun 2016 22:43:19 -0400, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libsepol/0001-support-static-only.patch    | 17 +++++++++--------
>  .../libsepol/0002-workaround-blackfin-issue.patch  | 22 ++++++----------------

It would be good if you could indicate in the commit log what is
changed in the patches. Indeed, there are some strange changes that
you're doing.

>  package/libsepol/libsepol.hash                     |  2 +-
>  package/libsepol/libsepol.mk                       |  4 ++--
>  4 files changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
> index b974680..6d30454 100644
> --- a/package/libsepol/0001-support-static-only.patch
> +++ b/package/libsepol/0001-support-static-only.patch
> @@ -6,15 +6,16 @@ when defined to some non-empty value, will disable the build of shared
>  libraries. It allows to support cases where the target architecture
>  does not have support for shared libraries.
>  
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -

Why are you removing this?

> diff --git a/package/libsepol/0002-workaround-blackfin-issue.patch b/package/libsepol/0002-workaround-blackfin-issue.patch
> index 5d00c69..237c06a 100644
> --- a/package/libsepol/0002-workaround-blackfin-issue.patch
> +++ b/package/libsepol/0002-workaround-blackfin-issue.patch
> @@ -1,24 +1,14 @@
> -Do not make symbols hidden on Blackfin
> -
> -The libselinux logic to hide internal symbols from the DSO doesn't
> -work properly on Blackfin due to the USER_LABEL_PREFIX not being
> -handled properly. A real fix is not that simple, so this patch simply
> -disables the internal symbol hiding mechanism. This means that those
> -symbols are visible in the final DSO, which is not a problem for
> -proper execution, it just isn't as clean.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -

And why are you removing this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
