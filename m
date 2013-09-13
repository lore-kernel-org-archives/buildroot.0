From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Sep 2013 09:56:22 +0200
Subject: [Buildroot] C++ Compiling
In-Reply-To: <15AE5A936F5E3A42A9144E66875A0A8934DC0F@server1-derijp.CLB-Benelux.lokaal>
 (Ruud Commandeur's message of "Fri, 13 Sep 2013 09:37:15 +0200")
References: <15AE5A936F5E3A42A9144E66875A0A8934DC07@server1-derijp.CLB-Benelux.lokaal>
 <CAGm1_kvR5zLfHRrcnKmoTSetC9SsiqOj2=xV2Xxa1502CkC8KA@mail.gmail.com>
 <15AE5A936F5E3A42A9144E66875A0A8934DC0F@server1-derijp.CLB-Benelux.lokaal>
Message-ID: <87li31noih.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ruud" == Ruud Commandeur <RCommandeur@clb.nl> writes:

Hi,

 Ruud> OK, I did not think of using CMake yet. Since Boost is mostly header
 Ruud> files, I thought it would be no different from my other simple
 Ruud> C-application. I build this with a generic-package like this:

 Ruud> define CLB_TEST_APP_BUILD_CMDS
 Ruud> 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

Presumably you need to pass CXX="$(TARGET_CXX)" or even better just use
TARGET_CONFIGURE_OPTS that set them all.

-- 
Bye, Peter Korsgaard
