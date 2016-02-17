From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 13:07:40 +0100
Subject: [Buildroot] [PATCH v2 1/1] jsen: new package JSEN (JSON
 Sentinel) validates your JSON objects using JSON-Schema.
In-Reply-To: <1455706383-8951-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1455706383-8951-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <20160217130740.7bb84a20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Atul Singh,

Thanks for this new version. I could apply it by doing a few changes,
but I prefer to give you a review so you know what the remaining issues
are.

First the title of the commit should be:

	jsen: new package

and nothing else. If you want to put some additional explanations, you
need to separate it with an empty new line. Like this:

"""
jsen: new package

This new package adds the JSEN Javascript library. JSEN (JSON Sentinel)
validates your JSON objectifs using JSON-Schema.

Signed-off-by: ....
"""

On Wed, 17 Feb 2016 16:23:03 +0530, Atul Singh wrote:
> Changes v1->v2
> -Added the jsen under the javascript menu(as suggested by Thomas).
> -Updated the loop for retrieving the JSEN directories.

It's very good to have a change log, but it should go....

> 
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> ---

... here, i.e after the "---" sign.

This way, the changelog is part of your patch (so I can see it when
reviewing your patch) but it will not be integrated in the Git history
as part of the commit log.

> diff --git a/package/Config.in b/package/Config.in
> index a5b31aa..1e511de 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -985,6 +985,7 @@ menu "External jQuery plugins"
>  endmenu
>  endif
>  	source "package/jsmin/Config.in"
> +	source "package/jsen/Config.in"
>  	source "package/json-javascript/Config.in"

Alphabetic ordering it not correct here.

> new file mode 100644
> index 0000000..f5949aa
> --- /dev/null
> +++ b/package/jsen/jsen.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# jsen
> +#
> +################################################################################
> +
> +JSEN_VERSION = v0.6.0
> +JSEN_SITE = $(call github,bugventure,jsen,$(JSEN_VERSION))
> +JSEN_LICENSE = MIT
> +JSEN_LICENSE_FILES = LICENSE
> +JSEN_DIRECTORIES_LIST = dist lib
> +JSEN_ROOT_FILES_LIST = index.js

Those two variables are useless now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
