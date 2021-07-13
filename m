From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:23:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/safeclib: disable -Werror
In-Reply-To: <20210612134604.519029-1-fontaine.fabrice@gmail.com>
References: <20210612134604.519029-1-fontaine.fabrice@gmail.com>
Message-ID: <c3329cc7-1a8a-d9fe-24ea-311aebb0343d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/06/2021 15:46, Fabrice Fontaine wrote:
> Set WARN_CFLAGS to an empty value to avoid the following build failure
> with -DNDEBUG which is raised since commit
> 5a8c50fe05afacc3cbe8e7347e238da9f242fab0
> 
> In file included from ./mem/safe_mem_constraint.h:38,
>                  from mem/safe_mem_constraint.c:33:
> ./safeclib_private.h:38: error: "NDEBUG" redefined [-Werror]
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/942/942b7e9a56a2eb285a64ac0df4910db70c39b49d/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 No longer needed since we no longer do -DNDEBUG, so marked as Rejected in
patchwork.

 Regards,
 Arnout

> ---
>  package/safeclib/safeclib.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
> index 3af8fbb167..73e0f36bfa 100644
> --- a/package/safeclib/safeclib.mk
> +++ b/package/safeclib/safeclib.mk
> @@ -11,5 +11,6 @@ SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).0-gad76c7.tar.bz2
>  SAFECLIB_LICENSE = MIT
>  SAFECLIB_LICENSE_FILES = COPYING
>  SAFECLIB_INSTALL_STAGING = YES
> +SAFECLIB_MAKE_OPTS = WARN_CFLAGS=""
>  
>  $(eval $(autotools-package))
> 
