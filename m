From: Mike Davies <busybox_mail@rovoreed.com>
Date: Sat, 22 Oct 2011 14:01:34 +0000
Subject: [Buildroot] [PATCH v4] package: add opencv
In-Reply-To: <1319130558-16555-1-git-send-email-s.martin49@gmail.com>
References: <1319130558-16555-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1319292094.2998.6.camel@ceri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have tried your previous version (V3) and have a comment.

It seems to put over 32Mb into the target, that I think doesn't need to
be there, i.e.

[mike at ceri buildroot-2011.08]$ du -ch output/target/usr/share/opencv
56K	output/target/usr/share/opencv/lbpcascades
19M	output/target/usr/share/opencv/haarcascades
504K	output/target/usr/share/opencv/doc/vidsurv
14M	output/target/usr/share/opencv/doc
32M	output/target/usr/share/opencv
32M	total
[mike at ceri buildroot-2011.08]$ 

Certainly I don't want any documentation on my target system, and
there's 14Mb of that.

I built the system with just opencv selected, and nothing in the opencv
sub-menu selected.

Mike
