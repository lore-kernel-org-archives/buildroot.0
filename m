From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 08:24:07 +0100
Subject: [Buildroot] [PATCH 3/7] croosbar moved to buildroot.
In-Reply-To: <1454289936-10654-4-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
 <1454289936-10654-4-git-send-email-mc5686@mclink.it>
Message-ID: <20160201082407.477cff7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Mon,  1 Feb 2016 02:25:32 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/Config.in b/package/Config.in
> index f211cfe..812bf8a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -632,6 +632,7 @@ menu "External python modules"
>  	source "package/python-configobj/Config.in"
>  	source "package/python-configshell-fb/Config.in"
>  	source "package/python-crc16/Config.in"
> +	source "package/python-crossbar/Config.in"
>  	source "package/python-cryptography/Config.in"
>  	source "package/python-cssselect/Config.in"
>  	source "package/python-daemon/Config.in"

This should be part of the patch adding the python-crossbar package.
I.e in the same patch, you must:

 - Add package/python-crossbar/Config.in
 - Add package/python-crossbar/python-crossbar.mk
 - Add package/python-crossbar/python-crossbar.hash
 - Add any patch in package/python-crossbar/ if needed
 - Adjust package/Config.in to include package/python-crossbar/Config.in

Thanks!

Thomsa
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
