From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 18:45:08 +0200
Subject: [Buildroot] [PATCH] libusb-compat: fix a build issue with
 undefined PATH_MAX
In-Reply-To: <1499091412-26839-1-git-send-email-brgl@bgdev.pl>
References: <1499091412-26839-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170704184508.5d7dc70c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Jul 2017 16:16:52 +0200, Bartosz Golaszewski wrote:
> libsigrok build failed because of PATH_MAX not being defined in usb.h.
> On linux it is defined in linux/limits.h, but usb.h only includes
> limit.h. Add a patch fixing the header in libusb-compat.
> 
> While we're at it: remove the patch numbering from previous patch.
> 
> Fixes: http://autobuild.buildroot.net/results/535/5353c2418c0c3311ef9ecb1f1ddc3ce769369b96/
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  ...andard-fixed-width-integer-types-in-usb.h.patch |  7 +++--
>  .../0002-fix-a-build-issue-on-linux.patch          | 32 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 package/libusb-compat/0002-fix-a-build-issue-on-linux.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
