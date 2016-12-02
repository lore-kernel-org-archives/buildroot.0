From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 23:55:46 +0100
Subject: [Buildroot] [PATCH 01/10] package/waf: new host package
In-Reply-To: <866827010ad3057640f15eb124ed58ce1b7e96c6.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <866827010ad3057640f15eb124ed58ce1b7e96c6.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <20161202235546.3e1e2823@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:02:12 +0100, Yann E. MORIN wrote:

> +WAF_VERSION = 1.9.5
> +WAF_SOURCE = waf-$(WAF_VERSION)
> +WAF_SITE = https://waf.io/
> +
> +# Waf is a python script, compatible with any python >= 2.6, but some
> +# packages have wafscripts not compatible with python3. So always use
> +# python2.
> +#
> +# We don't really need host-python to install host-waf, but having this
> +# dependency here will hide it from packages themselves
> +HOST_WAF_DEPENDENCIES = host-python

As we discussed during the review, and I think as the general consensus
was, I've dropped this dependency: the infra is responsible for it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
