From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:50:55 +0200
Subject: [Buildroot] [PATCHv2] pptp-linux: bump to version 1.8.0
In-Reply-To: <1396300329-12942-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396300329-12942-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140404235055.39b4ce52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 31 Mar 2014 18:12:09 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../pptp-linux/pptp-linux-001-susv3-legacy.patch   | 43 +++++++++++----------
>  .../pptp-linux/pptp-linux-002-drop-stropts.patch   | 26 -------------
>  ...tch => pptp-linux-002-fix-parallel-build.patch} |  0
>  package/pptp-linux/pptp-linux-003-ip-path.patch    | 44 ----------------------
>  package/pptp-linux/pptp-linux.mk                   |  5 ++-
>  5 files changed, 27 insertions(+), 91 deletions(-)
>  delete mode 100644 package/pptp-linux/pptp-linux-002-drop-stropts.patch
>  rename package/pptp-linux/{pptp-linux-004-fix-parallel-build.patch => pptp-linux-002-fix-parallel-build.patch} (100%)
>  delete mode 100644 package/pptp-linux/pptp-linux-003-ip-path.patch

Seems to break the build on ARM:

  http://autobuild.buildroot.org/results/5bd/5bdfcf544a83e18d12e27c598084c0ad520d6164/build-end.log

{standard input}: Assembler messages:
{standard input}:225: Error: bad instruction `rorw $8,'
{standard input}:225: Error: bad instruction `rorl $16,r2'
{standard input}:225: Error: bad instruction `rorw $8,'

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
