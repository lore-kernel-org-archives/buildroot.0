From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Dec 2018 22:54:41 +0100
Subject: [Buildroot] [PATCH 1/2] system cfg: default mkpasswd to SHA
In-Reply-To: <1544027592-35204-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1544027592-35204-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181205215441.GA2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2018-12-05 10:33 -0600, Matt Weber spake thusly:
> This patch drops the comment about checking the C libraries version as
> they now all support it by default
>     glibc 2.7+
>     uclibc (bdd8362a88 package/uclibc: defconfig: enable sha-256...)
>     musl 1.1.14+
> 
> This patch updates the help text and changes the default mkpasswd
> method to SHA256 from MD5

Really, this patch does two things:

  - update my now-wrong comments,

  - switch to using sha256 as the default;

so it should be two patches.

Besides, more comments, below...

> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  system/Config.in | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 9e34f11..2123d33 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -61,7 +61,7 @@ endif
>  
>  choice
>  	bool "Passwords encoding"
> -	default BR2_TARGET_GENERIC_PASSWD_MD5
> +	default BR2_TARGET_GENERIC_PASSWD_SHA256
>  	help
>  	  Choose the password encoding scheme to use when Buildroot
>  	  needs to encode a password (eg. the root password, below).
> @@ -81,20 +81,12 @@ config BR2_TARGET_GENERIC_PASSWD_MD5
>  config BR2_TARGET_GENERIC_PASSWD_SHA256
>  	bool "sha-256"
>  	help
> -	  Use SHA256 to encode passwords.
> -
> -	  Very strong, but not ubiquitous, although available in glibc
> -	  for some time now. Choose only if you are sure your C library
> -	  understands SHA256 passwords.
> +	  Use SHA256 to encode passwords which is stronger then MD5.

s/then/than/

>  config BR2_TARGET_GENERIC_PASSWD_SHA512
>  	bool "sha-512"
>  	help
> -	  Use SHA512 to encode passwords.
> -
> -	  Extremely strong, but not ubiquitous, although available in
> -	  glibc for some time now. Choose only if you are sure your C
> -	  library understands SHA512 passwords.
> +	  Use SHA512 to encode passwords which is stronger then SHA256

s/then/than/

With that fix, and the patch split in two, you can add, to each, my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  endchoice # Passwd encoding
>  
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
