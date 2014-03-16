From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 16 Mar 2014 21:18:37 +0000 (UTC)
Subject: [Buildroot] [Bug 6956] Packaging libsoxr
In-Reply-To: <bug-6956-163@https.bugs.busybox.net/>
References: <bug-6956-163@https.bugs.busybox.net/>
Message-ID: <20140316211837.7B1119B964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6956

--- Comment #2 from prezi77 at wp.pl 2014-03-16 21:18:36 UTC ---
(In reply to comment #1)
> There shouldn't be a real need to understand cmake in order to make a package
> available in buildroot. Have you had a look at this part of the manual?
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages 
> 
> Buildroot has a 'cmake-package' infrastructure, which makes it easy to add
> packages that have cmake makefiles.
> 
> If you can, implementing this yourself will create much bigger chances of the
> changes becoming available in buildroot, because other buildroot developers
> already have a lot of other work, so may not start on libsoxr.
> 
> Thanks in advance...

Well, as I said that not trivial like packaging mpdcron,libmpdclient or
ncmpcpp.

This what I see:
>> libsoxr 0.1.1 Patching
>>> libsoxr 0.1.1 Configuring
(cd /home/prezi/buildroot-2014.02/output/build/libsoxr-0.1.1/ && rm -f
CMakeCache.txt &&  /home/prezi/buildroot-2014.02/output/host/usr/bin/cmake
/home/prezi/buildroot-2014.02/output/build/libsoxr-0.1.1/
-DCMAKE_TOOLCHAIN_FILE="/home/prezi/buildroot-2014.02/output/host/usr/share/buildroot/toolchainfile.cmake"
-DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_SHARED_LIBS=ON
-Wno-dev )
Re-run cmake no build system arguments
-- The C compiler identification is GNU 4.7.3
-- Check for working C compiler:
/home/prezi/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
-- Check for working C compiler:
/home/prezi/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
-- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Looking for pow in m
-- Looking for pow in m - found
-- Try OpenMP C flag = [-fopenmp]
-- Performing Test OpenMP_FLAG_DETECTED
-- Performing Test OpenMP_FLAG_DETECTED - Success
-- Found OpenMP: -fopenmp  
-- Try SIMD C flag = [ ]
-- Performing Test SIMD_FLAG_DETECTED
-- Performing Test SIMD_FLAG_DETECTED - Failed
-- Try SIMD C flag = [/arch:SSE /fp:fast -D__SSE__]
-- Performing Test SIMD_FLAG_DETECTED
-- Performing Test SIMD_FLAG_DETECTED - Failed
-- Try SIMD C flag = [-msse -mfpmath=sse]
-- Performing Test SIMD_FLAG_DETECTED
-- Performing Test SIMD_FLAG_DETECTED - Success
-- Found SIMD: -msse -mfpmath=sse  
-- Looking for lrint
-- Looking for lrint - found
-- Looking for include file fenv.h
-- Looking for include file fenv.h - not found
-- Performing Test HAVE_WORDS_BIGENDIAN
CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the
following cache variables appropriately:
   HAVE_WORDS_BIGENDIAN_EXITCODE (advanced)
For details see
/home/prezi/buildroot-2014.02/output/build/libsoxr-0.1.1/TryRunResults.cmake
-- Performing Test HAVE_WORDS_BIGENDIAN - Failed
-- Configuring incomplete, errors occurred!
See also
"/home/prezi/buildroot-2014.02/output/build/libsoxr-0.1.1/CMakeFiles/CMakeOutput.log".
See also
"/home/prezi/buildroot-2014.02/output/build/libsoxr-0.1.1/CMakeFiles/CMakeError.log".
make: ***
[/home/prezi/buildroot-2014.02/output/build/libsoxr-0.1.1/.stamp_configured]
Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
