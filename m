From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Jul 2020 18:02:12 +0200
Subject: [Buildroot] [PATCHv3] package/bat: new package
In-Reply-To: <20200727170126.51d45e8b@windsurf.home>
References: <20200727140922.2614959-1-romain.naour@gmail.com>
 <20200727170126.51d45e8b@windsurf.home>
Message-ID: <a6e0c13c-00cf-77ef-b121-f7e08545c63b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 27/07/2020 ? 17:01, Thomas Petazzoni a ?crit?:
> On Mon, 27 Jul 2020 16:09:22 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> +	# less needs ncurses
>> +	select BR2_PACKAGE_NCURSES
> 
> less already selects ncurses, so why do we need ncurses here ?

Indeed.

> 
>> +BAT_CARGO_OPTS = \
>> +	 --bins \
>> +	 --$(BAT_CARGO_MODE) \
>> +	 --target=$(RUSTC_TARGET_NAME) \
>> +	 --manifest-path=$(@D)/Cargo.toml
>> +
>> +define BAT_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(BAT_CARGO_ENV) \
>> +	CC_$(subst -,_,$(RUSTC_TARGET_NAME))=$(TARGET_CC) \
> 
> I am still not happy with this. There is no reason why this should be
> passed on a per-package basis, it should be handled by "cargo" and all
> the cross-compilation configuration it has.

Well, I guess the pkg-cargo.mk infra will handle this.

I discovered CC_aarch64_unknown_linux_gnu by looking at a Dockerfile example:

https://github.com/rust-lang/rust/blob/c367798cfd3817ca6ae908ce675d1d99242af148/src/ci/docker/dist-aarch64-linux/Dockerfile#L29

I'm not sure why it's not handled by config.toml...

Best regards,
Romain

> 
> Thomas
> 
