From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 13:25:41 +0200
Subject: [Buildroot] cpprestsdk: new package
In-Reply-To: <CAETHaKqd_JNhE++wYngS9O0VvWO_eQNyvHDX8Wu2G95JR-MevQ@mail.gmail.com>
References: <CAETHaKqd_JNhE++wYngS9O0VvWO_eQNyvHDX8Wu2G95JR-MevQ@mail.gmail.com>
Message-ID: <20170801132541.6c17cf28@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Aug 2017 06:27:50 -0400, Dave Bender wrote:
> Added cpprestsdk library
> 
> Signed-off-by: David Bender <codehero@gmail.com>

Thanks for this new submission. However, please apply the same comments
as the ones I made for your squashfs-fuse patch: entry to DEVELOPERS
file, fix indentation, etc.


> diff --git a/package/cpprestsdk/Config.in b/package/cpprestsdk/Config.in
> new file mode 100644
> index 000000000..beb37ad17
> --- /dev/null
> +++ b/package/cpprestsdk/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_CPPRESTSDK
> + bool "cpprestsdk"
> + select BR2_PACKAGE_BOOST
> + select BR2_PACKAGE_BOOST_CHRONO
> + select BR2_PACKAGE_BOOST_FILESYSTEM
> + select BR2_PACKAGE_BOOST_RANDOM
> + select BR2_PACKAGE_BOOST_REGEX
> + select BR2_PACKAGE_BOOST_SYSTEM
> + select BR2_PACKAGE_BOOST_THREAD
> + select BR2_PACKAGE_OPENSSL

You forgot to propagate the dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
