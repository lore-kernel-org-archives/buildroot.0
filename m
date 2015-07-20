From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:57:21 +0200
Subject: [Buildroot] [PATCH] package/glibc: enable lock elision on
 x86_64 hosts
In-Reply-To: <1426716071-27570-2-git-send-email-steven@uplinklabs.net>
References: <1426716071-27570-1-git-send-email-steven@uplinklabs.net>
 <1426716071-27570-2-git-send-email-steven@uplinklabs.net>
Message-ID: <20150720225721.53e6d9f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Wed, 18 Mar 2015 15:01:09 -0700, Steven Noonan wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/glibc/glibc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 0a37bb3..651711a 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -90,6 +90,7 @@ define GLIBC_CONFIGURE_CMDS
>  		--prefix=/usr \
>  		--enable-shared \
>  		$(if $(BR2_SOFT_FLOAT),--without-fp,--with-fp) \
> +		$(if $(BR2_x86_64),--enable-lock-elision,) \

The last comma was unnecessary. I've removed it and committed, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
