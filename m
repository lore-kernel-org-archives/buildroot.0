From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 21:29:30 +0200
Subject: [Buildroot] [PATCH] mongoose: fix build failure
In-Reply-To: <1407432016-17434-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407432016-17434-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140807212930.572c8ba3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  7 Aug 2014 14:20:16 -0300, Gustavo Zacarias wrote:
> mongoose.h looks missing because we're not building locally, so switch
> to the build dir. Fixes:
> http://autobuild.buildroot.net/results/701/701711626548bd166cd5bc5669e4761ffed074d1/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mongoose/mongoose.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index 4182a30..5f53721 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -19,6 +19,7 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
>  endif
>  
>  define MONGOOSE_BUILD_CMDS
> +	cd $(@D) ; \
>  	$(TARGET_CC) $(@D)/examples/server.c $(@D)/mongoose.c \
>  		-o $(@D)/examples/server $(MONGOOSE_CFLAGS) -pthread -ldl

What about -I$(@D) instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
