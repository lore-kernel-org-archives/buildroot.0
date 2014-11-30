From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 00:20:16 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/parted: fix static link
In-Reply-To: <fa1b00debbe3293a7617c2c7829e9acead92dc19.1417386541.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 30 Nov 2014 23:31:37 +0100")
References: <cover.1417386541.git.yann.morin.1998@free.fr>
 <fa1b00debbe3293a7617c2c7829e9acead92dc19.1417386541.git.yann.morin.1998@free.fr>
Message-ID: <878uisi8cv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libuuid needs to be linked with -lintl when gettext is needed (with
 > locales).

 > For a shared build, this is solved with the DT_NEEDED ELF tags, but for
 > a static link, it is not pulled in automatically.

 > Use pkg-config to find libuuid, instead of AC_CHECK_LIB().

 > Second part at fixing:
 >     http://autobuild.buildroot.net/results/c46/c467aeec258909bb82eda77123803944f97d8df8/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

 > ---
 > Changes v1 -> v2:
 >   - typoes  (Peter)

You forgot to add host-pkgconf to the _DEPENDENCIES lines
(target/host). Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
