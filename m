From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 15:12:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] grpc: new package
In-Reply-To: <20181118211942.28839-2-robertroyrose@gmail.com>
References: <20181118211942.28839-1-robertroyrose@gmail.com>
 <20181118211942.28839-2-robertroyrose@gmail.com>
Message-ID: <20181124151256.5b786338@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

Thanks for this contribution!

On Sun, 18 Nov 2018 13:19:42 -0800, Robert Rose wrote:
> Signed-off-by: Robert Rose <robertroyrose@gmail.com>
> ---
>  DEVELOPERS                                    |  3 ++
>  package/Config.in                             |  1 +
>  .../0001-target-build-using-host-plugin.patch | 26 ++++++++++++++
>  package/grpc/Config.in                        | 11 ++++++
>  package/grpc/grpc.hash                        |  3 ++
>  package/grpc/grpc.mk                          | 36 +++++++++++++++++++
>  6 files changed, 80 insertions(+)
>  create mode 100644 package/grpc/0001-target-build-using-host-plugin.patch
>  create mode 100644 package/grpc/Config.in
>  create mode 100644 package/grpc/grpc.hash
>  create mode 100644 package/grpc/grpc.mk

I wanted to apply your patch, but unfortunately, it fails to build for
me in host-grpc:

-- Configuring done
CMake Error at CMakeLists.txt:193 (add_custom_command):
  Error evaluating generator expression:

    $<IF:$<BOOL:>,,$<TARGET_FILE:grpc_cpp_plugin>>

  Expression did not evaluate to a known generator expression
Call Stack (most recent call first):
  CMakeLists.txt:3852 (protobuf_generate_grpc_cpp)


CMake Error at CMakeLists.txt:193 (add_custom_command):
  Error evaluating generator expression:

    $<IF:$<BOOL:>,,$<TARGET_FILE:grpc_cpp_plugin>>

  Expression did not evaluate to a known generator expression
Call Stack (most recent call first):
  CMakeLists.txt:4811 (protobuf_generate_grpc_cpp)


CMake Error at CMakeLists.txt:193 (add_custom_command):
  Error evaluating generator expression:

    $<IF:$<BOOL:>,,$<TARGET_FILE:grpc_cpp_plugin>>

  Expression did not evaluate to a known generator expression
Call Stack (most recent call first):
  CMakeLists.txt:3722 (protobuf_generate_grpc_cpp)


-- Generating done
CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_ASM_COMPILER


-- Build files have been written to: /home/thomas/buildroot/buildroot/output/build/host-grpc-v1.16.0
package/pkg-generic.mk:219: recipe for target '/home/thomas/buildroot/buildroot/output/build/host-grpc-v1.16.0/.stamp_configured' failed
make[1]: *** [/home/thomas/buildroot/buildroot/output/build/host-grpc-v1.16.0/.stamp_configured] Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Could you have a look into this ?

Note that I did a number of fixes/cleanups in your patches, so it would
be nice if you could restart from the two patches I have pushed at
https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=grpc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
