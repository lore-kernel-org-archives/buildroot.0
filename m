From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 19:46:43 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
 is set
In-Reply-To: <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <20150819194643.1fad6062@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Wed, 19 Aug 2015 15:14:34 +0200, Jan Viktorin wrote:

> this short patch series introduces a way how to check whether certain
> CONFIG_* entries are set to an expected value in a selected .config
> file. When building a package that requires a certain CONFIG_* to be
> set (as in the case of xtables-addons), Buildroot can either force
> to set the config or just error out a message.
> 
> I could not find any suitable mechanism for this in Buildroot (if there
> is one, please give me a reference) so I propose a simple extension of
> KCONFIG_*_OPT util macros. It is then implemented for xtables-addons to
> check whether CONFIG_MODULES are set in the Linux Kernel .config.

There is some discussion already going on on this topic, around the
pkg-kernel-module infrastructure. We recently committed a patch that
makes the infrastructure verify that the kernel has been built with
module support, and if not, bail out with a clear error message:

   http://git.buildroot.net/buildroot/commit/?id=8df95d926e963601c727defeb4ab90ce2368da70

However, Peter Korsgaard raised the concern that we should instead just
forcefully enable CONFIG_MODULES=y in the configuration in such a case.
There has then been some discussion with Yann on how to achieve that
properly. Please see the thread at
http://lists.busybox.net/pipermail/buildroot/2015-August/137511.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
