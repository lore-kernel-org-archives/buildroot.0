From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Fri, 10 Feb 2012 19:27:52 +0100
Subject: [Buildroot] [PATCH 1/2] Add support for U-Boot SPL
In-Reply-To: <201202100058.02053.arnout@mind.be>
References: <1328402147-21404-1-git-send-email-n-dechesne@ti.com>
 <1328402147-21404-2-git-send-email-n-dechesne@ti.com>
 <201202100058.02053.arnout@mind.be>
Message-ID: <CALB96Nk748E0taoD_TGpsPyqe098yC6No-xzmLE+2EjHmtaZqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 12:58 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

>  It doesn't work well, but unfortunately I don't know how to solve it.
> MLO and u-boot.img are only created for the omap configs, and only in
> u-boot 2011.12 or later.  Depending on omap in the Config.in is almost
> impossible, and also depending on 2011.12 is difficult because it could
> be a custom git instead.
>
> ouch. thanks for finding this out, as I didn't notice.

looking at the SPL code, it seems that SPL will parse the uboot file and
try to determine the format. if it does not find the right signature it
will assume it's raw, e.g. something a-la u-boot.bin.
so we could patch SPL to load u-boot.bin (the name used by SPL is
hardcoded). but that means that we have to carry over 1 patch and keep
rebasing it...

i don't have my board with me, atm. so i will make some tests sometimes
later.


>  I think the only solution is to add a check in the .mk file if MLO and
> u-boot.img indeed exist, and fall back to the default instead if not.
>

indeed, the u-boot.img does not seem to be created unless it's needed (e.g.
in OMAP case). so that might work.

would you accept such a solution? if so i can update my patches with that?


>
>  What is also missing is that the choice between the different image types
> should depend on !BR2_TARGET_UBOOT_SPL.
>

sorry, i don't get this one. what do you mean?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/d92e5cfa/attachment.html>
