From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Mar 2012 08:53:30 +0100
Subject: [Buildroot] [PATCH 11/13] cmake: move creation of toolchain
 file to package/pkg-cmaketargets.mk
In-Reply-To: <CAAXf6LW88QiWEWG5qSTQ7Uvh_5hM1r7kQaXQ6Fs7uyimCPCP+Q@mail.gmail.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <e165f3e7d58343c33b295e78c7ec60b0f6bbb839.1331148806.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LW88QiWEWG5qSTQ7Uvh_5hM1r7kQaXQ6Fs7uyimCPCP+Q@mail.gmail.com>
Message-ID: <20120309085330.7c5f901b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 9 Mar 2012 07:54:32 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Currently, BASE_TARGETS is still:
> $(BASE_TARGETS): dirs
> $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
> 
> Now that the recipe for toolchainfile.cmake has moved, I find it a bit
> strange that the 'magic' path to this file still appears here.
> What about creating a nicer name and using that in BASE_TARGETS, and
> let the pkg-cmaketargets.mk file resolve the nice name into the actual
> path?

Something like:

CMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake

in pkg-cmaketargets.mk

and then in the main Makefile:

$(BASE_TARGETS): dirs $(CMAKE_TOOLCHAIN_FILE)

Is this what you're suggesting?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
