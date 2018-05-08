From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:24:08 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] libkcapi: split BR2_PACKAGE_LIBKCAPI_APPS
In-Reply-To: <20180506220901.10094-1-fontaine.fabrice@gmail.com>
References: <20180506220901.10094-1-fontaine.fabrice@gmail.com>
Message-ID: <20180508152408.5cbe709b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 00:09:01 +0200, Fabrice Fontaine wrote:
> Since commit https://github.com/smuellerDD/libkcapi/commit/af313accf18887b4f6dbd7306c2389ddf271c9b7,
> hasher test application depends on dlfcn.h. To avoid putting all apps
> under !BR2_STATIC_LIBS dependency, split BR2_PACKAGE_LIBKCAPI_APPS into
> several variables.
> 
> Moreover, BR2_USE_MMU is only a dependency of BR2_PACKAGE_LIBKCAPI_TEST
> as other applications don't use fork.
> 
> Finally, enc or dgst applications could be enabled in a next patch if
> needed.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/7c57f3025030eff41a5cde52759821249859caf1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update Config.in.legacy

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
