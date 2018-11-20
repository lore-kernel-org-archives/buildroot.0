From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Nov 2018 23:11:28 +0100
Subject: [Buildroot] [PATCH next v2] package/luarocks: rework
 configuration file for per-package folders
In-Reply-To: <20181120130110.30425-1-thomas.petazzoni@bootlin.com>
References: <20181120130110.30425-1-thomas.petazzoni@bootlin.com>
Message-ID: <9e4b3242-76ad-2e6e-ba3d-5dabde0ffd91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/11/2018 14:01, Thomas Petazzoni wrote:
> +LUAROCKS_RUN_ENV = \
> +	LUA_PATH="$(HOST_DIR)/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
> +	STAGING_DIR="$(STAGING_DIR)" \
> +	TARGET_DIR="$(TARGET_DIR)" \

 These two are already exported in top-level Makefile, so it shouldn't be needed
(note that when a variable is exported, it will get its value from the context
where the shell is started, not from where the 'export' statement is put, so it
does exactly what we need it to).

> +	TARGET_CC="$(TARGET_CC)" \
> +	TARGET_CFLAGS="$(LUAROCKS_CFLAGS)" \
> +	TARGET_LDFLAGS="$(TARGET_LDFLAGS)"

 For these three, I expect other package infras will need it as well, so it
would make sense to export them too.

 Regards,
 Arnout
