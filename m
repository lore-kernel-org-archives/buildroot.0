From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2016 23:18:38 +0200
Subject: [Buildroot] [PATCH] nginx-upload: select BR2_PACKAGE_NGINX_HTTP
In-Reply-To: <1468937435-62705-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1468937435-62705-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160719231838.1c6ac384@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jul 2016 09:10:35 -0500, Matt Weber wrote:
> From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>
> 
> Resolves:
> http://autobuild.buildroot.net/results/64b/64b1bde02346ca67b670f0b095bd3acad707e8cd
> 
> Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/nginx-upload/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nginx-upload/Config.in b/package/nginx-upload/Config.in
> index b4ee71c..bd2d51f 100644
> --- a/package/nginx-upload/Config.in
> +++ b/package/nginx-upload/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_NGINX_UPLOAD
>  	bool "nginx-upload"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_NGINX_HTTP

All the built-in Nginx modules that need the http server to be enabled
have a "depends on" dependency on the http server. So to be consistent
with this, I've changed this "select" to a "depends on", and applied
your patch.

Thanks a lot for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
