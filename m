From: Paassen, Hiram van <Hiram.van.Paassen@mastervolt.com>
Date: Tue, 30 Sep 2014 08:02:34 +0000
Subject: [Buildroot] Reducing buildroot compile times by reusing toolchain?
Message-ID: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We are using buildroot to build two images for the same target platform. We noticed that most of the build time is in building the host tools. I'd like to reduce our build time and noticed the option to use an external toolchain.  However that comes with a lot of options which I did not have the time yet to explore. However that led me to some feature requests for buildroot:

Would it be possible to add an option to the external toolchain menu to use a buildroot toolchain as external toolchain? This is probably possible right now but then I have to know exactly what to fill in. I imagine that buildroot would be able to infer all those options from another buildroot installation/out-of-tree-build.
I can imagine that such an option would simplify the reuse of the toolchain for our other build.

Secondly, we run "make clean" often since buildroot cannot automatically remove stuff from the target directory however running "make clean" also removes the toolchain. would it be possible to make a "make clean-target" that would delete the target and possible the staging directory and would rebuild everything except the host/toolchain stuff. Or did I miss something and is such a target already possible?

I can imagine that I can simulate the last feature by making an build using a minimal image and then reusing the toolchain from that build for my actual image. So when i run make clean for my actual image, only the target stuff needs to get rebuild.

I would implement  this myself when I have the time but i'm not really comfortable enough in the innards of buildroot to do this yet

Best regards,

Hiram van Paassen

________________________________

Power Products, LLC Email Notice

This message is intended only for the use of the Addressee and may contain information that is PRIVILEGED and/or CONFIDENTIAL.
This email is intended only for the personal and confidential use of the recipient(s) named above. If the reader of this email is not an intended recipient, you have received this email in error and any review, dissemination, distribution or copying is strictly prohibited.
If you have received this email in error, please notify the sender immediately by return mail and permanently delete the copy you received.

Thank you.
