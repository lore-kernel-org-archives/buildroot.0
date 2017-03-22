From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:57:44 +0100
Subject: [Buildroot] [PATCH] git: fix build with with no threads
In-Reply-To: <1490140604-28596-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490140604-28596-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170322225744.0f905a5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 05:26:44 +0530, Rahul Bedarkar wrote:
> When building git with toolchain that don't have thread support, we
> get following build errors:
> 
>       CC builtin/hash-object.o
>   builtin/grep.c: In function 'grep_submodule_launch':
>   builtin/grep.c:596:34: error: dereferencing pointer to incomplete type 'struct work_item'
>     status = capture_command(&cp, &w->out, 0);
>                                     ^
>   builtin/grep.c: In function 'grep_submodule':
>   builtin/grep.c:644:20: error: storage size of 'w' isn't known
>      struct work_item w;
>                       ^
>   make[2]: *** [builtin/grep.o] Error 1
>   make[2]: *** Waiting for unfinished jobs....
> 
> Add two upstream patches to fix this issue.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/94b/94bce9a99a5ce9894a6918774ab75e23d12c1394/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  .../git/0001-grep-set-default-output-method.patch  | 59 +++++++++++++++
>  ...ep-fix-builds-with-with-no-thread-support.patch | 87 ++++++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 package/git/0001-grep-set-default-output-method.patch
>  create mode 100644 package/git/0002-grep-fix-builds-with-with-no-thread-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
