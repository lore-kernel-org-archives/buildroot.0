From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Tue, 25 Jul 2017 15:29:29 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: disable libraries build if
	no fork() support
Message-ID: <1500989370-5353-1-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some no-MMU platforms have shared libraries support
but no fork() support, which is required by libv4lconvert.
Fix this by disabling libv4l libraries build in case of
no fork() support.
This fix the build issue reported here:
http://lists.buildroot.org/pipermail/buildroot/2017-July/197571.html

Hugues Fruchet (1):
  package/libv4l: disable libraries build if no fork() support

 ...c-disable-libv4l-build-if-no-fork-support.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/libv4l/0010-configure.ac-disable-libv4l-build-if-no-fork-support.patch

-- 
1.9.1
