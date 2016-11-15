From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 23:22:34 +0100
Subject: [Buildroot] [PATCH] gdb: arc: remove C++ dependency and disable
 build with C++
In-Reply-To: <1479223291-5657-1-git-send-email-vzakhar@synopsys.com>
References: <1479223291-5657-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161115232234.5feba51c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 18:21:31 +0300, Vlad Zakharov wrote:
> gdb arc-2016.09-rc1 is based on upstream 7.12 gdb version where we
> can still disable C++ build. For more information take a look at:
> https://sourceware.org/gdb/wiki/cxx-conversion
> 
> We wanted to build gdb with C++ as it is used as default in 7.12
> and is even a mandatory requirement since 2016/09.
> 
> But unfortunately we missed one runtime failure that C++ build
> causes and so no we have to disable C++ build.
> 
> When gdb arc-2016.09-rc1 is built as C++ application it segfaults
> at runtime for ARC.
> 
> We are going to fix the issue in 2017.03 ARC toolchain release.
> and before this we remove C++ dependency are adding temporary
> workaround to prevent runtime segfaults.
> 
> The workaround is to disable building gdb as C++ application via
> passing --disable-build-with-cxx config option when building gdb
> for arc.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  package/gdb/Config.in | 6 ------
>  package/gdb/gdb.mk    | 7 +++++++
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
