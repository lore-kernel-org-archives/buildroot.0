From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 24 Sep 2013 09:01:29 -0500
Subject: [Buildroot] [PATCH] manual: fix manual generation with
	BR2_EXTERNAL support
In-Reply-To: <1380016412-25085-1-git-send-email-s.martin49@gmail.com>
References: <1380016412-25085-1-git-send-email-s.martin49@gmail.com>
Message-ID: <OFC6144035.2D5C1D1F-ON86257BF0.004C1516-86257BF0.004D0A5A@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel/Martin,

I can confirm that this patch fixes the issues with manual generation.

Samuel/Thomas,

I can confirm the manual now generates correctly for buildroot
to when the BR2_EXTERNAL v2 patch set is applied.

Samuel Martin <s.martin49@gmail.com> wrote on 09/24/2013 04:53:32 AM:
 
> Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  docs/manual/manual.mk         | 1 +
>  support/scripts/kconfiglib.py | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index d092d3f..99f2b84 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,6 +1,7 @@
>  manual-update-lists:
>     $(Q)$(call MESSAGE,"Updating the manual lists...")
>     $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
> +      BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
>        $(TOPDIR)/support/scripts/gen-manual-lists.py
> 
> 
> 
################################################################################
> diff --git a/support/scripts/kconfiglib.py 
b/support/scripts/kconfiglib.py
> index 0704cc0..e40947c 100644
> --- a/support/scripts/kconfiglib.py
> +++ b/support/scripts/kconfiglib.py
> @@ -2074,7 +2074,7 @@ set_re   = re.compile(r"CONFIG_(\w+)=(.*)")
>  unset_re = re.compile(r"# CONFIG_(\w+) is not set")
> 
>  # Regular expression for finding $-references to symbols in strings
> -sym_ref_re = re.compile(r"\$[A-Za-z_]+")
> +sym_ref_re = re.compile(r"\$[A-Za-z_][0-9A-Za-z_]*")
> 
>  # Integers representing symbol types
>  UNKNOWN, BOOL, TRISTATE, STRING, HEX, INT = range(0, 6)
> -- 
> 1.8.4
> 

Thanks,
-Ryan

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130924/0f6dc502/attachment-0001.html>
