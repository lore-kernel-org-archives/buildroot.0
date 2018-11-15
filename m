From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Nov 2018 15:37:10 +0100
Subject: [Buildroot] [PATCH next v4 0/6] Per-package host/target
 directory support
In-Reply-To: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181115153710.70c26880@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Nov 2018 11:55:51 +0100, Thomas Petazzoni wrote:

> Here is a fourth iteration of the per-package SDK and target directory
> implementation.

FYI, I did a test build of some given configuration (randomly chosen),
in the following situations, which provided the following results

 - Per-package folder support disabled

real    5m11.261s
user    8m58.011s
sys     1m54.650s

 - Per-package folder support enabled, sequential build

real    5m15.744s
user    9m4.848s
sys     1m55.885s

 - Per-package folder support enabled, parallel build

real    4m17.059s
user    9m55.024s
sys     2m2.344s

So, there is a small performance hit in doing all the rsyncs needed for
per-package folders: 4.5 seconds on a build of ~5 minutes.

However, this performance hit is largely compensated by the parallelism
of the build. It is worth mentioning that this specific configuration
only lead to a small amount of parallelism, as can be seen in the
attached PDF files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: no-parallel.pdf
Type: application/pdf
Size: 17122 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181115/57d59566/attachment.pdf>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: parallel.pdf
Type: application/pdf
Size: 16636 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181115/57d59566/attachment-0001.pdf>
