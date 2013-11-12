From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 08:15:14 +0100
Subject: [Buildroot] [PATCH 2/7] eigen: add C++ toolchain dependency
In-Reply-To: <1384203613-17871-3-git-send-email-s.martin49@gmail.com>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
 <1384203613-17871-3-git-send-email-s.martin49@gmail.com>
Message-ID: <5281D582.7000809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/13 22:00, Samuel Martin wrote:
> As said in its help text, eigen heavily uses C++ features.
> So, explicit this dependency in the Config.in.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/eigen/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/package/eigen/Config.in b/package/eigen/Config.in
> index c7fcde2..e94f9a3 100644
> --- a/package/eigen/Config.in
> +++ b/package/eigen/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_EIGEN
>   	bool "eigen"
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	help
>   	  Eigen is a C++ template library for linear algebra: vectors,
>   	  matrices, and related algorithms. It is versatile, fast, elegant
> @@ -11,3 +12,6 @@ config BR2_PACKAGE_EIGEN
>   	  template library defined in the headers.
>
>   	  http://eigen.tuxfamily.org/
> +
> +comment "eigen needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
