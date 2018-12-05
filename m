From: David J. Fogle <Dave@exitstrategytech.com>
Date: Wed, 5 Dec 2018 22:03:31 +0000
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
Message-ID: <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have investigated further, and narrowed the issue down to the containerd, not the client. The containerd is being passed an invalid flag -metrics-interval, and is constantly looping through it's init process.

________________________________
From: buildroot <buildroot-bounces@busybox.net> on behalf of David J. Fogle <Dave@exitstrategytech.com>
Sent: Wednesday, December 5, 2018 11:31:29 AM
To: christian at paral.in
Cc: buildroot at busybox.net
Subject: [Buildroot] Docker client does not function correctly in 2018.11


Hello,


I am having a time getting Docker cli to work properly. When executed, as root or use, in busybox or bash, tty or SSH, the same result presents: a flashing cursor on the terminal. Is there somewhere that I can glean some info to debug with? Maybe a hint of where to look?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181205/42723344/attachment.html>
