From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 09:03:50 +0200
Subject: [Buildroot] Linux driver load failure with BR 2018.05
In-Reply-To: <VI1PR0802MB222117E26BBCC677A6F52306EAF50@VI1PR0802MB2221.eurprd08.prod.outlook.com>
 (Fabrice Mousset's message of "Tue, 23 Oct 2018 06:34:39 +0000")
References: <AM4PR0802MB2210297D6D99BC3630A51C1BEAF40@AM4PR0802MB2210.eurprd08.prod.outlook.com>
 <CAOMZO5A6mEfxx63qwzQwkGiGUfcog+Qq_-iM+ocJkTwq+n0Bfg@mail.gmail.com>
 <VI1PR0802MB222117E26BBCC677A6F52306EAF50@VI1PR0802MB2221.eurprd08.prod.outlook.com>
Message-ID: <874ldd4015.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com> writes:

Hi,

 >> I would suggest you to use mainline kernel if you can.

 > Yes I know this is not an "up to date" Kernel Version, but it is the
 > used by the board manufacturer which we are using.
 > I have ported a Yocto/Poky BSP to BuildRoot, to not have to use
 > multiple build tools... and in my eyes, Yocto is too big and complex.

 > I have notice a strange something which looks strange to me in the kernel build command.
 > After the "make -j9" then is a HOSTCC="/usr/bin/gcc -02  -I/opt/crosstools/sitec-s4/include ..."

 > Why HOSTCC is using /usr/bin/gcc and not /opt/crosstools/sitec-s4/bin/arm-geocept-linux-gnueabihf-gcc ?

Because HOSTCC is the compiler used to build stuff for the host
machine.

The -I/opt/crosstools/sitec-s4/includes looks as if you have configured
the Host directory (BR2_HOST_DIR) to that location. This is normally
only done if you want to build toolchain once and then store it there
for later reuse (notice that we now have 'make sdk' to handle such
things instead).

When you do your normal build using that toolchain you should NOT set
BR2_HOST_DIR to that location.

-- 
Bye, Peter Korsgaard
