From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 12:36:04 +0200
Subject: [Buildroot] [PATCH 2/3] package/protoc-gen-lua: new package
In-Reply-To: <1467291218-7710-2-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1467291218-7710-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 <1467291218-7710-2-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <20160716123604.2c0321a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jun 2016 09:53:37 -0300, Tiago Brusamarello wrote:

> +define HOST_PROTOC_GEN_LUA_INSTALL_CMDS
> +	# install protoc Lua plugin

Please put this comment above the variable definition.

> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(HOST_DIR)/usr/bin
> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(HOST_DIR)/usr/bin

Please use:

	$(INSTALL) -D -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(HOST_DIR)/usr/bin/protoc-gen-lua

(for both files)

I.e: use the -D option, and specify a full destination path.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
