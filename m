From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:09:51 +0100
Subject: [Buildroot] Kernel patches in Buildroot
In-Reply-To: <564B7235.20209@cmlab.biz>
References: <56432809.3000902@synopsys.com> <56432ED3.7070008@mind.be>
 <564B0BBE.8050102@synopsys.com> <564B603B.5010907@synopsys.com>
 <564B7235.20209@cmlab.biz>
Message-ID: <20151117210951.0150b687@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Van Arnem,

On Tue, 17 Nov 2015 11:30:13 -0700, David Van Arnem wrote:
> On 11/17/2015 10:13 AM, Joao Pinto wrote:

> > The linux kernel patching system does not recognizes the
> > packages/linux-arc-axs101-20141021-3.13 patch folder. Could you give me a help
> > on this?
> 
> I haven't done this myself, so I'm not completely sure if this is 
> correct, but there's an option to add custom kernel patches under 
> menuconfig -> Kernel -> Custom kernel patches.  I think to patch the 
> kernel you would need to set that value to the 
> snps-custom/packages/linux-arc-axs... path.

This is indeed another solution. But Joao was trying to use the
BR2_GLOBAL_PATCH_DIR mechanism, which allows to provide custom patches
for *any* package, and not only specifically for the Linux kernel.

Essentially, the "Custom kernel patches" mechanism you points to
predates the BR2_GLOBAL_PATCH_DIR mechanism. We keep it for
compatibility reasons, but generally consider BR2_GLOBAL_PATCH_DIR to
be the "better way".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
