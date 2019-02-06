From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:28:13 +0100
Subject: [Buildroot] [PATCH] package/libwebsockets: bump to v3.1.0
In-Reply-To: <1546421571-18627-1-git-send-email-qwendu@gmail.com>
References: <1546421571-18627-1-git-send-email-qwendu@gmail.com>
Message-ID: <20190206112813.4103d637@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Wed,  2 Jan 2019 17:32:50 +0800
qwendu <qwendu@gmail.com> wrote:

> added -fno-strict-aliasing to fixed the following error:
> ...
> libwebsockets-v3.1.0/lib/event-libs/libev/libev.c:34:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
>     ev_timer_set(&pt->ev.hrtimer, ((float)us) / 1000000.0, 0);
> 
> Signed-off-by: qwendu <qwendu@gmail.com>
> ---
>  package/libwebsockets/cmake-no-strict-aliasin.patch | 16 ++++++++++++++++
>  package/libwebsockets/libwebsockets.hash            |  2 +-
>  package/libwebsockets/libwebsockets.mk              |  2 +-
>  3 files changed, 18 insertions(+), 2 deletions(-)
>  create mode 100644 package/libwebsockets/cmake-no-strict-aliasin.patch
> 
> diff --git a/package/libwebsockets/cmake-no-strict-aliasin.patch b/package/libwebsockets/cmake-no-strict-aliasin.patch
> new file mode 100644
> index 0000000..8515d40
> --- /dev/null
> +++ b/package/libwebsockets/cmake-no-strict-aliasin.patch
> @@ -0,0 +1,16 @@
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 453fdfd..6fd1712 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt

Patches must have a description and a Signed-off-by, and should be
generated with "git format-patch -N". Also, it seems like another patch
was necessary, but you sent it separately, it should be part of the
same commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
