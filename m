From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 23:11:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: don't remove support files
 if python chosen
In-Reply-To: <1523389042-66122-1-git-send-email-jzaddach@cisco.com>
References: <1523389042-66122-1-git-send-email-jzaddach@cisco.com>
Message-ID: <20180427231100.3d53f3ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 12:37:22 -0700, Jonas Zaddach wrote:
> If one wants to use GDB with python support on the target, you need the support
> files installed by GDB. These get usually deleted to save some space, so I just
> wrapped the Makefile code deleting them in a conditional block depending on if
> python support is active or not.
> 
> Signed-off-by: Jonas Zaddach <jzaddach@cisco.com>
> ---
>  package/gdb/gdb.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master after doing the following changes:

    [Thomas:
     - use positive logic "if python is disabled"
     - put the comment inside the condition, as suggested by Arnout]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
