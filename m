From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Oct 2014 19:28:52 +0200
Subject: [Buildroot] [PATCH] legal-info: fix bug leading to one package
 not being considered
In-Reply-To: <1412612170-31047-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412612170-31047-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141006172852.GC4122@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-06 18:16 +0200, Thomas Petazzoni spake thusly:
> Due to excessive parenthesis, the TARGETS_LEGAL_INFO expression was
> evaluated to something like this:
> 
>   toolchain-legal-info toolchain-external-legal-info busybox-legal-info zlib-legal-info))
> 
> Yes, with the last two parenthesis. This had the effect that the
> zlib-legal-info rule was never called: the last package of $(TARGETS)
> $(TARGET_HOST_DEPS) $(HOST_DEPS) was never added in the legal-info
> information.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Oviously an issue, indeed.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 6068e7f..3f56648 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -414,7 +414,7 @@ HOST_DEPS = $(sort $(foreach dep,\
>  HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
>  
>  TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
> -		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
> +		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
>  
>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  	$(HOST_DIR) $(BINARIES_DIR)
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
