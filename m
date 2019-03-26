From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 21:33:39 +0100
Subject: [Buildroot] [PATCH] gummiboot: fix linking for non-host
 compatible targets
In-Reply-To: <20190326130757.4521-1-esben.haabendal@gmail.com>
References: <20190326130757.4521-1-esben.haabendal@gmail.com>
Message-ID: <a98e9eba-82d2-a387-a99b-56c15ceeba40@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/03/2019 14:07, Esben Haabendal wrote:
> + $(gummiboot_solib): $(gummiboot_objects)
> +-	$(AM_V_CCLD)$(LD) $(efi_ldflags) $(gummiboot_objects) \
> ++	$(AM_V_CCLD)$(EFI_LD) $(efi_ldflags) $(gummiboot_objects) \
> + 		-o $@ -lefi -lgnuefi $(shell $(CC) -print-libgcc-file-name); \
                                             ^^^^ Shouldn't this be EFI_CC?
> + 	nm -D -u $@ | grep ' U ' && exit 1 || :

 Is nm the same on all architectures? Of course, since gummiboot is x86 only, it
doesn't matter much.

 Regards,
 Arnout
