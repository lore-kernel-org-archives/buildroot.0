From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 15:26:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: fix static linking with
	alsa
In-Reply-To: <20170606145122.0b36d3cb@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 6 Jun 2017 14:51:22 +0200")
References: <20170601203930.1069-1-bernd.kuhls@t-online.de>
 <20170601203930.1069-2-bernd.kuhls@t-online.de>
 <20170605144812.36b6f0e3@free-electrons.com>
 <871sqxe1xb.fsf@dell.be.48ers.dk>
 <20170606145122.0b36d3cb@free-electrons.com>
Message-ID: <87wp8pcknl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Calling it bogus is imho a bit harsh, but yeah - Getting it fixed
 >> upstream so it works without seq would be nicer.

 > I think it's bogus because the root of the problem is in alsa-lib, but
 > the proposed fix requires to touch potentially all users of alsa-lib.

 > So even if we decide not to patch alsa-lib, the proper fix would have
 > been:

 > config BR2_PACKAGE_ALSA_LIB_RAWMIDI
 >         bool "rawmidi"
 > +	BR2_PACKAGE_ALSA_LIB_SEQ
 >         default y

 > Because right now, the library produced by alsa-lib is broken, and this
 > is worked around in packages using alsa-lib rather than alsa-lib itself.

True. Will you fix it or do you want me to send a patch?

-- 
Bye, Peter Korsgaard
