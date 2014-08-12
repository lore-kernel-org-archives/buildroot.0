From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 12:56:02 +0200
Subject: [Buildroot] [PATCH 3 of 4 for 2014.08] manual-text: make sure
 URLs are displayed if a link text was provided
In-Reply-To: <a891fa8b7ca9137dfe16.1407695710@localhost>
References: <patchbomb.1407695707@localhost>
 <a891fa8b7ca9137dfe16.1407695710@localhost>
Message-ID: <CAAXf6LUaBq31SxRnL4tdBhZGux1Jy37o+5dGhiS5eFcC9ePfzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 10, 2014 at 8:35 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> When the asciidoc source contain URLs of the form:
>     http://example.com[An example website]
> the text representation of the manual would only contain:
>     An example website
> without displaying the actual URL.
>
> This patch adds an asciidoc configuration file that sets the inline macros
> for several URL types so that the display becomes:
>     An example website [http://example.com]
> For URLs where no link text was provided, the display becomes:
>     [http://example.com]
> which is the same as before, except for the surrounding brackets.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  docs/manual/asciidoc-text.conf |  13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>
> diff -r 6e36b7e6851b -r a891fa8b7ca9 docs/manual/asciidoc-text.conf
> --- /dev/null   Thu Jan 01 00:00:00 1970 +0000
> +++ b/docs/manual/asciidoc-text.conf    Sat Aug 09 19:42:30 2014 +0200
> @@ -0,0 +1,13 @@
> +# For hyperlinks, show 'link text [URL]' (if link text provided) or [URL]
> +[http-inlinemacro]
> +{0=} &#91;{name}:{target}&#93;
> +[https-inlinemacro]
> +{0=} &#91;{name}:{target}&#93;
> +[ftp-inlinemacro]
> +{0=} &#91;{name}:{target}&#93;
> +[file-inlinemacro]
> +{0=} &#91;{name}:{target}&#93;
> +[irc-inlinemacro]
> +{0=} &#91;{name}:{target}&#93;
> +[mailto-inlinemacro]
> +{0=} &#91;{name}:{target}&#93;

I'm going to send a refined version of this patch that removes the
brackets in case no link text was provided...
