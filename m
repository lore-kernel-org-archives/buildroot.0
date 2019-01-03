From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2019 22:32:00 +0100
Subject: [Buildroot] [PATCH 02/11] support/download: fix scp download
 with scheme prefix 'scp://'
In-Reply-To: <20190103204026.23512-3-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-3-patrickdepinguin@gmail.com>
Message-ID: <20190103213200.GE5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-03 21:40 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The scp download helper is broken when the server URL starts with 'scp://'.
> Such prefix is used in two situations:
> 1. to let FOO_SITE point to an scp location without explicitly having to set
>    'FOO_SITE_METHOD = scp'
> 
> 2. when BR2_PRIMARY_SITE or BR2_BACKUP_SITE points to an scp location. In
>    this case, there is no equivalent of 'SITE_METHOD'.
> 
> Strip out the scheme prefix, similarly to how the 'file' download helper
> does it. That helper has the same cases as above.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/download/scp | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/download/scp b/support/download/scp
> index 746c3c6ba0..55f588e157 100755
> --- a/support/download/scp
> +++ b/support/download/scp
> @@ -34,4 +34,7 @@ _scp() {
>      eval ${SCP} "${@}"
>  }
>  
> +# Remove any scheme prefix
> +uri="${uri##scp://}"

I was pretty sure that we could pass sdcp:// to the scp tool. That's
funny how one can get very wrong about such simple things...

So it only proves that I don't use scp that often, indee.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  _scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
> -- 
> 2.18.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
