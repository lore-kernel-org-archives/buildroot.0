From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Aug 2015 20:32:05 +0200
Subject: [Buildroot] [PATCH v2] package/libcgroup: allow to build
 cgroup-tools
In-Reply-To: <1440413393-11023-1-git-send-email-bgolaszewski@baylibre.com>
References: <1440413393-11023-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150827203205.42b530e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Mon, 24 Aug 2015 12:49:53 +0200, Bartosz Golaszewski wrote:
> Add a new config option that allows to build cgroup-tools - a set of
> command-line utils for managing cgroups.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v2:
> - prefix package option with package name
> - use if/endif instead of depends on for libcgroup dependence
> 
> v1:
> http://lists.busybox.net/pipermail/buildroot/2015-August/137816.html
> 
>  package/libcgroup/Config.in    | 9 +++++++++
>  package/libcgroup/libcgroup.mk | 7 ++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
> index b7a84e0..7852567 100644
> --- a/package/libcgroup/Config.in
> +++ b/package/libcgroup/Config.in
> @@ -9,5 +9,14 @@ config BR2_PACKAGE_LIBCGROUP
>  
>  	  http://libcg.sourceforge.net/
>  
> +if BR2_PACKAGE_LIBCGROUP
> +
> +config BR2_PACKAGE_LIBCGROUP_TOOLS
> +	bool "build cgroup-tools"

I've adjusted the prompt of the option to be "install tools": there's
no need to repeat "cgroup" since the option will already be indented
under "libcgroup".

Applied with this change, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
