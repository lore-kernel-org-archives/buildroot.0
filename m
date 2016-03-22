From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:08:04 +0100
Subject: [Buildroot] [PATCH 1/1] gnuradio: fix compilation with cmake-3.5
In-Reply-To: <1458634916-12300-1-git-send-email-gwenj@trabucayre.com>
References: <1458634916-12300-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20160322100804.7632e971@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 09:21:56 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Volk is a submodule of gnuradio, consequently PROJECT_{BINARY,SOURCE}_DIR must
> be used instead of CMAKE_{BINARY,SOURCE}_DIR.

Looks good... but could you resend with...

> diff --git a/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch b/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch
> new file mode 100644
> index 0000000..95a959a
> --- /dev/null
> +++ b/package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch
> @@ -0,0 +1,162 @@
> +Changing CMAKE_{SOURCE,BINARY}_DIR like volk does in its top-level
> +CMakeLists.txt no longer works with CMake 3.5.0.
> +
> +Use PROJECT_{BINARY,SOURCE}_DIR instead.
> +
> +Obtained from: http://pkgs.fedoraproject.org/cgit/rpms/gnuradio.git/commit/?id=b50c7e66f6e3a1e6a84e25505d3fd873756c2027
> +Upstream patch and discussion: https://github.com/gnuradio/volk/pull/65

...your Signed-off-by added here?

We require all patches on packages to carry a Signed-off-by from the
person who added them in Buildroot. Thanks!

Ideally, since gnuradio is version controlled in Git, this patch (as
well as patch 0001) should be Git formatted patches. But this can be
done at a later point, fixing this CMake compatibility issue is really
the priority.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
