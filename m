From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 15:20:21 +0100
Subject: [Buildroot] [PATCH 1/1] Only show hostname,
	issue and password options when default skeleton is selected.
In-Reply-To: <1358086424-17961-1-git-send-email-sagaert.johan@skynet.be>
References: <1358086424-17961-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <201301131520.21864.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On Sunday 13 January 2013 Sagaert Johan wrote:
> Only show hostname, issue and password options when the default skeleton is selected.
> Moved the menu sections so that when a custom skeleton is selected the issue, hostname
> and default password options are hidden.
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  system/Config.in | 132 +++++++++++++++++++++++++++----------------------------
>  1 file changed, 66 insertions(+), 66 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 69863c4..066f1d2 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -1,71 +1,5 @@
[--SNIP-]
> -choice
> -	bool "Passwords encoding"
> -	default BR2_TARGET_GENERIC_PASSWD_MD5
> -	help
> -	  Choose the password encoding scheme to use when Buildroot
> -	  needs to encode a password (eg. the root password, below).
> -	  
> -	  Note: this is used at build-time, and *not* at runtime.

Not for pasword encoding. There is a pending patch to add the ability for
packages to create users (eg. to run daemon as). For example, a package
that installs an FTP server may want to create a ftp user.

So, even with a custom skeleton, we'll need to know how to encode the
passwords.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
