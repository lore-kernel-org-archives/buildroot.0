From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 14:28:54 +0200
Subject: [Buildroot] RHEL6 autobuilder
In-Reply-To: <20ef3a8f-2fa6-6c31-852c-0a11a72c8a16@mentor.com>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
 <20180725231245.7e1e2f99@windsurf>
 <a5beffd9-7db4-1836-ba1e-a301a2ac90c6@mentor.com>
 <20180726094334.4da615cf@windsurf>
 <20ef3a8f-2fa6-6c31-852c-0a11a72c8a16@mentor.com>
Message-ID: <20180730142854.27003e20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Hollis,

+Arnout in Cc about the --detach option.

On Fri, 27 Jul 2018 12:30:15 -0700, Hollis Blanchard wrote:

> OK, I set this up on a RHEL6.5 host, and it ran enough to hit the known 
> libglib2 problem <https://patchwork.ozlabs.org/patch/947086/>. I 
> encountered two issues along the way:

Great!

>   * buildroot-test/buildroot-autobuild script uses the --detach option
>     to 'git checkout', which RHEL6.5's git doesn't know about. I just
>     deleted the option and everything's working fine. I can submit a
>     patch if you like.

This option was added in commit
66f91eb4409e5efacb1871b8ab2b336c4873b796, and Arnout gave the following
reason:

    Since switching repositories may also switch branches, we use a git
    fetch/checkout sequence instead of doing a git pull. With git pull, the
    branches would be merged instead of switched. To avoid polluting the
    log with the long git message about a detached head, while still
    getting some useful output from git, pass the --detach option to
    git checkout.

Since it's apparently just about logging, perhaps we can just remove it. Arnout ?

>   * buildroot/utils/genrandconfig uses argparse, which doesn't exist in
>     RHEL6.5's Python. I avoided the problem for now by supplying an
>     alternate Python installation.

Sounds good.

> I guess I just need HTTP credentials to submit to 
> http://autobuild.buildroot.org ?

I'll reply to you privately about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
