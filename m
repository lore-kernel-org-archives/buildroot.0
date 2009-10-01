From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 01 Oct 2009 10:04:33 +0200
Subject: [Buildroot] how to clean up everything but the toolchain
Message-ID: <1254384273.5284.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we are using buildroot to build a number of projects for the same
platform. Currently we do this simply by changing the .config file. In
order for the build to work after changing the .config file, we remove
the project_build_arm, build_arm and toolchain_build_arm directories. So
basically we are doing a full rebuild, including the toolchain. We could
save a lot of CPU cycles if we could reuse the toolchain build. However
I found that if I remove the build_arm directory, but not the
toolchain_build_arm directory, things will break. So I wonder if there
is an easy solution to this. Perhaps a make target that we didn't
discover yet?


Sven
