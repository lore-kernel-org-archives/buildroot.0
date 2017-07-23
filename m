From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 14:56:37 +0200
Subject: [Buildroot] [PATCH 1/1] nginx-upload-module: add openssl lib
 dependency
In-Reply-To: <1500782443-1515-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1500782443-1515-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <f36d741d-93ac-a9ca-1301-186742c2700f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 06:00, Matt Weber wrote:
[snip]
> +From dcfb052988b333382fc7696fd811eb547734797a Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Sat, 22 Jul 2017 22:24:50 -0500
> +Subject: [PATCH 1/1] nginx-upload-module: add openssl lib dependency

 Please use git format-patch -N

[snip]
> +diff --git a/config b/config
> +index cabd4f1..4a77858 100644
> +--- a/config
> ++++ b/config
> +@@ -1,14 +1,13 @@
> +-USE_MD5=YES
> +-USE_SHA1=YES
> + ngx_addon_name=ngx_http_upload_module
> + 
> + if test -n "$ngx_module_link"; then
> +     ngx_module_type=HTTP
> +     ngx_module_name=$ngx_addon_name
> +     ngx_module_srcs="$ngx_addon_dir/ngx_http_upload_module.c"
> ++    ngx_module_libs=-lcrypto

 Is there any reason not to use pkg-config, like we do in nginx itself (in
0006-auto-lib-openssl-conf-use-pkg-config.patch)?

> + 
> +     . auto/module
> + else
> +     HTTP_MODULES="$HTTP_MODULES ngx_http_upload_module"
> +     NGX_ADDON_SRCS="$NGX_ADDON_SRCS $ngx_addon_dir/ngx_http_upload_module.c"
> +-fi
> +\ No newline at end of file
> ++fi

 This hunk is not needed.

 Regards,
 Arnout

> +-- 
> +1.9.1
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
