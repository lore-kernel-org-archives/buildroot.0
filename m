From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 03 Aug 2012 10:30:26 +0200
Subject: [Buildroot] [PATCH 5/6] luaexpat: Add license info
In-Reply-To: <1343962432-2772-5-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <1343962432-2772-5-git-send-email-danomimanchego123@gmail.com>
Message-ID: <501B8C22.7040208@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>   package/luaexpat/luaexpat.mk |    8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
> index 400d7b4..c875caa 100644
> --- a/package/luaexpat/luaexpat.mk
> +++ b/package/luaexpat/luaexpat.mk
> @@ -4,9 +4,11 @@
>   #
>   #############################################################
>   
> -LUAEXPAT_VERSION      = 1.2.0
> -LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
> -LUAEXPAT_DEPENDENCIES = lua expat
> +LUAEXPAT_VERSION       = 1.2.0
> +LUAEXPAT_SITE          = http://matthewwild.co.uk/projects/luaexpat
> +LUAEXPAT_DEPENDENCIES  = lua expat
> +LUAEXPAT_LICENSE       = MIT
> +LUAEXPAT_LICENSE_FILES = doc/us/license.html

Ouch, putting the license in an HTML file is very strange!
The license.txt file produces by `make legal-info` is supposed to be a
text file, not a mix of different formats.

I have no strong opinion about what to do here, but I slightly prefer to
not define LUAEXPAT_LICENSE_FILES in this case, since it cannot work 100%
as expected. Asking the developers to use a standard format may be a good
idea as well.

Luca
