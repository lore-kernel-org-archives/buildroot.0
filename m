From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:02:00 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain-external: extract
 installation of gdbserver to separate define
In-Reply-To: <1455304826-10557-4-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-4-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160425230200.158fb2d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 20:20:24 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The installation of the gdbserver binary has no relation to the installation
> of the target libraries. Moving it to a separate define improves the
> understandability of the code and makes later refactoring easier.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I've done the following changes:

    [Thomas:
     - move the BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY condition as a make
       condition rather than a shell condition, as suggested by Romain
       Naour.
     - rename the TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER variable to
       TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER as suggested by Arnout.]

and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
