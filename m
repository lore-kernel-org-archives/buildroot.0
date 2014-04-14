From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:42:06 +0200
Subject: [Buildroot] [[PATCH v2] 1/1] lttng-libust: Disable
 liblttng-ust-dl with uClibc.
In-Reply-To: <1397426422-6193-1-git-send-email-romain.naour@openwide.fr>
References: <1397426422-6193-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140414224206.078f43a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 14 Apr 2014 00:00:22 +0200, Romain Naour wrote:
> According to uClibc commit [1], dlinfo is not available in recent uClibc (>0.9.33),
> but is available in older version of uClibc (<=0.9.33) whith a different prototype
> than dlinfo() in glibc.
> 
> To be able to use LTTng UST with uClibc, we need to disable the Dynamic Linker
> Tracing functionality [2].
> 
> A specific test on dlinfo() prototype is performed to enable or disable this
> functionality.
> 
> This patch supersede the one added in abf58f46cedacace1db53de5cc12a8fe9f7fbd82
> that wrongly disable liblttng-ust-dl even if dlinfo() comme from glibc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a6c/a6c33dd7ec2a36a50c5ea74b989a371d6c85e899/build-end.log
> 
> [1] http://git.uclibc.org/uClibc/commit/?id=f3c9dc499c5c787ddd8c4320f2d44d2ae6e40c22
> [2] http://lists.lttng.org/pipermail/lttng-dev/2014-February/022423.html
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Applied, thanks. However, I had to fix up the title of your patch.
Please don't screw it up like this, and just use:

	git format-patch --subject-prefix="PATCH v2"

and no other weird thing. Your patch title should have brackets inside
brackets, i.e the title should look like:

	[PATCH v2 1/1] lttng-libust...

or even better, for a single patch:

	[PATCH v2] lttng-libust...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
