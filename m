From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Tue, 12 Sep 2017 15:37:24 +0200
Subject: [Buildroot] [PATCH] paho-mqtt-c: bump to version 1.2.0
In-Reply-To: <20170912130415.14281-1-yegorslists@googlemail.com>
References: <20170912130415.14281-1-yegorslists@googlemail.com>
Message-ID: <0f06c172-a13c-e5a8-6f7f-1958a9c84c91@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yegor,

On 12.09.2017 15:04, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
>  package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
> index 8807d788a3..5fda80abaa 100644
> --- a/package/paho-mqtt-c/paho-mqtt-c.hash
> +++ b/package/paho-mqtt-c/paho-mqtt-c.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  970b9621efc24251441d386274cd0a90cf6ad52b64031f3c8cb53fdd5526f5f3  paho-mqtt-c-v1.1.0.tar.gz
> +sha256  0cb0396554ebe0e8ac6b0de1cbc16601ef169b6a63baf6f0f3ddeb405f5471a5  paho-mqtt-c-v1.2.0.tar.gz
> diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
> index 22ef2effac..5df7a55c62 100644
> --- a/package/paho-mqtt-c/paho-mqtt-c.mk
> +++ b/package/paho-mqtt-c/paho-mqtt-c.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PAHO_MQTT_C_VERSION = v1.1.0
> +PAHO_MQTT_C_VERSION = v1.2.0
>  PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHO_MQTT_C_VERSION))
>  PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
>  PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
> 


I tried to do that bump a while ago but this failed test-pgk for a
toolchain with no c++ compiler, because apparently something in the
cmake compiler detection logic changed. (I don't think it actually
requires a c++ compiler.)

It was the br-arm-basic toolchain and this is the error I got:

>>> paho-mqtt-c v1.2.0 Configuring
(mkdir -p
/home/mhoffmann/br-test-pkg/br-arm-basic/build/paho-mqtt-c-v1.2.0/ && cd
/home/mhoffmann/br-test-pkg/br-arm-basic/build/paho-mqtt-c-v1.2.0/ && rm
-f CMakeCache.txt &&
PATH="/home/mhoffmann/br-test-pkg/br-arm-basic/host/bin:/home/mhoffmann/br-test-pkg/br-arm-basic/host/sbin:/opt/gradle/gradle-4.0/bin:/opt/gradle/gradle-4.0/bin:/home/mhoffmann/bin:/home/mhoffmann/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
 /usr/bin/cmake
/home/mhoffmann/br-test-pkg/br-arm-basic/build/paho-mqtt-c-v1.2.0/
-DCMAKE_TOOLCHAIN_FILE="/home/mhoffmann/br-test-pkg/br-arm-basic/host/share/buildroot/toolchainfile.cmake"
-DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF
-DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF
-DBUILD_TEST=OFF -DBUILD_TESTS=OFF -DBUILD_TESTING=OFF
-DBUILD_SHARED_LIBS=ON  -DPAHO_WITH_SSL=TRUE )
-- CMake version: 3.7.2
-- CMake system name: Linux
-- Timestamp is 2017-08-07T18:41:29Z
-- OpenSSL hints:
-- OpenSSL headers found at
/home/mhoffmann/br-test-pkg/br-arm-basic/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-- OpenSSL library found at
/home/mhoffmann/br-test-pkg/br-arm-basic/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.so
-- OpenSSL Crypto library found at
/home/mhoffmann/br-test-pkg/br-arm-basic/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.so
-- The CXX compiler identification is unknown
CMake Error at test/CMakeLists.txt:1 (PROJECT):
  The CMAKE_CXX_COMPILER:

    /home/mhoffmann/br-test-pkg/br-arm-basic/host/bin/arm-linux-g++

  is not a full path to an existing compiler tool.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full
path
  to the compiler, or to the compiler name if it is in the PATH.


Anyone got some ideas for this?

Marcus
