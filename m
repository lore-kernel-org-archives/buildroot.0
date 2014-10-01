From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 01 Oct 2014 11:13:23 -0300
Subject: [Buildroot] [PATCH v4] package/nginx: new package
In-Reply-To: <1412027000-15481-1-git-send-email-s.martin49@gmail.com>
References: <1412027000-15481-1-git-send-email-s.martin49@gmail.com>
Message-ID: <542C0C03.1040204@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/29/2014 06:43 PM, Samuel Martin wrote:


Hi Samuel.
Nice job on keeping up with this one!
A couple of minor fixes:

> +config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
> +	bool "ngx_http_spdy_module"
> +	help
> +	  Enable ngx_http_spdy_module

Needs a:
select BR2_PACKAGE_NGINX_HTTP_GZIP_MODULE

I guess we'll be seeing others like this as well, just tested a couple
obvious ones.
It's very likely as well that this option is useless without SSL support
since SPDY is like a souped-up TLS (even though it builds).

Also you're directing logfiles to /var/log/nginx but the directory is
never created by the systemd unit/initscript file. This leads to a
non-working default configuration.

Other than that it looks pretty good.
Regards.
