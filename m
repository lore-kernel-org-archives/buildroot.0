From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:48:07 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/protoc-gen-lua: new package
In-Reply-To: <1468931473-19614-2-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1468931473-19614-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 <1468931473-19614-2-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <20160720224807.0f594093@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jul 2016 09:31:12 -0300, Tiago Brusamarello wrote:

> +PROTOC_GEN_LUA_VERSION = v1.1.1
> +PROTOC_GEN_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOC_GEN_LUA_VERSION))

This has the exact same source as the protobuf-lua package you propose
in PATCH 3/3:

+PROTOBUF_LUA_VERSION = v1.1.1
+PROTOBUF_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOBUF_LUA_VERSION))

So, we clearly don't want two packages in this case: we want a single
package. The host variant of the package will just install
plugin_pb2.py and protoc-gen-lua like your protoc-gen-lua package is
doing today. And the target package will do what your protobuf-lua
package is doing.

> +define HOST_PROTOC_GEN_LUA_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(HOST_DIR)/usr/bin
> +	$(INSTALL) -D -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(HOST_DIR)/usr/bin

Full destination paths please.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
