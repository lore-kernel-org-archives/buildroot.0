From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 23:11:15 +0100
Subject: [Buildroot] [PATCH 3/8] package/Makefile.in: update/fix
 HOST_PATH variable
In-Reply-To: <0a056ec61043dcada1eab6ab7e7ec4de25743bfd.1356903063.git.s.martin49@gmail.com>
References: <cover.1356903063.git.s.martin49@gmail.com>
 <0a056ec61043dcada1eab6ab7e7ec4de25743bfd.1356903063.git.s.martin49@gmail.com>
Message-ID: <20121230231115.7fefabb7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 30 Dec 2012 22:33:27 +0100, Samuel Martin wrote:
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index cc8f320..dd04e25 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -165,7 +165,7 @@ HOST_CFLAGS   ?= -O2
>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
>  HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
> -HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
> +HOST_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"

Why?

For such core changes, a commit message of "update/fix something" is
definitely not enough. A detailed explanation is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
