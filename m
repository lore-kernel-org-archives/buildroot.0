From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:08:30 +0100
Subject: [Buildroot] [PATCH] package/fontconfig: Fix UUIDD dependency
In-Reply-To: <CAOf5uwmcedGDiFR5mXAT16siS0XTd=mYW8dwR20_y8BwNWAzAg@mail.gmail.com>
References: <20191224112330.14173-1-michael@amarulasolutions.com>
 <20191224134557.43cadbf2@windsurf>
 <CAOf5uw=cG3nm8mWfVyuauDoTzE6i0XAvQ_K=bocyEdbJmFAV3Q@mail.gmail.com>
 <20191224143623.2cbdcf55@windsurf>
 <CAOf5uwmcedGDiFR5mXAT16siS0XTd=mYW8dwR20_y8BwNWAzAg@mail.gmail.com>
Message-ID: <20191224150830.64614643@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 14:39:12 +0100
Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:

> I created the config in two steps. Now I'm thinking that was only
> happen after I have added the XORG
> and OPENJDK. I have added this two components without re-build from
> scratch. Basically libconfig was looking for uuid and fail
> to find in the filesystem. I was thinking looking at the config.in
> that the right thing to do is adding
> that one instead of LIBUIID. I'm checking now

This feels like you did some partial build: util-linux was first build
with libuuid, and then you enabled something that needed libuuid,
without doing a full rebuild, or at least without forcing the rebuild
of util-linux.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
