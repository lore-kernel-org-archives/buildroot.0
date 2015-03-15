From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:41:32 +0100
Subject: [Buildroot] [PATCH 1/4 v5] package/cmake: make ctest a target
 package too
In-Reply-To: <1425808043-32292-2-git-send-email-s.martin49@gmail.com>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
 <1425808043-32292-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150315184132.141ba2d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  8 Mar 2015 10:47:20 +0100, Samuel Martin wrote:

> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
> new file mode 100644
> index 0000000..3d31d7a
> --- /dev/null
> +++ b/package/cmake/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_CMAKE
> +	bool
> +
> +config BR2_PACKAGE_CMAKE_CTEST
> +	bool "ctest"
> +	select BR2_PACKAGE_CMAKE

There was a missing dependency on C++ (CMake is written entirely in
C++), and also you forgot to 'select' all the libraries you have in
CMAKE_DEPENDENCIES. And one of them, libarchive, has a dependency on
wchar, that had to be propagated here.

Committed with those issues fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
