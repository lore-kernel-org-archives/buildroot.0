From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 17:47:44 +0100
Subject: [Buildroot] So what do we do about all the unmaintained boards?
In-Reply-To: <D91510715FFE497385EA85C1BE1F6FE2@aeglos> (Ulf Samuelsson's
	message of "Thu\, 29 Jan 2009 17\:32\:01 +0100")
References: <1233182567.4147.16.camel@elrond.atmel.com>
	<87vdryrw65.fsf@macbook.be.48ers.dk>
	<F9E9391EAD414FA2BA0378C38D349B86@aeglos>
	<87ab9aru23.fsf@macbook.be.48ers.dk>
	<D91510715FFE497385EA85C1BE1F6FE2@aeglos>
Message-ID: <87wsceqcsv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> Huh? I don't see any references to such variables under project.
 >> 
 Ulf> No, but I think you suggested that if this is to be general thing,
 Ulf> it could be a configuration item under /project.

 Ulf> The way BOARD_NAME is implemented today
 Ulf> is that you select a board and maybe set some options,
 Ulf> and then Kconfig deduces the board name from that
 Ulf> so it is really not something the user inputs.

So what's the BR2_BOARD_NAME thing for? Having it like you just
described is no good for people building stuff without having one of
those boards selected as they then cannot set BOARD_NAME.

Individual boards may want to override the setting, but it should
still be available.

-- 
Bye, Peter Korsgaard
