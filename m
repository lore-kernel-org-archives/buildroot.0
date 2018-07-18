From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:11:00 +0200
Subject: [Buildroot] [PATCH] qt5script: fix build issue with 32-bits
 armv8-a
In-Reply-To: <20180611135417.18259-1-gael.portay@savoirfairelinux.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Mon, 11 Jun 2018 09:54:17 -0400")
References: <20180611135417.18259-1-gael.portay@savoirfairelinux.com>
Message-ID: <87o9f4i717.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

 > Adds WTF platform support for the 32-bits armv8-a architectures.
 > Fixes:

 > 	In file included from ../3rdparty/javascriptcore/JavaScriptCore/config.h:26,
 > 	                from ../3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_compile.cpp:44:
 > 	../3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h:370:6: error: #error "Not supported ARM architecture"
 > 	#    error "Not supported ARM architecture"
 > 	     ^~~~~

 > The patch is based on two upstream fixes in WebKit[1][2].

 > See also commit cea7aa873a.

 > [1]: https://github.com/WebKit/webkit/commit/313d9fc4bdd2f020a5d0cf834c3c61982f161ebb
 > [2]: https://github.com/WebKit/webkit/commit/98f0de0709786f5d9b09dfd5908266990eb909d6

 > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
 > ---
 > Hi all,

 > This bug can be repoduced using the raspberrypi3_defconfig + BR2_PACKAGE_QT5SCRIPT.

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
