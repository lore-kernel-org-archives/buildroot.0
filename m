From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 12:40:46 +0200
Subject: [Buildroot] [PATCH] freetype: drop calling autogen,
 no longer needed
In-Reply-To: <20181011171324.22c3ec20@windsurf> (Thomas Petazzoni's message of
 "Thu, 11 Oct 2018 17:13:24 +0200")
References: <20181003134001.23537-1-thomas.petazzoni@bootlin.com>
 <20181011171324.22c3ec20@windsurf>
Message-ID: <87h8hbd3v5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Wed,  3 Oct 2018 15:40:01 +0200, Thomas Petazzoni wrote:
 >> In commit a31a66802a7a1af76a629b0ba7120424ed547646 ("freetype:
 >> security bump to version 2.5.3"), the freetype package was changed to
 >> call ./autogen.sh to regenerate the autotools stuff, because the
 >> ltmain.sh provided by upstream freetype was not compatible with
 >> Buildroot libtool-patching logic.
 >> 
 >> Since then, freetype has been bumped several times, and the current
 >> version packaged in Buildroot has an ltmain.sh that is compatible with
 >> our libtool-patching logic.
 >> 
 >> Therefore, this commit drops the no longer needed autogen stuff.
 >> 
 >> This autogen stuff was badly breaking per-package host/target
 >> directory, because the autogen happened at the post-patch hook step,
 >> at which point the host-automake/host-autoconf/host-libtool
 >> dependencies have not yet been copied into this package host
 >> directory.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> ---
 >> package/freetype/freetype.mk | 18 ------------------
 >> 1 file changed, 18 deletions(-)

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
