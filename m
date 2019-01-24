From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:46:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/libsquash: really install
 shared library
In-Reply-To: <20190112121024.27896-2-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 12 Jan 2019 13:10:24 +0100")
References: <20190112121024.27896-1-romain.naour@gmail.com>
 <20190112121024.27896-2-romain.naour@gmail.com>
Message-ID: <871s52f47i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > While testing the new supertuxkart 0.10-beta1 version, the build failed
 > due to missing libsquash shared library.
 > Indeed, by default (see config file) the shared library is not build
 > and all symlinks created by LIBSQUISH_INSTALL_{STAGING,TARGET}_CMDS are
 > curently broken.

 > To fix that, add USE_SHARED=1 to LIBSQUISH_MAKE_ENV.

 > Also add a patch to allow reinstall the package.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > There is a new CMakeFiles.txt but it doesn't install libsquish.pc file.

 > @Peter: This patch should be backported to all stable version
 > (i.e since the bump to 1.15, commit 374e39df819598a0049a9c485ce5b2adbe2c90a1)

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
