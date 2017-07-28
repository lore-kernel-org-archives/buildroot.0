From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Fri, 28 Jul 2017 13:01:46 +0200
Subject: [Buildroot] [PATCH v3] package/libv4l: no libv4lconvert helper
	support if no fork()
Message-ID: <1501239707-18765-1-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build libv4lconvert helper support only when fork() is available.

Fixes [1]:
    CXXLD    v4l2-compliance
   .../build/libv4l-1.12.5/lib/libv4lconvert/.libs/libv4lconvert.so: undefined reference to `fork'
  collect2: error: ld returned 1 exit status
    
[1] http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe

---
Changes v2 -> v3:
  - revisit build error message as per Peter's comment
  - revisit patch suject as per Peter's comment
  - add Tested-by: Peter Seiderer <ps.report@gmx.net>

Changes v1 -> v2:
  - point to http://autobuild.buildroot.org build result
  - revisit Author & Signed-off-by


Hugues Fruchet (1):
  package/libv4l: no libv4lconvert helper support if no fork()

 ...lconvert-helper-support-only-when-fork-is.patch | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch

-- 
1.9.1
