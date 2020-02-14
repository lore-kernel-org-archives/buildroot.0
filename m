From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2020 08:27:01 +0100
Subject: [Buildroot] [PATCH] package/screen: bump version to 4.8.0
Message-ID: <20200214072701.26574-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a memory corruption issue in OSC 49 handling.  Notice that this is
only enabled if screen is built with --enable-rxvt_osc, which isn't the case
in Buildroot. From the release notes:

As last fix, fixes potential memory overwrite of quite big size (~768
bytes), and even though I'm not sure about potential exploitability of
that issue, I highly recommend everyone to upgrade as soon as possible.
This issue is present at least since v.4.2.0 (haven't checked earlier).

https://lists.gnu.org/archive/html/screen-devel/2020-02/msg00007.html

Upstream changed the gnu.org URLs to use HTTPS, so adjust
0005-rename-sched_h.patch to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/screen/0005-rename-sched_h.patch | 4 ++--
 package/screen/screen.hash               | 4 ++--
 package/screen/screen.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/screen/0005-rename-sched_h.patch b/package/screen/0005-rename-sched_h.patch
index cdbb0335f9..9b29b76e07 100644
--- a/package/screen/0005-rename-sched_h.patch
+++ b/package/screen/0005-rename-sched_h.patch
@@ -44,7 +44,7 @@ index 0000000..fdc3fc4
 + *
 + * You should have received a copy of the GNU General Public License
 + * along with this program (see the file COPYING); if not, see
-+ * http://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
++ * https://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
 + * 51 Franklin Street, Fifth Floor, Boston, MA  02111-1301  USA
 + *
 + ****************************************************************
@@ -98,7 +98,7 @@ index fdc3fc4..0000000
 - *
 - * You should have received a copy of the GNU General Public License
 - * along with this program (see the file COPYING); if not, see
-- * http://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
+- * https://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
 - * 51 Franklin Street, Fifth Floor, Boston, MA  02111-1301  USA
 - *
 - ****************************************************************
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index b09ac34700..ca74ba8913 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-4.7.0.tar.gz.sig
-sha256 da775328fa783bd2a787d722014dbd99c6093effc11f337827604c2efc5d20c1  screen-4.7.0.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-4.8.0.tar.gz.sig
+sha256 6e11b13d8489925fde25dfb0935bf6ed71f9eb47eff233a181e078fde5655aa1  screen-4.8.0.tar.gz
 # Locally calculated
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 91aa7c3a7a..055dc015c0 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.7.0
+SCREEN_VERSION = 4.8.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
-- 
2.20.1
