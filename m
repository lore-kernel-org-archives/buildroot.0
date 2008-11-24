From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 25 Nov 2008 10:13:53 +1100
Subject: [Buildroot] Buildroot does not generates target image.
In-Reply-To: <402224706.1227514889.172836360.21697@mcgi41.rambler.ru>
References: <402224706.1227514889.172836360.21697@mcgi41.rambler.ru>
Message-ID: <20081124231353.GA21426@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PLEASE, stop posting about this several times per day. It won't help us
to help you any quicker.

On Mon, Nov 24, 2008 at 11:21:29AM +0300, ?????? ?????? wrote:
> So I have the following question:
> 
> 1) .../buildroot/project_build_mipsel/uclibc/root - is it the root 
> folder for target JFFS2 image ?

Yes

> 2) Could I invoke this command "mkfs.jffs2 -d 
> .../buildroot/project_build_mipsel/uclibc/root -o MY_IMAGE_NAME 
> --little-endian" to produce target JFFS2 image by hand?

Yes

> 3) If I goto 4.1 item and set produce target JFFS2 image flag then I get 
> an error after Linux compiles: "No rule to make 'mtd-host'".
> What does this error means? How to force BUILDROOT to produce target 
> image (like JFFS2) ??

I think it's a bug in buildroot. Unless you have selected one of the MTD
package versions to go into your build, it doesn't have a rule to build
mtd-host, which provides mkfs.jffs2.

A simple workaround is to go into the package selection and enabled MTD
(under hardware packages).


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
