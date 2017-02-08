From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 10:01:19 +0100
Subject: [Buildroot] Interaction between SITE_METHOD=LOCAL and .patch
 files
In-Reply-To: <o7cvgb$209$1@blaine.gmane.org>
References: <o7araj$clq$1@blaine.gmane.org>
 <0a532bbd-e625-a41e-ece3-6974bd63d4a2@mind.be>
 <o7cvgb$209$1@blaine.gmane.org>
Message-ID: <20170208100119.6b551420@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Feb 2017 17:18:04 +0000 (UTC), Grant Edwards wrote:

> Can SITE_METHOD = local be used with a custom tarball?

No. Arnout got it wrong here. You've got the following choices:

 <pkg>_SITE_METHOD = local
 <pkg>_SITE = /path/to/directory

*OR*

 <pkg>_SITE_METHOD = file
 <pkg>_SITE = /path/to/local/tarball.tar.gz

So the "local" site method points to a directory, and patches are *NOT*
applied. The "file" site method points to a local tarball, and patches
*ARE* applied.

> My understanding from the docs is that it requires an unpacked source
> directory tree [in which, as you said, one can easily apply whatever
> patches are required].

Your understanding is correct.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
