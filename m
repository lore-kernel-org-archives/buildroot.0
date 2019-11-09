From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Nov 2019 18:48:08 +0100
Subject: [Buildroot] [PATCH] package/dtc: needs host-pkgconf
 unconditionally
In-Reply-To: <20191103104206.1061-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 3 Nov 2019 11:42:06 +0100")
References: <20191103104206.1061-1-yann.morin.1998@free.fr>
Message-ID: <87d0e1kkkn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commits 495e757d2 (package/dtc: add optional libyaml dependency) and
 > e43d9072a (package/dtc: fix build without libyaml), added a conditional
 > dependency to host-pkgconf, when libyaml is enabled, while commit
 > 56d6dd453 (package/dtc: disable valgrind) explicitly disabled support of
 > valgrind.

 > However, presence of libyaml, as well as that of valgrind, *is* detected
 > by calling pkg-config:

 >     NO_VALGRIND := $(shell $(PKG_CONFIG) --exists valgrind; echo $$?)
 >     NO_YAML := $(shell $(PKG_CONFIG) --exists yaml-0.1; echo $$?)

 > Passing NO_YAML=1 or NO_VALGRIND=1 do not prevent the tests from being
 > executed, which would yield messages like:

 >     /bin/sh: 1: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: not found

 > (note however that, even if the test is executed, the value we pass on
 > the command line still takes precedence, and the support for either is
 > properly disabled.)

 > So, move the dependency on host-pkgconfig out of the condition. Ditto
 > for the host package.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Cc: Titouan Christophe <titouan.christophe@railnova.eu>
 > Cc: Carlos Santos <unixmania@gmail.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
