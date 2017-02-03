From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  3 Feb 2017 21:57:41 +0100
Subject: [Buildroot] [PATCH 0/3] graph-depends: split off some functions to
	pkgutil.py
Message-ID: <20170203205745.14488-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The main goal of this patch set is to extract get_version and get_depends from
graph-depends into a separate file pkgutil.py, for reuse by other scripts.

The script I need it for is not really upstreamable (opkg generation for some
packages), but I think the changes I'm submitting here could be useful in other
cases too.

Thomas De Schampheleire (3):
  graph-depends: avoid use of global var 'rule' in get_depends
  graph-depends: split off get_version/get_depends into pkgutil.py
  graph-depends: split off get_rdepends from get_depends

 support/scripts/graph-depends | 59 ++++-----------------------------------
 support/scripts/pkgutil.py    | 64 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 53 deletions(-)
 create mode 100644 support/scripts/pkgutil.py

-- 
2.10.2
