From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 09:25:31 +0100
Subject: [Buildroot] [PATCH v3 2/5] support/testing: add core tests
In-Reply-To: <CAAXf6LV-OfyZsEoX0Ja8KndLoA5MM=OyuwMTAvi9ptUP1SvzXQ@mail.gmail.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LV-OfyZsEoX0Ja8KndLoA5MM=OyuwMTAvi9ptUP1SvzXQ@mail.gmail.com>
Message-ID: <20170322092531.2b299231@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 09:17:59 +0100, Thomas De Schampheleire wrote:

> Two minor comments:
> 
> I think it would be cleaner to move support files for tests, like the
> post-build.sh and post-image.sh and rootfs-overlays, to a subdirectory
> instead of in the same location as the tests.

Can you suggest a name for this subdirectory ? :-)

> Also, I would argue that the rootfs-overlays do not need to be real
> files in git but can be generated on the fly during the test.

I tried to do that, but:

 1. It complicates quite a bit the test scenario.

 2. There are plenty of other test cases where we will really need some
    data that cannot be generated: a set of patches to test if patches
    on packages are properly applied, a set of dummy BR2_EXTERNAL
    trees, etc. So we will anyway have some "supporting" artifacts in
    the tree, and therefore I thought it wasn't worth the effort making
    this test more complicated.

Yann did the exact same comment while reviewing the previous version,
so I tried generating the files automatically, and went through this
reasoning before giving up and keeping things as they are.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
