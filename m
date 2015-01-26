From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:29:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/tiff: Add utilities submenu and
 more utility options
In-Reply-To: <1421599012-21491-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421599012-21491-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150126232904.398a485d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 18 Jan 2015 17:36:52 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tiff/Config.in |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  package/tiff/tiff.mk   |   36 +++++++++++++++++++++++++++---------
>  2 files changed, 75 insertions(+), 9 deletions(-)

My initial reaction is: woo, this is a lot of Config.in options for
something such as the tiff library and utilities.

Can we reduce this to just: BR2_PACKAGE_LIBTIFF that installs the
library, and BR2_PACKAGE_LIBTIFF_UTILS as a sub-option that also
installs all the utilities?

If someone wants something more fine-grained than that, they can always
remove the unnecessary tools in a post-build script.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
