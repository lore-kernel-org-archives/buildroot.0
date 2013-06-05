From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jun 2013 21:38:07 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-boards: set a default board
In-Reply-To: <87d2s0cqtw.fsf@dell.be.48ers.dk>
References: <1370449270-22014-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1370449270-22014-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d2s0cqtw.fsf@dell.be.48ers.dk>
Message-ID: <20130605213807.0c015c5d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 05 Jun 2013 21:14:51 +0200, Peter Korsgaard wrote:

>  Thomas> The default configuration doesn't set any board, but the
>  Thomas> sunxi-boards.mk file errors out if no board is defined. This causes a
>  Thomas> large number of build failures in the autobuilders, such as
>  Thomas> http://autobuild.buildroot.org/results/b92/b928edc07f0939531d76833a17c851889ae06677/build-end.log.
> 
>  Thomas> The proposed approach to solve this is to set a default board. An
>  Thomas> alternative approach would have been to remove the check that ensures
>  Thomas> that a board has been set, but I believe it's less obvious for the
>  Thomas> user.
> 
> That won't help as it then just fails when it tries to build/install.

Well, we could tune the build/install step to not fail if
BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE is empty, but I don't think we want
to do that.

> Hmm, how is this different that what we do for the barebox/u-boot/linux
> configurations?

It is different in that this package starts with BR2_PACKAGE, so it can
get selected by the randpackageconfig logic, while barebox/u-boot/linux
Kconfig options don't start by BR2_PACKAGE, so they don't get selected
by randpackageconfig :)

> If people forget to set a sensible _FEX_FILE they now silently get the
> wrong stuff (if they don't build for hackberry) instead of a clear error
> message.

Right.

> Wouldn't it make more sense to blacklist the package or preseed
> BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE to a sensible value in the autobuilder
> scripts?

Ok, will do that. Will you also do the same on your autobuilders? I
really should clean up my script, and share it so that we can try to
run the same logic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
