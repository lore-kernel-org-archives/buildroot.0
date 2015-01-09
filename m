From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 16:22:50 +0100
Subject: [Buildroot] [PATCH v4 01/27] sepolgen: new package
In-Reply-To: <1420816288-8750-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1420816288-8750-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150109162250.0b5ba761@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Fri,  9 Jan 2015 09:11:02 -0600, Matt Weber wrote:

> diff --git a/package/sepolgen/Config.in.host b/package/sepolgen/Config.in.host
> new file mode 100644
> index 0000000..60d30b6
> --- /dev/null
> +++ b/package/sepolgen/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SEPOLGEN
> +	bool "host sepolgen"
> +	help
> +	  sepolgen is a python module/library that forms the core
> +	  of the modern audit2allow (a rewrite).

If it's simply a module/library used as a dependency of another
package, then there is no need to have a Config.in entry for it.

And Config.in entries for host packages should be
BR2_PACKAGE_HOST_<foo>. But I don't think this package should have a
menuconfig entry.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
