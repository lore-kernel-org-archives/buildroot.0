From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Mar 2015 07:21:49 +0200
Subject: [Buildroot] [PATCH] package: add hwloc 1.10.1
In-Reply-To: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150319052149.GS2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Steven,

On Wed, Mar 18, 2015 at 08:48:03PM -0700, Steven Noonan wrote:
> diff --git a/package/hwloc/Config.in b/package/hwloc/Config.in
> new file mode 100644
> index 0000000..069bc8b
> --- /dev/null
> +++ b/package/hwloc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HWLOC
> +	bool "hwloc"
> +	select BR2_PACKAGE_LIBPCIACCESS
> +	select BR2_PACKAGE_NUMACTL

Please propagate the dependencies of libpciaccess (largefile), and numactl 
(largefile, arches).

> +	help
> +	  Portable Hrdware Locality

Typo: "Hardware". Also, this description is not very helpful. Please add 
something like (from the website):

	The Portable Hardware Locality (hwloc) software package provides a 
	portable abstraction (across OS, versions, architectures, ...) of the 
	hierarchical topology of modern architectures, including NUMA memory 
	nodes, sockets, shared caches, cores and simultaneous multithreading.

baruch

> +
> +	  http://www.open-mpi.org/projects/hwloc/
> diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
> new file mode 100644
> index 0000000..8d25904
> --- /dev/null
> +++ b/package/hwloc/hwloc.hash
> @@ -0,0 +1,2 @@
> +# From http://www.open-mpi.org/software/hwloc/v1.10/downloads/hwloc-1.10.1.tar.bz2

This line should contain the origin of the hash value below, so that the user 
can verify the hash independently. If upstream does not provide that, just say 
"Locally computed".

> +sha1	76291124e4638b2fbd4deb4cc3cd680e153077b5	hwloc-1.10.1.tar.bz2

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
