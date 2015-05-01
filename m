From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:30:45 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix rebuild/reinstall
 for Linaro toolchains
In-Reply-To: <1430303299-24519-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430303299-24519-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150501163045.3a2140a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Apr 2015 12:28:19 +0200, Thomas Petazzoni wrote:
> For Linaro toolchains, a special post install staging hook is used to
> create two symlinks needed for the dynamic loader to find the
> libraries. However, the way the link is created prevents a 'make
> toolchain-external-reinstall' from succeeding, because the symlink
> already exists and points to a directory:
> 
> ln -sf . /home/thomas/projets/outputs/training/target/lib/arm-linux-gnueabihf
> ln: '/home/thomas/projets/outputs/training/target/lib/arm-linux-gnueabihf/.': cannot overwrite directory
> 
> This commit adjust the hook to pass the '-n' option so that the link
> name is treated as a normal file if it is a symbolic link to a
> directory.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
