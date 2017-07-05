From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  5 Jul 2017 22:08:39 +0300
Subject: [Buildroot] [PATCH 0/1] Fix for packages which use
	CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT and target is ARMv8
Message-ID: <20170705190840.22469-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

Earlier today I sent a patch to update WebKitGTK+ to version 2.16.5, which
I tested by building for the RPi3 with a configuration which was incorrectly
using ARMv6 as target. Then later I noticed the mistake and switched over to
use ARMv8 as target, but then WebKitGTK+ wouldn't build and CMake would stop
with the following error:

   [...]
   -- Detecting CXX compiler ABI info - done
   -- Detecting CXX compile features
   -- Detecting CXX compile features - done
   CMake Error at CMakeLists.txt:87 (message):
     Unknown CPU 'l'

Applying this patch to pkg-cmake.mk fixes the issue above, which I suspect
might affect other packages as well.

Cheers,


Adrian Perez de Castro (1):
  pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT for ARMv8

 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.13.2
