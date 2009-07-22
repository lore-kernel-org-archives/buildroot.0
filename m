From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Jul 2009 15:02:54 +0000 (UTC)
Subject: [Buildroot] [Bug 387] Tremor not installed to toolchain
In-Reply-To: <bug-387-163@https.bugs.busybox.net/>
References: <bug-387-163@https.bugs.busybox.net/>
Message-ID: <20090722150254.25432777E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=387





--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-22 15:02:53 UTC ---
(In reply to comment #4)
> I am sorry, but it is not fixed:

Ahh, sorry - I didn't explicitly enable libvorbis support when I did a test
compile of gst-plugin-base, so I missed that.

> gst-plugins-base tries to link against libvorbisenc.so and as far as I can see
> this library is not provided by tremor.

No, tremor is only an implementation of the decoding API. We should either make
the stuff needing the encoding API depend on !BR2_PACKAGE_LIBVORBIS_TREMOR or
split up the libvorbis handling in encoding and decoding support, so you can
use the normal (FPU using) libvorbis stuff for encoding and tremor for decoding
(which I suspect is what you were doing before by luck as the tremor stuff was
listed below libvorbis so it was overwriting the FPU version of the lib).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
