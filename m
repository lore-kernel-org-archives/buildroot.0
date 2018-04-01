From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 20:18:50 +0200
Subject: [Buildroot] [v3 06/13] support/download: make sure the download
 folder is created
In-Reply-To: <20180331142407.9522-6-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
 <20180331142407.9522-6-maxime.hadjinlian@gmail.com>
Message-ID: <20180401181850.GM2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2018-03-31 16:24 +0200, Maxime Hadjinlian spake thusly:
> At the moment, it means that we make sure that BR2_DL_DIR is created, in
> the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  support/download/dl-wrapper | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 67e9742767..49caf3717b 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -50,6 +50,7 @@ main() {
>      if [ -z "${output}" ]; then
>          error "no output specified, use -o\n"
>      fi
> +    mkdir -p "$(dirname "${output}")"

In a future oatch, when adding flock, you move that mkdir out of the
wrapper, upper to the DOWNLOAD macro. Why don't you do that right now,
instead?

Regards,
Yann E. MORIN.

>      # If the output file already exists and:
>      # - there's no .hash file: do not download it again and exit promptly
> -- 
> 2.16.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
