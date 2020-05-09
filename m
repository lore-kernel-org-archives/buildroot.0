From: William Tambe <tambewilliam@gmail.com>
Date: Fri, 8 May 2020 23:04:07 -0400
Subject: [Buildroot] Incorrect configure --target= and --host= when building
 ncurses 6.1
Message-ID: <CAF8i9mPUisBPgEe-L1Lm8SPy3j-dzDBOOQUjMQB64XwvyBKs6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am adding a new board for which the architecture name is "iron".
While building ncurses, the following command is issued:

./configure --target=iron-buildroot-linux-gnu --host=iron-buildroot-linux-gnu

Which is throwing the error:
checking host system type... Invalid configuration
`iron-buildroot-linux-gnu': machine `iron-buildroot' not recognized

I believe, the configure command should have been:
./configure --target=iron-linux-gnu --host=iron-linux-gnu

Any idea what could be causing the extra "buildroot" in configure
--target= and --host= arguments ?
