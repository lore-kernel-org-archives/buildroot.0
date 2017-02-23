From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:08:11 +0100
Subject: [Buildroot] [PATCH] vlc: disable on ARC
In-Reply-To: <1487769010-17746-1-git-send-email-vzakhar@synopsys.com>
References: <1487769010-17746-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170223220811.62b41589@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 16:10:10 +0300, Vlad Zakharov wrote:
> This package fails when building for ARC due to ARC toolchain issue.
> 
> Marking this with special comment "# ARC toolchain issue" as the package
> is to be enabled as soon as issue with ARC toolchain is solved.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

I've applied to master, but before that I had to fix two things:

 - You forgot to indicate a reference to an autobuilder failure in the
   commit log. It's very useful to have such references, so that if in
   the future we wonder in what exact configuration it was failing to
   build, we can reproduce.

 - You forgot to propagate the dependency to the Config.in comment in
   package/vlc/Config.in.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
