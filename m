From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:26:39 +0100
Subject: [Buildroot] [PATCH v2] package/x11r7/xserver_xorg-server: Add
 patch to fix v1.19.1 with SIGIO
In-Reply-To: <20170215171216.18479-1-mylene.josserand@free-electrons.com>
References: <20170215171216.18479-1-mylene.josserand@free-electrons.com>
Message-ID: <20170215212639.78e0759a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 18:12:16 +0100, Myl?ne Josserand wrote:
> The commit 6a5a4e60373c from xserver v1.19.1 removes SIGIO support for
> input [1].
> 
> The current patch coming from Open Embedded [2] removes a check of
> 'useSIGIO'. This check was producing a segfault error while using
> X11 and Vivante driver [3]. Thanks to Gary Bisson to point out this
> patch!
> 
> [1] https://cgit.freedesktop.org/xorg/xserver/commit/?id=6a5a4e60373c1386b311b2a8bb666c32d68a9d99
> [2] https://patchwork.openembedded.org/patch/136696/
> [3] http://lists.busybox.net/pipermail/buildroot/2017-February/183994.html
> 
> Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>
> ---
>  .../0003-Remove-check-for-useSIGIO-option.patch    | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
