From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 18 Jun 2007 10:53:43 +0200
Subject: [Buildroot] uClibc's index function
In-Reply-To: <20070618074508.GD1841@z1.synertronixx>
References: <20070618074508.GD1841@z1.synertronixx>
Message-ID: <20070618085343.GA17187@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 18, 2007 at 09:45:08AM +0200, Konstantin Kletschke wrote:
>Hi Folks!
>
>I used buildroot to create a arm-linux toolchain with softfloat
>succesfully for about half a year now, the uClibc was a 20070206
>snapshot. Now I am trying to release a version for our customers based
>on 0.9.29 and this toolchain refuses to compile stuff calling an index
>function, which worked flawlessly before:
>
>For example:
>
>prog/dump/i2cbusses.ro: In function `print_i2c_busses':
>i2cbusses.c:(.text+0x354): undefined reference to `index'
>collect2: ld returned 1 exit status
>
>Is the call (and including string.h) deprecated and needs rewrite of
>code (I will communicate this to customers then), or  is the error
>before the screen here?
>
>I inspected the headerfiles of the toolchain in the inlcude directory
>but I found no differences concerning the index function...

See the help-text of UCLIBC_SUSV3_LEGACY

You should not use these anymore but use their modern, current
counterparts.
