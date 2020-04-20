From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 20 Apr 2020 23:52:25 +0200
Subject: [Buildroot] [PATCH v3 0/3] Adding the buildroot shell
Message-ID: <20200420215228.16175-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to simplify the usage af a buildroot sdk, this series
wants to add a buildroot shell. This shell will export all the
variables and settings needed to do crossompilation without
actually writing a buildroot package.
Is very useful in the development phase where the developer needs
to compile and check a software the most tight way.
It's similar in its working to the shell present on others build
systems.

Angelo Compagnucci (3):
  package/environment-setup: new package
  package/environment-setup: add configure alias
  package/environment-setup: add cmake alias

 docs/manual/using-buildroot-toolchain.txt     |  7 ++++
 package/Config.in                             |  1 +
 package/environment-setup/Config.in           |  6 ++++
 package/environment-setup/environment-setup   | 18 ++++++++++
 .../environment-setup/environment-setup.mk    | 34 +++++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 package/environment-setup/Config.in
 create mode 100644 package/environment-setup/environment-setup
 create mode 100644 package/environment-setup/environment-setup.mk

-- 
2.17.1
