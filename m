From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Sep 2013 08:05:47 +0200
Subject: [Buildroot] [PATCH 1/1] pyzmq: new package
In-Reply-To: <1377899924-1866-1-git-send-email-rommel@layer-7.net>
References: <1377899924-1866-1-git-send-email-rommel@layer-7.net>
Message-ID: <52242ABB.9060701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/13 23:58, Michael Rommel wrote:
[snip]
> diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
> new file mode 100644
> index 0000000..d9791c1
> --- /dev/null
> +++ b/package/python-pyzmq/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYZMQ
> +	bool "pyzmq"
> +	select BR2_PACKAGE_ZEROMQ
> +        select BR2_PACKAGE_PYTHON

  For python packages, we use a 'depends on' here rather than a select.


  Regards,
  Arnout

> +	depends on BR2_USE_WCHAR
> +	depends on BR2_USE_MMU
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
