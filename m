From: Vadym Kochan <vadim4j@gmail.com>
Date: Thu, 7 Mar 2019 15:54:03 +0200
Subject: [Buildroot] [ros-users] Cross Compiling ROS
In-Reply-To: <CAK4g5cgQjVq3C8cubghPvumWsHeO54MZvx68GiZrJCFU3TpT0A@mail.gmail.com>
References: <CAK4g5cgQjVq3C8cubghPvumWsHeO54MZvx68GiZrJCFU3TpT0A@mail.gmail.com>
Message-ID: <20190307135403.GA30127@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mina,

On Wed, Mar 06, 2019 at 04:28:09PM +0200, mina magdy wrote:
> Hello everyone. My name is Mina and I am working on a project that needs to
> cross compiler ROS with buildroot on RPi3 target but I faced many problems
> in the dependencies of ROS. So any one can guide me to build ROS whit a
> compatible version with buildroot. I hope to build an image that will be
> used in buildroot open source community.

I found looked at ros on github:

    https://github.com/ros

and there are a lot of packages for ROS, BUT it looks like there is catkin
(https://github.com/ros/catkin) which actually (as I understood) does
build, install, and dependency-handling for these packages (it look like
a cmake + pythton set of tools/macroses). So the first task I think
should be to add catkin as yet-another package manager (for example like
buildroot/package/pkg-waf.mk) into Buildroot, and after you can add
other minimal set of ROS-packages to build ROS image by Buildroot.

Regards,
Vadim Kochan
