From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 10:53:56 +0100
Subject: [Buildroot] [PATCH] mesa3d: add patch to fix wayland-scanner
 issues
In-Reply-To: <1479411685-6912-1-git-send-email-gustavo@zacarias.com.ar>
References: <1479411685-6912-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161119105356.7ff07eb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 16:41:25 -0300, Gustavo Zacarias wrote:
> mesa3d tries to use the pkg-config specified wayland-scanner when
> wayland is enabled, which points to /usr/bin/wayland-scanner which is
> incorrect.
> The correct fix is trying to use the PATH wayland-scanner first if it's
> available rather than the pkg-config specified one, since tweaking a
> staging .pc file with a host binary is wrong. Fixes:
> http://autobuild.buildroot.net/results/c0c/c0ca3778c390a33c27073553ca3bef7ac7c5784b/
> 
> Patch sent upstream:
> https://lists.freedesktop.org/archives/mesa-dev/2016-November/135665.html
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...ac-invert-order-for-wayland-scanner-check.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch

Applied to master, thanks. You received some feedback on your upstream
submission, so it would be good if you could follow-up and get a fix
included upstream.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
