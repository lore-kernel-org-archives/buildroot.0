From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Feb 2012 11:28:28 +0100
Subject: [Buildroot] [PATCH 6/7] lttng-libust: add patch to fix build
	issue when C++ support is not available
In-Reply-To: <4e02eaff56aa9f76dc3e0ff87ba906b84f9c8ee8.1328366921.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 4 Feb 2012 15:48:47 +0100")
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <4e02eaff56aa9f76dc3e0ff87ba906b84f9c8ee8.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8762flshf7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  ...2-dont-build-cxx-tests-when-not-available.patch |   50 ++++++++++++++++++++
 Thomas>  package/lttng-libust/lttng-libust.mk               |    2 +
 Thomas>  2 files changed, 52 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch

 Thomas> diff --git a/package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch b/package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..b1b94b0
 Thomas> --- /dev/null
 Thomas> +++ b/package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch
 Thomas> @@ -0,0 +1,50 @@
 Thomas> +Do not build C++ example if a C++ compiler isn't available
 Thomas> +
 Thomas> +By default lttng-ust builds a hello.cxx C++ example that demonstrates
 Thomas> +the usage of the userspace tracing library in a C++
 Thomas> +program. Unfortunately, when no C++ support isa available, the build

s/isa/is/. Otherwise it looks good, committed - Thanks.

-- 
Bye, Peter Korsgaard
