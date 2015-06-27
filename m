From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 00:34:59 +0200
Subject: [Buildroot] [v2 3/6] package/nodejs: Add node.js v0.12.5 and
 set as the default version
In-Reply-To: <1435370498-25473-3-git-send-email-martin@barkynet.com>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
 <1435370498-25473-3-git-send-email-martin@barkynet.com>
Message-ID: <20150627223459.GD30876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-06-27 03:01 +0100, Martin Bark spake thusly:
> Signed-off-by: Martin Bark <martin@barkynet.com>
[--SNIP--]
> diff --git a/package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch
> new file mode 100644
> index 0000000..d2cb0b7
> --- /dev/null
> +++ b/package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch
> @@ -0,0 +1,38 @@
> +From 2f57d17b8b1a8cb78bd9cff874a006adba3afd4a Mon Sep 17 00:00:00 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Thu, 11 Jun 2015 20:05:11 +0100
> +Subject: [PATCH 1/4] Remove dependency on Python bz2 module
> +
> +The Python bz2 module is only needed in certain cases, so only import
> +it when needed. In the normal nodejs build, this allows to remove the
> +dependency on this module.
> +
> +Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Martin Bark <martin@barkynet.com>

Since you're taking the original patch from 0.10 by Thomas, and adapt
it to 0.12, you should have kept the attribution and add yourself to the
list, like so:

    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    [Martin: adapt to 0.12.5]
    Signed-off-by: Martin Bark <martin@barkynet.com>

[--SNIP--]
> diff --git a/package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch
> new file mode 100644
> index 0000000..ef86e5f
> --- /dev/null
> +++ b/package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch
> @@ -0,0 +1,27 @@
> +From 04bda7143f7ea6c6e6b659b73547b463f7e28c65 Mon Sep 17 00:00:00 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Thu, 11 Jun 2015 19:27:46 +0100
> +Subject: [PATCH 2/4] gyp: force link command to use CXX
> +
> +Cc: Samuel Martin <s.martin49@gmail.com>
> +Signed-off-by: Martin Bark <martin@barkynet.com>

Ditto, but this time the patch is (AFAICS) exactly the same as the patch
for 0.10, so you should have kept attribution and add yourself to the
list, too:

    Signed-off-by: Samuel Martin <s.martin49@gmail.com>
    Signed-off-by: Martin Bark <martin@barkynet.com>

[--SNIP--]
> diff --git a/package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
> new file mode 100644
> index 0000000..0a21a61
> --- /dev/null
> +++ b/package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
> @@ -0,0 +1,62 @@
> +From d6cc10f0765c97c402b1c1be0968f9d9eb112da9 Mon Sep 17 00:00:00 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Thu, 11 Jun 2015 19:25:09 +0100
> +Subject: [PATCH 3/4] Use a python variable instead of hardcoding Python
> +
> +The nodejs build system uses python in a number of locations. However,
> +there are some locations where it hardcodes 'python' as the Python
> +interpreter. However, this causes problems when we need to use python2
> +instead of just python.
> +
> +This patch fixes that by using the python variable already in place in
> +the nodejs build system.
> +
> +Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Martin Bark <martin@barkynet.com>

Ditto:

    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    [Martin: adapt to 0.12.5]
    Signed-off-by: Martin Bark <martin@barkynet.com>

[--SNIP--]
> diff --git a/package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch
> new file mode 100644
> index 0000000..aab6a31
> --- /dev/null
> +++ b/package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch
> @@ -0,0 +1,45 @@
> +From ce288a677d89c72c2f4cd832dc4afb2e21ae060e Mon Sep 17 00:00:00 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Thu, 11 Jun 2015 19:57:40 +0100
> +Subject: [PATCH 4/4] fix build error without OpenSSL support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Cc: J?rg Krause <jkrause@posteo.de>
> +Signed-off-by: Martin Bark <martin@barkynet.com>

Ditto:

    Signed-off-by: J?rg Krause <jkrause@posteo.de>
    [Martin: adapt to 0.12.5]
    Signed-off-by: Martin Bark <martin@barkynet.com>

[--SNIP--]
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 61419fd..8a8de94 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -24,18 +24,24 @@ if BR2_PACKAGE_NODEJS
>  
>  choice
>  	prompt "Node.js Version"
> -	default BR2_BR2_PACKAGE_NODEJS_0_10_39
> +	default BR2_BR2_PACKAGE_NODEJS_0_12_5

Actually, that's semantically incorrect, even though it's technically
working. OK, I'll explain! ;-) :

You should keep both defaults

    default BR2_BR2_PACKAGE_NODEJS_0_10_39 if BR2_ARM_CPU_ARMV5
    default BR2_BR2_PACKAGE_NODEJS_0_12_5

Kconfig will stop at the first default that matches its conditions, so
in case you have an armv5, 0.10.39 will be the default; otherwise the
default will be 0.12.5.

(note that we don't care about armv4 because nodejs as a whole depends
on !armv4.

So, even though 0.12.5 is hidden for armv5, and thus can't be sledted,
it feels wrong to have as an unconditional default (what does it mean to
default to something that is not available?).

>  	help
>  	  Select the version of Node.js you wish to use.
>  
>  	config BR2_BR2_PACKAGE_NODEJS_0_10_39
>  		bool "v0.10.39"
>  
> +	config BR2_BR2_PACKAGE_NODEJS_0_12_5
> +		# Needs minimum of ARMv6 with VFPv2
> +		depends on !BR2_ARM_CPU_ARMV5
> +		bool "v0.12.5"
>  endchoice
>  
>  config BR2_PACKAGE_NODEJS_VERSION_STRING
>  	string
>  	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_39
> +	default "0.12.5"	if BR2_BR2_PACKAGE_NODEJS_0_12_5
> +

Oh, look! An empty line! Hehe! ;-)

>  menu "Module Selection"
>  
>  config BR2_PACKAGE_NODEJS_NPM
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index bc1f15f..816d602 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,2 +1,5 @@
>  # From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
>  sha256	68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
> +
> +# From upstream URL: http://nodejs.org/dist/v0.12.5/SHASUMS256.txt
> +sha256	4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2  node-v0.12.5.tar.gz

Hash correct.

Regards,
Yann E. MORIN.

> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150628/f4bf6d90/attachment.asc>
