From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 23:37:48 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: disable test_fork
In-Reply-To: <1398192173-5081-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1398192173-5081-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140422233748.3b2b0599@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Tue, 22 Apr 2014 20:42:52 +0200, Jerzy Grzegorek wrote:

> diff --git a/package/zeromq/zeromq-01-disable-test_fork.patch b/package/zeromq/zeromq-01-disable-test_fork.patch
> new file mode 100644
> index 0000000..48a76ab
> --- /dev/null
> +++ b/package/zeromq/zeromq-01-disable-test_fork.patch
> @@ -0,0 +1,22 @@
> +Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Even though this patch is quite trivial, we need a patch description
anyway.

> +
> +--- a/tests/Makefile.am	2014-04-18 15:24:35.000000000 +0200
> ++++ b/tests/Makefile.am	2014-04-22 11:31:08.000000000 +0200
> +@@ -46,8 +46,7 @@ if !ON_MINGW
> + noinst_PROGRAMS += test_shutdown_stress \
> +                    test_pair_ipc \
> +                    test_reqrep_ipc \
> +-                   test_timeo \
> +-                   test_fork
> ++                   test_timeo
> + endif
> + 
> + test_system_SOURCES = test_system.cpp
> +@@ -93,7 +92,6 @@ test_shutdown_stress_SOURCES = test_shut
> + test_pair_ipc_SOURCES = test_pair_ipc.cpp testutil.hpp
> + test_reqrep_ipc_SOURCES = test_reqrep_ipc.cpp testutil.hpp
> + test_timeo_SOURCES = test_timeo.cpp
> +-test_fork_SOURCES = test_fork.cpp
> + endif
> + 
> + #  Run the test cases

I would actually prefer a patch that adds an AC_CHECK_FUNCS([fork])
test to configure.ac, and uses that to build test_fork or not. In this
case, the patch could be submitted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
