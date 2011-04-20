From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Wed, 20 Apr 2011 14:14:43 -0600
Subject: [Buildroot] libav package
Message-ID: <1303330483.13254.27.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've created a libav package for 2011.02 based on the ffmpeg package. It
builds okay but I haven't tested it with any apps yet (working toward an
omapfbplay package). There is one question before submitting a patch for
it.  To get it to build I had to add the following config option:

--target-os=linux

I tried setting this to 

--target-os=$(GNU_TARGET_NAME)

but that generates linux-os which libav doesn't like.  Is it okay to
leave it hardcoded like this or is there a Buildroot variable I should
be using here?

One other question:  what's the correct command for creating the patch
for this?  I'd want to pick up both the multimedia/Config.in change and
the new directory therein.  I've created patches before but not for
adding a new directory like this.

Thanks.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
