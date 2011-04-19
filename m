From: John Smith <jf15190@yahoo.com>
Date: Tue, 19 Apr 2011 01:02:30 +0100 (BST)
Subject: [Buildroot] creating skeleton during build
Message-ID: <264265.10486.qm@web132205.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,
I am using the old gcc3_legacy to build compatible firmwares for an old router.
(I can't use a later one as I am pinned down by closed source binaries.)
Rather than having a fixed root skeleton, I am unpacking an original firmware.
In order to invoke the unpack I have the following line in custom.mk (with all my other custom bits) in my board directory:-
$(TARGET_DIR): $(TARGET_SKELETON)
All goes well until I do a second build, the system tries to re-make the root skeleton even though it already exists and is older than $(TARGET_DIR) so I have to comment out the above line for the second build. Any way to avoid this?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110419/89140754/attachment.html>
