From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:48:36 +0200
Subject: [Buildroot] [PATCH] package/gnuradio: backport patch to fix
 INTERFACE_INCLUDE_DIRECTORIES
In-Reply-To: <20200827154903.1107968-1-gwenj@trabucayre.com> (Gwenhael
 Goavec-Merou's message of "Thu, 27 Aug 2020 17:49:03 +0200")
References: <20200827154903.1107968-1-gwenj@trabucayre.com>
Message-ID: <877dtioe4r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > gnuradio-runtimeTargets.cmake and gnuradio-pmtTargets.cmake are filled
 > using CMAKE_INSTALL_PREFIX for INSTALL_INTERFACE.

 > Since CMAKE_INSTALL_PREFIX, in buildroot, is set to /usr, these files contains
 > path to host system.

 > With BR2_COMPILER_PARANOID_UNSAFE_PATH package using gnuradio fails with:
 > arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in
 > cross-compilation: '-isystem' '/usr/include'

 > By simply providing 'include', produced .cmake contains:
 > INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
 > instead of
 > INTERFACE_INCLUDE_DIRECTORIES "/usr/include"

 > [Upstream status: https://github.com/gnuradio/gnuradio/pull/3737]

 > Fix (many) gr-osmosdr build failure:
 > - http://autobuild.buildroot.net/results/66b76c07f15bb3e6db697c47796ae3dd15ecf4b9/

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
