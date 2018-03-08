From: Martin Bark <martin@barkynet.com>
Date: Thu, 8 Mar 2018 11:23:25 +0000
Subject: [Buildroot] [PATCH 2/2] Add NodeJS requires options in case of
 custom Linux kernel configuration
In-Reply-To: <VI1PR0201MB178934D161D5ED1D14E7A17CE5DF0@VI1PR0201MB1789.eurprd02.prod.outlook.com>
References: <VI1PR0201MB178934D161D5ED1D14E7A17CE5DF0@VI1PR0201MB1789.eurprd02.prod.outlook.com>
Message-ID: <CAFGQKxfLUheQ77Bso4tcB=KwOR1+2usCWgWJg0C4mDfzqgSvvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 8 March 2018 at 08:54, Stanislas Leduc <stanislas.leduc@balinor.net> wrote:
> Signed-off-by: Stanislas Leduc <stanislas.leduc@balinor.net>
> ---
>  package/nodejs/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index d2846f8d57..8d6a8145a9 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -36,6 +36,13 @@ config BR2_PACKAGE_NODEJS
>
>           http://nodejs.org/
>
> +         NodeJS requires the following options to be enabled in your
> +          Linux kernel configuration:
> +         CONFIG_SYSVIPC, CONFIG_POSIX_MQUEUE and CONFIG_EPOLL

It will be libuv that has the dependencies not nodejs.  nodejs uses
libuv to handle epoll, IPC etc

Thanks

Martin

> +
> +         Without these options, NodeJS and npm will exit with
> +          a Segmentation fault"
> +
>  if BR2_PACKAGE_NODEJS
>
>  config BR2_PACKAGE_NODEJS_NPM
> --
> 2.14.3
>
