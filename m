From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 10 Dec 2013 14:19:02 +0000
Subject: [Buildroot] [PATCH] thrift: disable TQTcpServer
In-Reply-To: <1386670266-21845-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386670266-21845-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <52A722D6.7030201@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/2013 10:11 AM, Gustavo Zacarias wrote:
> Disable TQTcpServer, it doesn't build properly. Fixes:
> http://autobuild.buildroot.net/results/ef8/ef8afd0fea786f076a4bbece2fcbefdf5cb32ddd/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/thrift/thrift.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> index 7ee90ac..8af9643 100644
> --- a/package/thrift/thrift.mk
> +++ b/package/thrift/thrift.mk
> @@ -27,7 +27,7 @@ endif
>   # This is just for the libraries / bindings
>   THRIFT_LANG_CONF_OPT += --without-csharp --without-java --without-erlang \
>   	--without-python --without-perl --without-php --without-php_extension \
> -	--without-ruby --without-haskell --without-go --without-d
> +	--without-ruby --without-haskell --without-go --without-d --without-qt4
>   HOST_THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT) --without-c_glib
>   THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT)
>
>
Hello Gustavo,

instead of disabling it, why don't we fix it? We just need to add 
"#include <map>" to TQTcpServer.h

Best regards,
-- 
Vincent
