From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Dec 2012 23:57:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/keyutils: disable on avr32
In-Reply-To: <8d01634829b527333c15467ad91cd0cbeb4c91bb.1356459033.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 25 Dec 2012 19:11:30 +0100")
References: <cover.1356459033.git.yann.morin.1998@free.fr>
 <cover.1356459033.git.yann.morin.1998@free.fr>
 <8d01634829b527333c15467ad91cd0cbeb4c91bb.1356459033.git.yann.morin.1998@free.fr>
Message-ID: <87k3s45slv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> keyutils does not build on avr32 (probably
 Yann> because the toolchain is way too old).

 Yann> Fixes:
 Yann>     http://autobuild.buildroot.net/results/aa86f6a68f5d0ea4914ab259ed270615bc9d6a99/

Hmm, that just looks like a warning which the package errors out on as
it uses -Werror and we don't override CFLAGS like we should. How about
moving TARGET_CONFIGURE_OPTS past MAKE instead? ( $(MAKE)
$(TARGET_CONFIGURE_OPTS) -C ..)

-- 
Bye, Peter Korsgaard
