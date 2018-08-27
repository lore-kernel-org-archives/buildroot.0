From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 11:36:32 +0200
Subject: [Buildroot] [PATCH v2] dropbear: Do not build static binary
In-Reply-To: <20180507122844.30867-1-stefan.sorensen@spectralink.com> ("Stefan
 =?utf-8?Q?S=C3=B8rensen=22's?= message of "Mon, 7 May 2018 14:28:43 +0200")
References: <20180507122844.30867-1-stefan.sorensen@spectralink.com>
Message-ID: <87wosc882n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan S?rensen <stefan.sorensen@spectralink.com> writes:

 > Dropbear 2018.76 now uses the --enable-static option to indicate that a static
 > binary should be built. This will incorrectly pick up the generic buildroot
 > option intended for building static libraries, causing an unwanted static
 > binary build with BR2_SHARED_STATIC_LIBS.

 > Fix by appending an --disable-static configure flag, overriding the buildroot
 > default.

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > ---
 > Changes v1->v2:
 >  * Keep the --enable-static when BR2_STATIC_LIBS=y

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
