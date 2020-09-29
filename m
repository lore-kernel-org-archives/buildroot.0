From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 21:03:11 +0200
Subject: [Buildroot] [PATCH v2] package/live555: bump to version
 2020.08.19
In-Reply-To: <20200922214315.6c1407bb@windsurf> (Thomas Petazzoni's message of
 "Tue, 22 Sep 2020 21:43:15 +0200")
References: <20200921083257.3130-1-buildroot@heine.tech>
 <20200922214315.6c1407bb@windsurf>
Message-ID: <87lfgsv21c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 21 Sep 2020 10:32:57 +0200
 > Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

 >> According to changelog this version fixes memory leaks and buffer overflows.
 >> - http://live555.com/liveMedia/public/changelog.txt
 >> 
 >> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 >> ---
 >> package/live555/live555.hash | 4 ++--
 >> package/live555/live555.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

 > Applied to master, thanks.

Committed to 2020.08.x, thanks.

This notice in the changelog isn't very nice though :/

2020.08.09:
- Changed the parameter signature of the "RawVideoRTPSink" constructor and "createNew()"
  functions so that the "width" parameter comes before the "height" parameter.  This order
  - "width", "height" - is more common, and is the order used when these parameters are
  defined in RFC 4175.
  IMPORTANT NOTE: Because the types of these two parameters are the same, existing application
  code that uses "RawVideoRTPSink" will compile without error; however, it will not work
  properly unless the order of the parameters in the call to "RawVideoRTPSink::createNew()"
  is changed.
 
-- 
Bye, Peter Korsgaard
