From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 17:30:28 +0200
Subject: [Buildroot] OpenCV-Python Support
In-Reply-To: <1496323183.528769.995383584.4FE97B8B@webmail.messagingengine.com>
References: <1496323183.528769.995383584.4FE97B8B@webmail.messagingengine.com>
Message-ID: <20170608173028.609d4777@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 01 Jun 2017 06:19:43 -0700, Jimmy at 86Pixels wrote:

> I noticed that back in 2015 there was a patch submitted and signed off
> that added opencv_python as a build option for OpenCV 2.
> 
> I noticed that it was then reverted in this commit when OpenCV 2.4 was
> targeted.
> 
> https://github.com/buildroot/buildroot/commit/ac57d05076d7554d5bf43375cc7269fc0e658acc#diff-44c9b82a4a4d16aae921f9f88a95634b
> 
> To my knowledge, this should still work, was this simply a mistake, or
> am I missing something?  I'd love to add it back in as its a dependency
> of mine.

Config.in contains:

comment "opencv_python module requires numpy which is not yet available."

However, we now have python-numpy, so it should be possible to build
OpenCV python support.

Just test it, and submit a patch doing this! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
