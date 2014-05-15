From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 May 2014 19:15:45 +0400
Subject: [Buildroot] [PATCH 1/2] gdb: replace xtensa patches with proper
 backports from binutils-gdb
In-Reply-To: <1400164410-13037-2-git-send-email-jcmvbkbc@gmail.com>
References: <1400164410-13037-1-git-send-email-jcmvbkbc@gmail.com>
 <1400164410-13037-2-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <CAMo8BfLzYVSoghWby=a35rjdkqR4bY3sbCgQFnjUPB2XhBhw_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 15, 2014 at 6:33 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> The functionality is unchanged.

[...]

> --- a/package/gdb/7.4.1/xtensa-gdb-regsize.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> ---- gdb-7.4.1/gdb/xtensa-tdep.h.orig   2012-10-30 11:40:23.546448594 -0700
> -+++ gdb-7.4.1/gdb/xtensa-tdep.h        2012-10-30 11:41:43.078445337 -0700
> -@@ -17,6 +17,7 @@
> -    You should have received a copy of the GNU General Public License
> -    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
> -
> -+#include <stdint.h>

Oops, the backported version doesn't have this include and fails to build
due to missing uint32_t definition ): I'll send fixed v2.

> -
> - /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
> -    whenever the "tdep" structure changes in an incompatible way.  */
> -@@ -84,7 +85,7 @@
> - /* Xtensa ELF core file register set representation ('.reg' section).
> -    Copied from target-side ELF header <xtensa/elf.h>.  */
> -
> --typedef unsigned long xtensa_elf_greg_t;
> -+typedef uint32_t xtensa_elf_greg_t;
> -
> - typedef struct
> - {

-- 
Thanks.
-- Max
