From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Oct 2014 09:45:02 -0700
Subject: [Buildroot] [PATCH 3/3] manual: Add notes about GitHub and
	hashes
In-Reply-To: <1414341315-31896-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414341315-31896-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141026164502.GA3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-26 17:35 +0100, Maxime Hadjinlian spake thusly:
> We can't take hash from GitHub, unless the tarball has been uploaded by

*hashes

> the maintainer, otherwise it will generated and may change over time,

...it is generated...

> which renders hash files, useless.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/adding-packages-directory.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index c145829..28312d6 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -372,6 +372,11 @@ the hashes of the downloaded files for the +libfoo+ package.
>  The hashes stored in that file are used to validate the integrity of the
>  downloaded files.
>  
> +If +libfoo+ is from GitHub, we can only accept +.hash+ file if the
> +package has a release section and the maintainer has uploaded a release
> +tarball. Otherwise, the automated generated tarball may change through

s/through/over/

> +time, rendering a +.hash+ file invalid.

    time, and thus its hashes may be different each time it is downloaded,
    making the +.hash+ file irrelevant for that tarball.

However, the .hash file is not completely irrelevant, in case the
package has extra downloads (with FOO_EXTRA_DOWNLOADS). I'm not sure if
the above makes completely sense...

Regards,
Yann E. MORIN.

>  The format of this file is one line for each file for which to check the
>  hash, each line being space-separated, with these three fields:
>  
> -- 
> 2.1.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
