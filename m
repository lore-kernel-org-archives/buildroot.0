From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 21:26:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-12-09
In-Reply-To: <CAAP7ucKJ53nK=8gAzes-GB-C24dVOD+U7cokhTpzMyVhZo=80Q@mail.gmail.com>
References: <20191210071814.D362187B3D@hemlock.osuosl.org>
 <CAJ4jsaceHWQxOBT=mCgLF1YFhp=BMjCJAs-Vnobs+=PSuAeFTw@mail.gmail.com>
 <CAAP7ucKJ53nK=8gAzes-GB-C24dVOD+U7cokhTpzMyVhZo=80Q@mail.gmail.com>
Message-ID: <20191210212632.5bd43e99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Dec 2019 20:47:29 +0100
Aleksander Morgado <aleksander@aleksander.es> wrote:

> Is there any way I can reproduce that build locally? Not sure how to
> exactly reproduce the build with the same toolchain and build options.

To reproduce builds:

 (1) Download the br-reproduce-build script at
     http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build

 (2) Run ./br-reproduce-build <hash of the build>

     The <hash of the build> is for example
     0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a in
     http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a

Otherwise, you can do that manually. In every build result directory,
such as
http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a,
you have a file called "gitid" that contains the Buildroot commit at
which the build was done, and a file called "config" that contains the
Buildroot configuration.

So essentially, what the br-reproduce-build script does is:

$ git checkout $(curl http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/gitid)
$ make clean
$ curl http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/config > .config
$ make

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
