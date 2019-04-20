From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:56:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix build error due
 to architecture name is incomplete
In-Reply-To: <CAGKtFauRjyM83yyhyB5GC8_W_8PfhxaWgUhK9OLvecxfOH0R+g@mail.gmail.com>
References: <20190418094655.6526-1-nylon7@andestech.com>
 <20190420161653.79150ab3@windsurf>
 <CAGKtFauRjyM83yyhyB5GC8_W_8PfhxaWgUhK9OLvecxfOH0R+g@mail.gmail.com>
Message-ID: <20190420165628.5a5e3ef9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Apr 2019 22:33:26 +0800
??? <nylon7717@gmail.com> wrote:

> Sorry I make a mistake, this patch has an error, our architecture name is
> nds32 not nds32le.

Well, the architecture can be named nds32, but its tuple can be nds32le.

At least, gnuconfig supports nds32le and nds32be:

$ grep nds32 support/gnuconfig/*
support/gnuconfig/config.sub:	| nds32 | nds32le | nds32be \
support/gnuconfig/config.sub:	| nds32-* | nds32le-* | nds32be-* \

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
