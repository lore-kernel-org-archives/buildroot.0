From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 18:46:28 +0100
Subject: [Buildroot] [PATCH RFC] Makefile: from a defconfig file,
 point to the corresponding board/ entry
In-Reply-To: <1701350.dX4dIeyire@aquila>
References: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
 <1701350.dX4dIeyire@aquila>
Message-ID: <20141127174628.GA3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-27 11:26 +0100, J?r?me Pouiller spake thusly:
> On Thursday 27 November 2014 00:13:55 Yann E. MORIN wrote:
> > This is an RFC!
> > 
> > When configuring Buildroot from a defconfig files, soem users complain
> > it is non-obvious that the corresponding board documentattion is to be
> > found in the board/ sub-directory.
> > 
> > So, deduce the board name from the defconfig file, look for a similarly
> > named sub-dir of board (first level only), and if such a directory
> > exists, print a message stating extra documentation for that board is to
> > be found there.
> 
> What about introducing a BR2_BOARD_DIR configuration variable? This variable 
> would have two functions:
>    - May be used to locate other files (configs, overlays, etc...)
>    - If defined, a help message is displayed when this defconfig is loaded.

The problem with using a Kconfig string variable is that Kconfig strgings
that have no prompt can only take their default value, as defined in
Config.in; if there is no default value, then the string option is not
even stored in the .config file.

If we were to have, for example, a Config.in with:

    config BR2_BOARD_DIR
        string

and we were to seed it with a foo_defconfig file that has:

    BR2_BOARD_DIR="$(TOP_DIR)/board/foo"

then calling "make foo_defconfig" would yield an empty .config file.

So, we can not use a Kconfig string variable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
