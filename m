From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2020 09:54:04 +0200
Subject: [Buildroot] [PATCH 01/22] core/pkg-utils: rationalise kconfig
 option mangling
In-Reply-To: <51d6198cedf58c1834394974bd9d2e281ec05f25.1586002215.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 4 Apr 2020 14:10:13 +0200")
References: <cover.1586002215.git.yann.morin.1998@free.fr>
 <51d6198cedf58c1834394974bd9d2e281ec05f25.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <87eenoefhf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we have three macros that may mangle a .config file. All
 > three are modeled after the same pattern: removing the existing option
 > from the .config file, then adding the new definition for that option;
 > all three also implement that pattern with the same commands: sed and
 > echo.

 > This is all good so far, because it was simple enough, and the always
 > worked on a file passed in parameter.

 > However, we're soon going to change this file parameter to make it
 > optional, so that the file will then be auto-deduced for the current
 > package. In that case, the file to sed adn echo into will be a more
 > complex structure than just the parameter.

 > As such, move the actual mangling down to a helper macro, that is called
 > from the three existing ones.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x to fix the busybox breakage, thanks.

-- 
Bye, Peter Korsgaard
