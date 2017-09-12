From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Sep 2017 08:05:10 +0200
Subject: [Buildroot] [PATCH 1/1] download/git: force gzip compression
	level 6
In-Reply-To: <1505168020-23634-1-git-send-email-brain@jikos.cz>
References: <1505168020-23634-1-git-send-email-brain@jikos.cz>
Message-ID: <20170912060510.GB3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2017-09-12 00:13 +0200, Petr Kulhavy spake thusly:
> Force gzip compression level 6 when calculating hash of a downloaded GIT repo.
> To make sure the tar->gzip->checksum chain always provides consistent result.`
> 
> The script was relying on the default compression level, which must not be
> necessarily consistent among different gzip versions. The level 6 is gzip's
> current default compression level.

Not only is it the _current_ default, it has always been so since the
first release.

> Signed-off-by: Petr Kulhavy <brain@jikos.cz>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/download/git | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/git b/support/download/git
> index fc2957d..f590ff6 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -101,4 +101,4 @@ LC_ALL=C sort <"${basename}.list" >"${basename}.list.sorted"
>  # sources.buildroot.org and used in the *.hash files
>  tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
>           -T "${basename}.list.sorted" >"${output}.tar"
> -gzip -n <"${output}.tar" >"${output}"
> +gzip -6 -n <"${output}.tar" >"${output}"
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
