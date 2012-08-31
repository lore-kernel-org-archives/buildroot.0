From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Fri, 31 Aug 2012 16:39:03 +0100
Subject: [Buildroot] boost 1.51.0 bz2 archive observations
Message-ID: <CAJkQPO=_T94Y854wErurMiwrQyZFbW7Mt9+9ak0xGDU0ahiEaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for the cross-posting, but I'm not sure where to put this.

There is a slight difference between the 1.51.0 and 1.50.0 boost bz2 files.

e.g.
\boost_1_50_0.tar.bz2\boost_1_50_0.tar\boost_1_50_0\
\boost_1_51_0.tar.bz2\boost_1_51_0.tar\.\boost_1_51_0\

I went looking for this because I updated the Boost version to 1.51.0
in Buildroot and it failed to find the bootstrap.sh file because it
wasn't in the expected directory.

e.g.
/opt/br/output/build$ find -name "bootstrap.sh"
./boost-1.51.0/boost_1_51_0/tools/build/v2/bootstrap.sh
./boost-1.51.0/boost_1_51_0/bootstrap.sh
./boost-1.50.0/tools/build/v2/bootstrap.sh
./boost-1.50.0/bootstrap.sh

Buildroot fails to find the boostrap.sh file and the build fails.

When I tried to untar it manually I got an error.

$ tar xjf boost_1_51_0.tar.bz2
tar: .: Cannot utime: Operation not permitted
tar: .: Cannot change mode to rwxr-xr-t: Operation not permitted
tar: Exiting with failure status due to previous errors

1.50.0 does not have this problem.

regards,

Aras Vaichas
