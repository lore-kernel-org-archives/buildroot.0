From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 27 Nov 2014 11:26 +0100
Subject: [Buildroot] [PATCH RFC] Makefile: from a defconfig file,
	point to the corresponding board/ entry
In-Reply-To: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
References: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1701350.dX4dIeyire@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thursday 27 November 2014 00:13:55 Yann E. MORIN wrote:
> This is an RFC!
> 
> When configuring Buildroot from a defconfig files, soem users complain
> it is non-obvious that the corresponding board documentattion is to be
> found in the board/ sub-directory.
> 
> So, deduce the board name from the defconfig file, look for a similarly
> named sub-dir of board (first level only), and if such a directory
> exists, print a message stating extra documentation for that board is to
> be found there.

What about introducing a BR2_BOARD_DIR configuration variable? This variable 
would have two functions:
   - May be used to locate other files (configs, overlays, etc...)
   - If defined, a help message is displayed when this defconfig is loaded.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
