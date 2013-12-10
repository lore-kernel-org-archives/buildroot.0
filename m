From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Dec 2013 13:35:16 +0100
Subject: [Buildroot] [PATCH v5 1/1] ktap: new package
In-Reply-To: <1386676781-22541-1-git-send-email-anders@chargestorm.se> (Anders
 Darander's message of "Tue, 10 Dec 2013 12:59:41 +0100")
References: <1386676781-22541-1-git-send-email-anders@chargestorm.se>
Message-ID: <87haag6fzv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders@chargestorm.se> writes:

 > Add ktap, a script-based dynamic tracing tool.
 > Signed-off-by: Anders Darander <anders@chargestorm.se>
 > ---

 > Changes v4 -> v5:
 > 	- Remove trailing whitespace that was added by mistake in
 > 	last version.

I just did a little test build with qemu_arm_versatile_defconfig:

/home/peko/source/buildroot/output/build/ktap-v0.3/interpreter/ktap.c:32:6: warning: "CONFIG_EVENT_TRACING" is not defined [-Wundef]
/home/peko/source/buildroot/output/build/ktap-v0.3/interpreter/ktap.c:33:2: error: #error "Please enable CONFIG_EVENT_TRACING before compile ktap"
/home/peko/source/buildroot/output/build/ktap-v0.3/interpreter/ktap.c:36:6: warning: "CONFIG_PERF_EVENTS" is not defined [-Wundef]
/home/peko/source/buildroot/output/build/ktap-v0.3/interpreter/ktap.c:37:2: error: #error "Please enable CONFIG_PERF_EVENTS before compile ktap"
make[3]: *** [/home/peko/source/buildroot/output/build/ktap-v0.3/interpreter/ktap.o] Error 1

It would be good if we could automatically enable the needed kernel
features when ktap is enabled, similar to how we do for E.G. devtmpfs.

But that can be done as a followup patch, so committed - Thanks.

-- 
Bye, Peter Korsgaard
