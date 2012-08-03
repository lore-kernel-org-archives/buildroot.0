From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 03 Aug 2012 10:38:14 +0200
Subject: [Buildroot] [PATCH 1/6] cjson: Add license info
In-Reply-To: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <501B8DF6.3060109@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>   package/cjson/cjson.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
> index a9b0bcf..44ddfc2 100644
> --- a/package/cjson/cjson.mk
> +++ b/package/cjson/cjson.mk
> @@ -7,6 +7,8 @@ CJSON_VERSION         = undefined
>   CJSON_SOURCE          = cJSONFiles.zip
>   CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
>   CJSON_INSTALL_STAGING = YES
> +CJSON_LICENSE         = MIT
> +CJSON_LICENSE_FILES   = cJSON/README

Unfortunately that README is not a license file. Ok, it starts
with the license, but then goes on with a description of the
packages, how to build, etc. The license is just 10% of the whole
file. This is off topic in licenses.txt.

This is one of the known cases that `make legal-info` is unable to
handle correctly, so you should a) skip the definition of
CJSON_LICENSE_FILES, or b) ask the developers include a proper
license file, or c) extend legal-info to handle these cases. :)

Luca
