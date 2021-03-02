From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Mar 2021 23:58:59 +0100
Subject: [Buildroot] [PATCH] support/scripts/gen-bootlin-toolchains:
 correct xtensa toolchain dependencies
In-Reply-To: <20210302211551.19018-1-peter@korsgaard.com>
References: <20210302211551.19018-1-peter@korsgaard.com>
Message-ID: <f2e99356-2a06-1557-4d83-be4c0cb20168@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/03/2021 22:15, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/011/0111c2ed54618daaeedfc66b0ea04eda00a7e855/
> http://autobuild.buildroot.net/results/e53/e53e3880b63a23fa3b3e6d34664d40d5ddbdff89/
> ..
> 
> As listed in the br_fragment file of the toolchain, this is built for a
> little-endian "custom" xtensa variant rather than the (big-endian) fsf one:
> 
> BR2_xtensa=y
> BR2_XTENSA_CUSTOM=y
> 
> So update the dependencies in the script and regenerate Config.in.options /
> toolchain test.  Also fixup the autobuild config snippet to match.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 I took the liberty of changing 'xtensa' to 'xtensa-lx60' in the subject line.
Pedantry rules!

 Regards,
 Arnout
