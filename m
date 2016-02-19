From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 00:14:05 +0100
Subject: [Buildroot] [PATCH] zmqpp: bump to version 4.1.2
In-Reply-To: <1455800827-19066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455800827-19066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160220001405.79f8eda5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Thu, 18 Feb 2016 10:07:07 -0300, Gustavo Zacarias wrote:
> Drop 0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch since
> it's already upstream.
> 
> Rebase shared/static build patches - these look unnecessary if we switch
> to cmake-package, however it seems to require the zmq package switches
> to cmake-package as well since static library naming looks different,
> which might be a problem for users.
> 
> Also set the minimum required version of gcc to 4.7.x since the code now
> requires c++1x.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

This update doesn't seem to build here:

install -m 755 ./build/libzmqpp.so.4 /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libzmqpp.so.4.1.2
install -m 755 ./build/libzmqpp.a /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libzmqpp.a
install: cannot stat ?./build/libzmqpp.a?: No such file or directory
Makefile:158: recipe for target 'install' failed
make[2]: *** [install] Error 1
package/pkg-generic.mk:234: recipe for target '/home/thomas/projets/buildroot/output/build/zmqpp-4.1.2/.stamp_staging_installed' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/zmqpp-4.1.2/.stamp_staging_installed] Error 2
Makefile:36: recipe for target '_all' failed

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
