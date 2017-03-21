From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:07:18 +0100
Subject: [Buildroot] [PATCHv2] package/dbus-cpp: fix cross-compilation
In-Reply-To: <1490132039-29054-1-git-send-email-yann.morin.1998@free.fr>
References: <1490132039-29054-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170321230718.3664467e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 22:33:59 +0100, Yann E. MORIN wrote:
> dbus-cpp has an ugly hack to not cross-build the tools when it detects
> cross-compilation.
> 
> However, we already have a host variant that builds those tools (and we
> anyway don't seem to need them to begin with).
> 
> Drop our patch that propagates the CXXFLAGS/LDFLAGS_FOR_BUILD. Replace
> with a patch to cross-compile the tools.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/110/1100539caae6ef62c61a3b96bc54f7c0a215cc62/
>     and many, many more.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2:
>   - add missing commit log to patch  (Thomas)
> ---
>  package/dbus-cpp/0002-cross-compile-tools.patch    | 34 ++++++++++++++++++++++
>  .../dbus-cpp/0002-cxxflags-ldflags-for-build.patch | 32 --------------------
>  2 files changed, 34 insertions(+), 32 deletions(-)
>  create mode 100644 package/dbus-cpp/0002-cross-compile-tools.patch
>  delete mode 100644 package/dbus-cpp/0002-cxxflags-ldflags-for-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
