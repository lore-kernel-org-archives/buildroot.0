From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:15:58 +0200
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <20160418162528.GA5827@asimov.austin.ibm.com>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
 <20160418162528.GA5827@asimov.austin.ibm.com>
Message-ID: <20160418211558.12db7fdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 11:25:28 -0500, Patrick Williams wrote:

> 1. Have support for a defconfig location other than
> $(BR2_EXTERNAL)/configs/.
> 
>     We have the proposed patchset, which is too specific due to the use
>     of 'custom', and we have a local hack where we put the same recipe
>     into $(BR2_EXTERNAL)/docs/custom/custom.mk.  Other than docs/*/*.mk,
>     there is no include in buildroot/Makefile into the BR2_EXTERNAL tree
>     when invoked without an existing .config.
> 
>     Would there be opposition to a new -include in buildroot/Makefile
>     outside of the large $(if BR2_HAVE_DOT_CONFIG... block into the
>     BR2_EXTERNAL tree?  This would give us a hook point to add the
>     %_defconfig recipe found in this patchset.
> 
>     Alternatively, or additionally, we could create a
>     BR2_EXTERNAL_CONFIGS variable as a set of additional directories to
>     search as defconfig locations.
> 
> 2. (Bonus) Enhance list-defconfigs to also display the defconfigs found
> at this extra location.
> 
>     Would there be opposition to something like a
>     $(BR2_LIST_DEFCONFIGS_CMDS) variable to extend the list-defconfigs
>     in the custom tree?

I think the only reasonable solution to this is to really allow
multiple BR2_EXTERNAL directories. A patch series doing this was
proposed by Yann E. Morin a while ago, but due to the fairly
significant additional complexity, it hasn't been merged so far.

Maybe hearing your use case will help push the feature further, or will
encourage other folks in the Buildroot community to come up with
alternate solutions for your problem.

One question that immediately comes to mind is: why do you maintain a
BR2_EXTERNAL tree on your side? If all you do is related to publicly
available machines/packages, why don't you upstream all what you have
in Buildroot, and let only your downstream users that need to create
private/confidential things use the BR2_EXTERNAL feature?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
