From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2020 09:35:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: fix build on musl
In-Reply-To: <20200502200444.3390908-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 May 2020 22:04:44 +0200")
References: <20200502200444.3390908-1-fontaine.fabrice@gmail.com>
Message-ID: <87blmuq5zf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set PAHO_HIGH_PERFORMANCE to disable free redefiniton as suggested by
 > upstream in https://github.com/eclipse/paho.mqtt.c/issues/846.

 > This will avoid the following build failure on musl:

 > /tmp/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/sched.h:80:17: error: expected declaration specifiers or '...' before string constant
 >  void free(void *);
 >                  ^
 > /tmp/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/sched.h:80:17: error: expected declaration specifiers or '...' before numeric constant
 >  void free(void *);
 >                  ^
 > [ 35%] Building C object src/CMakeFiles/common_obj.dir/Base64.c.o
 > [ 36%] Building C object src/CMakeFiles/common_obj.dir/SHA1.c.o
 > make[3]: *** [src/CMakeFiles/common_obj.dir/build.make:284: src/CMakeFiles/common_obj.dir/MQTTReasonCodes.c.o] Error 1

 > Fixes:
 >  - http://autobuild.buildroot.org/results//fbe57a1602fed331ddff3ff3560dce02573816ff

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
