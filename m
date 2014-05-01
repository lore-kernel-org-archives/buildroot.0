From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 01 May 2014 20:35:00 +0200
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <1398968712814-68658.post@n4.nabble.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
 <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
 <1396897179003-67022.post@n4.nabble.com>
 <CAAXf6LUM+sLYvcGFEBEaXXfpHRDVaED1W1cM87pg3De6ynLWTw@mail.gmail.com>
 <1398968712814-68658.post@n4.nabble.com>
Message-ID: <3e06667e-ebb4-4571-9f34-dd559a37fb0e@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Brian,

(Please don't top post)

brianclements <brian@brianclements.net> schreef:
>Hi Thomas,
>I finally have an update for you. I was able to import your rootfs.tar into
>docker and use it to successfully pull that git repo without any issue. This
>is great! I've tested numerous times and it seems to be sticking that way.
>Now, to figure out what's different between your image and mine.

Good news!

> I suspect
>it's one of two things you did that made the difference:
>
>1) using ext2 in the image and specifying that disksize (less likely) or
>2) using an external toolchain (most likely)
>
>the ext2 option is no problem, I'll just include that in the config, but how
>do you specify and use an external toolchain? Where do I obtain the
>toolchain you used and compile using it?

In the menuconfig, in the toolchain menu, you can specify the toolchain type. It is set to 'Buildroot' by default, but you can specify 'external' here. I then used the default proposed toolchain (Sourcery)

Best regards,
Thomas
