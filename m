From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:19:22 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static linking
 failure due to lack of deps
In-Reply-To: <20190408154311.127351-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Mon, 8 Apr 2019 17:43:11 +0200")
References: <20190408110431.734b346b@windsurf>
 <20190408154311.127351-1-giulio.benetti@micronovasrl.com>
Message-ID: <874l70gu91.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > When static linking some dependency library can be missing(i.e. -latomic
 > for -lcrypto) on linking libraries list. This is because when static
 > linking libraries dependencies are not transparently linked into binary.

 > To avoid moving libraries before/after one another or add new ones
 > that are not needed at all in some linking case use `pkg-config --libs
 > LIBRARY` where LIBRARY is the library we "probe" for its existence and
 > dependency.
 > So:
 > - Remove 0005-fix-static-link-zlib.patch where -lcrypto and -lz were
 > swapped
 > - Replace it with 0005-Use-pkgconf-to-get-libs-deps.patch where -lcrypto
 > has been substituted with `pkg-config --libs libcrypto`
 > - Add host-pkgconf to ANDROID_TOOLS_DEPENDENCIES

 > Fixes:
 > http://autobuild.buildroot.net/results/d3d/d3d6679cfc8afe4467368bd3d31483172c1032de/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
