From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 19:23:33 +0100
Subject: [Buildroot] So what do we do about all the unmaintained boards?
In-Reply-To: <87wsceqcsv.fsf@macbook.be.48ers.dk>
References: <1233182567.4147.16.camel@elrond.atmel.com>
	<87vdryrw65.fsf@macbook.be.48ers.dk>
	<F9E9391EAD414FA2BA0378C38D349B86@aeglos>
	<87ab9aru23.fsf@macbook.be.48ers.dk>
	<D91510715FFE497385EA85C1BE1F6FE2@aeglos>
	<87wsceqcsv.fsf@macbook.be.48ers.dk>
Message-ID: <1233253413.4147.44.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-29 klockan 17:47 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  >> Huh? I don't see any references to such variables under project.
>  >> 
>  Ulf> No, but I think you suggested that if this is to be general thing,
>  Ulf> it could be a configuration item under /project.
> 
>  Ulf> The way BOARD_NAME is implemented today
>  Ulf> is that you select a board and maybe set some options,
>  Ulf> and then Kconfig deduces the board name from that
>  Ulf> so it is really not something the user inputs.
> 
> So what's the BR2_BOARD_NAME thing for? Having it like you just
> described is no good for people building stuff without having one of
> those boards selected as they then cannot set BOARD_NAME.
> 

?It is also used to define which directory
contains other configuration items.

BR2_BOARD_PATH="target/device/Atmel/$(BOARD_NAME)

As you see, there is only a small number of acceptable values.

It is also used for U-Boot.
make $(BOARD_NAME)_config

so you do not have to specify manually the boardname.

For the SAM9263 you can build several u-boot targets like

?at91sam9263ek_dataflash_cs0
?at91sam9263ek_dataflash_cs1
?at91sam9263ek_nandflash

and this list will grow as support for different bootoptions
becomes more advanced.

It is too much to expect that people should remember
the exact name of such configurations.


> Individual boards may want to override the setting, but it should
> still be available.
> 


BR
Ulf Samuelsson
