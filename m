From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:38:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/linknx: add optional dependency
 to libcurl again
In-Reply-To: <20171201190523.4997-1-bernd.kuhls@t-online.de>
References: <20171201190523.4997-1-bernd.kuhls@t-online.de>
Message-ID: <20171201223852.736b8246@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 20:05:23 +0100, Bernd Kuhls wrote:
> https://git.buildroot.net/buildroot/commit/package/linknx?id=e1c9a2349006e657e76dff35706a774376921fb7
> made libcurl a hard dependency to fix autoreconf.
> 
> https://git.buildroot.net/buildroot/commit/package/linknx?id=b56083099f113817edc6811e2cdd820df1c80450
> removed autoreconf but did not re-add libcurl as optional dependency by
> mistakenly assuming that libcurl is needed only for autoreconf.
> 
> Tested using this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_LIBCURL=y
> BR2_PACKAGE_LINKNX=y
> 
> Configure log of linknx without this patch
> 
> checking for curl-config... /usr/bin/curl-config
> checking for the version of libcurl... 7.52.1
> checking for libcurl >= version 7.14.0... yes
> checking whether libcurl is usable... no
> 
> and with this patch
> 
> checking for curl-config... /home/buildroot/br4/output/host/i586-buildroot-linux-uclibc/sysroot/usr/bin/curl-config
> checking for the version of libcurl... 7.57.0
> checking for libcurl >= version 7.14.0... yes
> checking whether libcurl is usable... yes
> checking for curl_free... yes
> 
> Inspired by the fli4l project
> https://web.nettworks.org/repo/changelog/fli4l?cs=49347
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/linknx/linknx.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
