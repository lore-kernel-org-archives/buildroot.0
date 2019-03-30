From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 31 Mar 2019 01:09:33 +0200
Subject: [Buildroot] [ros-users] Cross Compiling ROS
In-Reply-To: <20190307135403.GA30127@lwo1-lhp-f71841>
References: <CAK4g5cgQjVq3C8cubghPvumWsHeO54MZvx68GiZrJCFU3TpT0A@mail.gmail.com>
 <20190307135403.GA30127@lwo1-lhp-f71841>
Message-ID: <CAMw6YJKOSQFLQLt8oaKa8LoRWezrHOci86Vxv8VsrnoAb7TDVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mina,

On Thu, Mar 7, 2019 at 3:54 PM Vadym Kochan <vadim4j@gmail.com> wrote:
>
> Hi Mina,
>
> On Wed, Mar 06, 2019 at 04:28:09PM +0200, mina magdy wrote:
> > Hello everyone. My name is Mina and I am working on a project that needs to
> > cross compiler ROS with buildroot on RPi3 target but I faced many problems
> > in the dependencies of ROS. So any one can guide me to build ROS whit a
> > compatible version with buildroot. I hope to build an image that will be
> > used in buildroot open source community.
>
> I found looked at ros on github:
>
>     https://github.com/ros
>
> and there are a lot of packages for ROS, BUT it looks like there is catkin
> (https://github.com/ros/catkin) which actually (as I understood) does
> build, install, and dependency-handling for these packages (it look like
> a cmake + pythton set of tools/macroses). So the first task I think
> should be to add catkin as yet-another package manager (for example like
> buildroot/package/pkg-waf.mk) into Buildroot, and after you can add
> other minimal set of ROS-packages to build ROS image by Buildroot.
>
> Regards,
> Vadim Kochan

On github I found br2-external tree project which contains ros
packages for Buildroot:

    https://github.com/flatmax/NanoPi.Neo4.buildroot.external
    https://github.com/flatmax/NanoPi.Neo4.buildroot.external/tree/master/package/rockchip/ros

the catkin is already converted as Buidroot package infrastructure
which is used by ros-related
packages.

May be it will help you. I did not test it.

Regards,
Vadim Kochan
