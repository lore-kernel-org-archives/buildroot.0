From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 15:15:10 +0200
Subject: [Buildroot] [PATCH v3] package/python-sip: bump to version
 4.19.13
In-Reply-To: <20190909064640.16289-1-ymdatta.work@gmail.com>
References: <20190909064640.16289-1-ymdatta.work@gmail.com>
Message-ID: <20190921151510.374ab556@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Sep 2019 12:16:39 +0530
Mohana Datta Yelugoti <ymdatta.work@gmail.com> wrote:

> Signed-off-by: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
> ---

I am sorry, but I had to revert this patch. There is a bug in the
python-sip build system since the version bump, which causes it to copy
the entire root filesystem of the build machine into
$(STAGING_DIR)/usr/lib/python2.7/. It causes the build to fail such as
in
http://autobuild.buildroot.net/results/a9c/a9cbeceb259b9ea4347155a224797aaa84b470ef/build-end.log,
or simply it fills up the entire disk space of the build machine, which
prevents the autobuilder from doing its work.

I didn't investigate why it was failing, but I can easily reproduce the
problem on my build machine, and reverting to the previous version of
python-sip avoids the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
