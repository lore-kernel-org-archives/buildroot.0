From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Nov 2018 21:25:09 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <20181107100605.13141-1-nicolas.carrier@orolia.com>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
Message-ID: <4e18d189-1a5b-3a73-5726-4a248af87713@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nicolas,

On 07/11/18 11:06, Nicolas Carrier wrote:
> From: Rafal Fabich <rafal.fabich@gmail.com>
> 
> This patch is a resubmit of commit 73da2ff6f718f2889e3c5024d899f8d58f502863,
> which was reverted by commit e782cd5b1bc231dda527d5d0a04e6a338669b92c in 2016.
> 
> This is the original commit message:
>    Add the option to use a local directory as the source for
>    building the Linux kernel, which can be useful during
>    kernel development.
> 
> As for the arguments used in the commit message when the patch was reverted:
> * Using _OVERRIDE_SRCDIR is not a good solution since it forces some content in
> local.mk, which should stay a mechanism local to the developer's workspace.
> * Without this patch, the linux kernel has no equivalent to the
> FOO_SITE_METHOD = local variable which is available for almost all the other
> packages.
> * When using packages with _SITE_METHOD = local, an external tool is used to
> retrieve the packages' sources, like a sub-repository mechanism or google repo.
> This tool has the responsibility of the build reproductibility in regard of
> these packages.
> It is the same for a linux kernel using the local method.
> 
> Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 In a situation like this, you can't keep the original Acked/Tested/Reviewed-by
tags, because the context has changed.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> # Conflicts:
> #	linux/Config.in

 Also, there is (normally) no need to keep the conflicts information when you
rebase a patch.


 Regards,
 Arnout

> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
