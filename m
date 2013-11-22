From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Nov 2013 20:52:54 +0100
Subject: [Buildroot] [PATCH 1/1] Add support to set the default port for
 dropbear to listen on
In-Reply-To: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
References: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
Message-ID: <CAAXf6LW722J03EbBE_JoZ+jJV73qJ=FDVS7u16hKhhXjLE1O-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeroen,

On Fri, Nov 22, 2013 at 7:10 PM,  <jeroen.de.wachter@telenet.be> wrote:
> A menu entry has been added to set the port. This menu entry
> is processed like entries that were already present and will
> rewrite one line of the options.h file that is used by
> dropbear during compilation.
>
> Signed-off-by: Jeroen De Wachter <jeroen.de_wachter@alcatel-lucent.com>
> ---
>  package/dropbear/Config.in   |   11 +++++++++++
>  package/dropbear/dropbear.mk |    6 ++++++
>  2 files changed, 17 insertions(+), 0 deletions(-)
>
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 68c3b71..f266567 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -36,4 +36,15 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
>           Enable logging of dropbear access to lastlog. Notice that
>           Buildroot does not generate lastlog by default.
>
> +config BR2_PACKAGE_DROPBEAR_DEFPORT
> +       int "Default port"
> +       default "22"
> +       depends on BR2_PACKAGE_DROPBEAR

This 'depends on' is no longer needed. There is already a 'if
BR2_PACKAGE_DROPBEAR' around this block.

Best regards
Thomas
