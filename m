From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 08:02:03 -0700
Subject: [Buildroot] [PATCH 0/3] Support for the Freescale frame manager
	utility.
Message-ID: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fmc package builds the actual command line tool.  With the fmlib
package used for common functions/headers and the tclap package
used to aid parsing of command line arguments.

The initial version was selected as the latest stable FSL SDK release (v1.5).

The fmc tool does add a configuration folder (/etc/fmc/) but makes an assumption
that any configuration files are user provided as they change based on platform
use cases.

Matt Weber (3):
  fmlib: new package
  tclap: new package
  fmc: new package

 package/Config.in       |    3 +++
 package/fmc/Config.in   |   14 ++++++++++++++
 package/fmc/fmc.mk      |   32 ++++++++++++++++++++++++++++++++
 package/fmlib/Config.in |    9 +++++++++
 package/fmlib/fmlib.mk  |   34 ++++++++++++++++++++++++++++++++++
 package/tclap/Config.in |   12 ++++++++++++
 package/tclap/tclap.mk  |   16 ++++++++++++++++
 7 files changed, 120 insertions(+)
 create mode 100644 package/fmc/Config.in
 create mode 100644 package/fmc/fmc.mk
 create mode 100644 package/fmlib/Config.in
 create mode 100644 package/fmlib/fmlib.mk
 create mode 100644 package/tclap/Config.in
 create mode 100644 package/tclap/tclap.mk

-- 
1.7.9.5
