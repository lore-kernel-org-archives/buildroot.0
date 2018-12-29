From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Dec 2018 10:42:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to v3.1.0
In-Reply-To: <1546068063-11514-1-git-send-email-qwendu@gmail.com>
References: <1546068063-11514-1-git-send-email-qwendu@gmail.com>
Message-ID: <20181229104239.16975c35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for this new iteration! From a formatting point of view,
it looks correct now (thanks to the patch being sent using git
send-email). There is however one remaining issue, see below.

On Sat, 29 Dec 2018 15:21:03 +0800, qwendu wrote:
> From: qwen dux <qwendu@gmail.com>
> 
> Signed-off-by: qwen dux <qwendu@gmail.com>
> ---
>  package/libwebsockets/0001-cmake-no-strict-aliasin.patch | 16 ++++++++++++++++
>  package/libwebsockets/0002-libuv.c.uninitialized.patch   | 13 +++++++++++++
>  package/libwebsockets/libwebsockets.hash                 |  2 +-
>  package/libwebsockets/libwebsockets.mk                   |  2 +-
>  4 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 package/libwebsockets/0001-cmake-no-strict-aliasin.patch
>  create mode 100644 package/libwebsockets/0002-libuv.c.uninitialized.patch
> 
> diff --git a/package/libwebsockets/0001-cmake-no-strict-aliasin.patch b/package/libwebsockets/0001-cmake-no-strict-aliasin.patch
> new file mode 100644
> index 0000000..8515d40
> --- /dev/null
> +++ b/package/libwebsockets/0001-cmake-no-strict-aliasin.patch

For all patches, we require them to have a description + Signed-off-by
line. In addition, for this specific package, which is managed using
Git by the upstream developers, we like to have git-formatted patches.
So, you should clone the libwebsockets Git repository, create a branch
based on the tag v3.1.0, and create two commits for your two build
fixes, with an appropriate commit log containing a description +
Signed-off-by, and then use:

	git format-patch -N HEAD~2

to generate the two patches.

Could you fix this up and send an updated version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
