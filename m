From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 20 Jul 2016 22:36:15 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/protoc-gen-lua: new package
In-Reply-To: <1468931473-19614-2-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1468931473-19614-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 <1468931473-19614-2-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <88750252-9b65-cb6a-3004-f693ab6cdef6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tiago,

Le 19/07/2016 ? 14:31, Tiago Brusamarello a ?crit :
> This package adds support to compile Google's Protocol buffers
> for use with Lua scripts. This tool is needed to allow use of the
> 'protobuf-lua' package.
> 
Thanks for this new version!

Sorry but it still doesn't work here for the same reason:

ImportError: No module named google.protobuf

I have not idea...

Best regards,
Romain


> Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
> 
> ---
> Changes v1 -> v2:
>   - Removed Config.in (suggested by Romain Naour)
>   - Added new line at end of the .mk file (suggested by Romain Naour)
> 
> Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
> ---
>  package/protoc-gen-lua/protoc-gen-lua.hash |  2 ++
>  package/protoc-gen-lua/protoc-gen-lua.mk   | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 package/protoc-gen-lua/protoc-gen-lua.hash
>  create mode 100644 package/protoc-gen-lua/protoc-gen-lua.mk
> 
> diff --git a/package/protoc-gen-lua/protoc-gen-lua.hash b/package/protoc-gen-lua/protoc-gen-lua.hash
> new file mode 100644
> index 0000000..0badc84
> --- /dev/null
> +++ b/package/protoc-gen-lua/protoc-gen-lua.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  bccdd9c65970c42fd29b87084db83777cad75780a67c5107b68f96603b5788a8  protoc-gen-lua-v1.1.1.tar.gz
> diff --git a/package/protoc-gen-lua/protoc-gen-lua.mk b/package/protoc-gen-lua/protoc-gen-lua.mk
> new file mode 100644
> index 0000000..5c83372
> --- /dev/null
> +++ b/package/protoc-gen-lua/protoc-gen-lua.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# protoc-gen-lua
> +#
> +################################################################################
> +
> +PROTOC_GEN_LUA_VERSION = v1.1.1
> +PROTOC_GEN_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOC_GEN_LUA_VERSION))
> +PROTOC_GEN_LUA_DEPENDENCIES = host-python-protobuf
> +PROTOC_GEN_LUA_LICENSE = BSD-3c
> +PROTOC_GEN_LUA_LICENSE_FILES = LICENSE
> +
> +define HOST_PROTOC_GEN_LUA_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(HOST_DIR)/usr/bin
> +	$(INSTALL) -D -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(HOST_DIR)/usr/bin
> +endef
> +
> +$(eval $(host-generic-package))
> 
