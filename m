From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 11:38:15 +0200
Subject: [Buildroot] [PATCH v1] fbterm: fix musl compile
In-Reply-To: <1444329302-13716-1-git-send-email-ps.report@gmx.net>
References: <1444329302-13716-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151010113815.2ee9d030@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu,  8 Oct 2015 20:35:02 +0200, Peter Seiderer wrote:
> - add missing include, fixes:
> 
>   fbio.cpp:33:8: error: ?fd_set? does not name a type
>    static fd_set fds;
> 
>   improxy.cpp:439:3: error: ?fd_set? was not declared in this scope
> 
> - add missing WAIT_ANY define, fixes:
> 
>   fbterm.cpp: In member function ?void FbTerm::processSignal(u32)?:
>   fbterm.cpp:212:22: error: ?WAIT_ANY? was not declared in this scope
>       s32 pid = waitpid(WAIT_ANY, 0, WNOHANG);
> 
> Fixes:
> http://autobuild.buildroot.net/results/ab2/ab2334700b44bac233994b76f2acf1795f0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...p-improxy.cpp-fbterm.cpp-fix-musl-compile.patch | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/fbterm/0001-fbio.cpp-improxy.cpp-fbterm.cpp-fix-musl-compile.patch

Applied, thanks. However, this project is still hosted on Google Code,
and has not seen any release since 2010. Not nice since it means we
cannot upstream the patch :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
