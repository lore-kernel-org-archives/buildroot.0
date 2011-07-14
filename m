From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 09:32:38 +0200
Subject: [Buildroot] new package: orc
Message-ID: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's an updated patch-set that adds orc, the liboil runtime compiler.
This package replaces liboil functionality-wise, it's not a drop-in
replacement. Newer versions of gstreamer plug-ins require orc for
accelerated codepaths.

I've dropped some patches that added orc dependencies all over the
place. It should be sufficient to make gst-plugins-base depend on
orc (if it is selected). All other gst-plugins packages do already
depend on gst-plugins-base.
