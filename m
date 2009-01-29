From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 17:32:01 +0100
Subject: [Buildroot] So what do we do about all the unmaintained boards?
References: <1233182567.4147.16.camel@elrond.atmel.com><87vdryrw65.fsf@macbook.be.48ers.dk><F9E9391EAD414FA2BA0378C38D349B86@aeglos>
	<87ab9aru23.fsf@macbook.be.48ers.dk>
Message-ID: <D91510715FFE497385EA85C1BE1F6FE2@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Ulf> I suggest we remove the boards with 2.4 kernel only today
> Ulf> but we should have one board per architecture we want to support.
>
> Ulf> There is no PowerPC board support at the moment. Can you fix since 
> you
> Ulf> seem to be working on this?
>
> Why? If the target/generic skeleton and default busybox / uclibc
> configs work fine, I don't see much value in adding one.
>
> Ulf> The BOARD_NAME, BOARD_PATH really belong
> Ulf> in a target/device/<subdir> directory and not in the 
> <buildroot>/project.
>
> Huh? I don't see any references to such variables under project.
>
No, but I think you suggested that if this is to be general thing,
it could be a configuration item under /project.

The way BOARD_NAME is implemented today
is that you select a board and maybe set some options,
and then Kconfig deduces the board name from that
so it is really not something the user inputs.

Therefore I think it belongs in target/device/VENDOR/Config.in and not in 
project.


Best Regards
Ulf Samuelsson


> -- 
> Bye, Peter Korsgaard
> 
