From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Wed, 18 Oct 2017 16:03:03 +0200
Subject: [Buildroot] [PATCH 0/1] Build samba4 for a target that also needs
	Python3
Message-ID: <20171018140304.19737-1-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is necessary to build samba for a target that also needs
Python 3. The python 3 installation overwrites the symbolic links for
the python target and staging directories.  The samba4 waf build tool
cannot yet cope with python3.

This patch is meant as a starting point for discussion as I am not
sure whether this is the Right Way to do this.  Hacking the waf script
itself is rather ugly, I have not found a way to make env pick up any
other hint to evaluate it as a python2 script.  Same goes for the
MAKE_ENV manipulation.

Suggestions welcome as always.

King regards,

Christian



Christian Kellermann (1):
  samba4: Make python2 dependency for waf explicit

 ...ake-python-2.7-dependency-in-waf-explicit.patch | 27 ++++++++++++++++++++++
 package/samba4/samba4.mk                           |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 package/samba4/0002-Make-python-2.7-dependency-in-waf-explicit.patch

-- 
2.12.1
