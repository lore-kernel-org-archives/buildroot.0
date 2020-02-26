From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 16:27:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-iptables: add explicit
 dependency on dynamic libs
In-Reply-To: <20200226142617.4170-1-frank.vanbever@essensium.com>
References: <20200226142617.4170-1-frank.vanbever@essensium.com>
Message-ID: <20200226162731.16ba83cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Feb 2020 15:26:15 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
>  package/python-iptables/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/python-iptables/Config.in b/package/python-iptables/Config.in
> index e55359963e..a35577bad3 100644
> --- a/package/python-iptables/Config.in
> +++ b/package/python-iptables/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_PYTHON_IPTABLES
>  	bool "python-iptables"
> +	depends on !BR2_STATIC_LIBS

This needs a bit more explanation, at least a short comment above. Even
your commit log is empty.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
