From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 12:01:00 +0200
Subject: [Buildroot] Incorrect configure --target= and --host= when
 building ncurses 6.1
In-Reply-To: <CAF8i9mPUisBPgEe-L1Lm8SPy3j-dzDBOOQUjMQB64XwvyBKs6Q@mail.gmail.com>
References: <CAF8i9mPUisBPgEe-L1Lm8SPy3j-dzDBOOQUjMQB64XwvyBKs6Q@mail.gmail.com>
Message-ID: <20200509120100.0720d23a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 8 May 2020 23:04:07 -0400
William Tambe <tambewilliam@gmail.com> wrote:

> I am adding a new board for which the architecture name is "iron".

You're really using a completely new CPU architecture? You have a
complete toolchain available for it ?

> While building ncurses, the following command is issued:
> 
> ./configure --target=iron-buildroot-linux-gnu --host=iron-buildroot-linux-gnu

You need to add support for the "iron" architecture in gnuconfig. We
have our own copy of the gnuconfig files in support/gnuconfig/, which
we use to overwrite what is provided by autotools packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
