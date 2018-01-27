From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 10:54:54 +0100
Subject: [Buildroot] [PATCH] swupdate: add upstream patch to fix build
 error
In-Reply-To: <20180124220029.30284-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 24 Jan 2018 23:00:29 +0100")
References: <20180124220029.30284-1-joerg.krause@embedded.rocks>
Message-ID: <87y3kjhbip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > When building SWUpdate with the following defconfig:
 > ```
 > CONFIG_DOWNLOAD=y
 > ```

 > .. the build process breaks with:

 > ```
 > corelib/channel_curl.c:27:10: fatal error: json-c/json.h: No such file or directory
 >  #include <json-c/json.h>
 > ```

 > Looking at the SWUpdate Kconfig based build system shows that `CONFIG_DOWNLOAD`
 > depends on `HAVE_LIBCURL`, which selects CURL, which eventually enables the
 > (unnecessary) build of channel_curl.o.

 > The upstream fixes the condition for building channel_curl.o by adding a new
 > hidden config option `CHANNEL_CURL`, which is only selected by the
 > dependent options.

 > Backported from:
 > https://github.com/sbabic/swupdate/commit/37a6666a532e9cbc42b56301f27919ae7c00d2eb

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
