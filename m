From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 23:42:26 +0200
Subject: [Buildroot] libav package
In-Reply-To: <1303330483.13254.27.camel@feynman.coloradoengineeringinc.com>
	(Michael J. Hammel's message of "Wed, 20 Apr 2011 14:14:43 -0600")
References: <1303330483.13254.27.camel@feynman.coloradoengineeringinc.com>
Message-ID: <877hag1ygt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael J Hammel <buildroot@graphics-muse.org> writes:

 Michael> I've created a libav package for 2011.02 based on the ffmpeg
 Michael> package. It builds okay but I haven't tested it with any apps
 Michael> yet (working toward an omapfbplay package). There is one
 Michael> question before submitting a patch for it.  To get it to build
 Michael> I had to add the following config option:

 Michael> --target-os=linux

 Michael> I tried setting this to 

 Michael> --target-os=$(GNU_TARGET_NAME)

 Michael> but that generates linux-os which libav doesn't like.  Is it
 Michael> okay to leave it hardcoded like this or is there a Buildroot
 Michael> variable I should be using here?

No, that seems ok, as we always build for Linux.

 Michael> One other question:  what's the correct command for creating the patch
 Michael> for this?  I'd want to pick up both the multimedia/Config.in change and
 Michael> the new directory therein.  I've created patches before but not for
 Michael> adding a new directory like this.

Create a git branch (git checkout -b <name>), git add / git commit and
then git format-patch -s master to create the patch.

-- 
Bye, Peter Korsgaard
