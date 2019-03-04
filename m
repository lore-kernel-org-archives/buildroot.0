From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 22:36:33 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/libsoxr: add avutil to
 soxr.pc"
In-Reply-To: <20190222010714.22028-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Fri, 22 Feb 2019 02:07:13 +0100")
References: <20190222010714.22028-1-joerg.krause@embedded.rocks>
Message-ID: <87wolegw4e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > This reverts commit d81870ae8129389a62df80c9c8c9165d334b6921.
 > The patch attempts to fix static linking with libsoxr when it build with
 > avutils. The `Libs.private` field should not contain the full absolute path to
 > the static library, but only the link flags for private libraries, e.g
 > `-lm`.

 > Buildroots pkg-config prepends the sysroot to the value found in `Libs.private`
 > resulting in a malformed linker flag if libavutil is found:

 > ```
 > -L/home/test/autobuild/run/instance-3/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
 > -lsoxr
 > /home/test/autobuild/run/instance-3/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/home/test/autobuild/run/instance-3/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libavutil.a
 > ```

 > .. or if libavutils is not found:

 > ```
 > -L/home/test/autobuild/run/instance-1/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
 > -lsoxr AVUTIL_LIBRARIES-NOTFOUND
 > ```

 > Revert this commit and replace the patch by a follow-up patch which only
 > adds `-lavutil` to `Libs.private` in case it is found and used by
 > libsoxr.

 > Fixes:
 > http://autobuild.buildroot.net/results/6eb4e2c9bd3884ab0152ddf873c20e62f0941181/
 > http://autobuild.buildroot.net/results/07207b0a58a08bf7c2cb78345a58244b5e6aab0e/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
