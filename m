From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:05:53 +0100
Subject: [Buildroot] [PATCH v5 19/20] python-autobahn: new package
In-Reply-To: <1455188328-7595-2-git-send-email-mc5686@mclink.it>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
 <1455188328-7595-2-git-send-email-mc5686@mclink.it>
Message-ID: <20160220150553.1da70aab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mauro,

On Thu, 11 Feb 2016 11:58:47 +0100, Mauro Condarelli wrote:

> diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
> new file mode 100644
> index 0000000..9f5da46
> --- /dev/null
> +++ b/package/python-autobahn/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_AUTOBAHN
> +	bool "python-autobahn"
> +	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY

I did a build with BR2_PACKAGE_PYTHON_PYC_ONLY=y, and tested at runtime
"import autobahn", and it worked perfectly fine.

So, I've removed this dependency, and applied your patch to the next
branch. If you think the dependency is really needed, please send a
follow-up patch on top of the next branch to re-add it, with a proper
justification.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
