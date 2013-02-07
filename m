From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 09:27:51 +0100
Subject: [Buildroot] [PATCH 3/8] package/Makefile.in: update/fix
 HOST_PATH variable
In-Reply-To: <d29120e810fb080ac4304d6e51b01ec2efda168f.1356907750.git.s.martin49@gmail.com>
References: <cover.1356907750.git.s.martin49@gmail.com>
 <d29120e810fb080ac4304d6e51b01ec2efda168f.1356907750.git.s.martin49@gmail.com>
Message-ID: <20130207092751.61fd256a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 30 Dec 2012 23:54:10 +0100, Samuel Martin wrote:
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
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
>  HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib
> -Wl,-rpath,$(HOST_DIR)/usr/lib
> -HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
> +HOST_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)" 
>  # hostcc version as an integer - E.G. 4.3.2 => 432
>  HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \

I am ok with the patch, and also your 4/8, but I really believe you
should be more verbose in the commit log. Here the only information is
"update/fix HOST_PATH variable". But why? What is the reason? What are
the impacts? It is especially true when we look at those patches with a
little bit of delay as is the case now.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
