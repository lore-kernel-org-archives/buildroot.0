From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 20:57:15 +0100
Subject: [Buildroot] [PATCH v2] package/librtlsdr: fix build failure
In-Reply-To: <1418579154-9688-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 14 Dec 2014 18:45:54 +0100")
References: <1418579154-9688-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87zjaqm2ck.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Disable run test for pthread detection.
 > In case of build with only static library, CMake fails to detect the
 > pthread library (-lpthread), so it falls back trying to link using
 > -pthread and execute the test program.

 > <snip>
 >   [...]
 >   -- Looking for include file pthread.h
 >   -- Looking for include file pthread.h - found
 >   -- Looking for pthread_create in pthreads
 >   -- Looking for pthread_create in pthreads - not found
 >   -- Looking for pthread_create in pthread
 >   -- Looking for pthread_create in pthread - not found
 >   -- Check if compiler accepts -pthread
 >   CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
 >      THREADS_PTHREAD_ARG (advanced)
 >   For details see /home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/TryRunResults.cmake
 >   -- Check if compiler accepts -pthread - no
 >   -- Found Threads: TRUE
 >   -- Udev rules not being installed, install them with -DINSTALL_UDEV_RULES=ON
 >   -- Building with kernel driver detaching disabled, use -DDETACH_KERNEL_DRIVER=ON to enable
 >   -- Building for version: 0.5.3 / 0.5.3
 >   -- Using install prefix: /usr
 >   -- Configuring incomplete, errors occurred!
 >   See also "/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeOutput.log".
 >   See also "/home/buildroot/instance-1/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeError.log".
 > </snip>

 > Here it fails because, in the CMake FindThreads.cmake file, the
 > 'try_run' function is unconditionally called [1].

Committed, thanks.

-- 
Bye, Peter Korsgaard
