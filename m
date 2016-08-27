From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 22:13:03 +0200
Subject: [Buildroot] [PATCH 11/16 v3] docs/manual: document the
 br2-external ID
In-Reply-To: <1668718ade9cb831725de8eed23056eefa7879c6.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <1668718ade9cb831725de8eed23056eefa7879c6.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827221303.23e011ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:31 +0200, Yann E. MORIN wrote:

> diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> index 9ad177d..839d1b1 100644
> --- a/docs/manual/customize-outside-br.txt
> +++ b/docs/manual/customize-outside-br.txt
> @@ -57,19 +57,50 @@ Or disable the usage of external definitions:
>  buildroot/ $ make BR2_EXTERNAL= xconfig
>  -----
>  
> -+BR2_EXTERNAL+ allows three different things:
> +A +BR2_EXTERNAL+ tree must contain at least those three files:
> +
> ++external.id+::

I thought this file was optional when there was a single external tree,
but you're saying it's mandatory here. Is it because the "no
external.id file" case is only supported for backward compat, and we
expect that new users write an external.id, regardless of whether they
are using a single or multiple external trees ?

> +   That file should contain the ID for the +BR2_EXTERNAL+ tree.
> +   That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
> +   available in +Config.in+ and +external.mk+ (see below), so that ID
> +   must be a valid make and Kconfig variable. Buildroot sets
> +   +BR2_EXTERNAL_$(ID)+ to the path of the +BR2_EXTERNAL+ tree.
> +   The format for this file is a single line with the ID.
> ++
> +Examples of an +external.mk+ file that declares the ID +FOO+:

Huh? Is it really external.mk that contains the ID ?

> ++
> +----
> +$ cat external.mk

Ditto.

> +FOO
> +----
> ++
> +Examples of IDs and the corresponding +BR2_EXTERNAL_$(ID)+ variable:
> ++
> +  * +FOO+ -> +BR2_EXTERNAL_FOO+
> +  * +BAR_42+ -> +BR2_EXTERNAL_BAR_42+
> +  * ...

Maybe mention which characters are allowed and which ones are not
allowed?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
