From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Wed, 3 Jun 2015 11:12:54 -0300
Subject: [Buildroot] [PATCH 1/2] arch: tidy up mmu config
In-Reply-To: <556CBBFC.4080002@mind.be>
References: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
 <556CBBFC.4080002@mind.be>
Message-ID: <20150603141254.GA18352@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout!

On Mon, Jun 01, 2015 at 10:09:32PM +0200, Arnout Vandecappelle wrote:
> On 05/21/15 18:54, Guido Mart?nez wrote:
> > Instead of blacklisting which architectures support MMUs (mandatorily
> > or optionally), introduce two Kconfig options that are selected by each
> > architecture in each case.
> > 
> > This simplifies the logic in BR2_USE_MMU.
> > 
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Two small improvements, but even without them this patch is OK for me.
> 
> - In arch/Config.in, the ARM section and the Blackfin section look the same to
> the casual onlooker, but for ARM the MMU options depend on the subarchitecture,
> while for Blackfin it's always NOMMU. So I'd make this explicit by adding a
> comment for ARM:
> 
> config BR2_arm
>         bool "ARM (little endian)"
> 	# MMU support is set by subarchitectur in Config.in.arm
> 
>  Same for ELF in the second patch.
> 
> - Like you did for ARM, I think you should move the MMU selection to the
> subarches for xtensa as well. Since in fact, the fsf variant is always MMU.
> 
> 
>  So if you repost this patch and make the above changes, you can add my Acked-by.
Just resent the patches after applying these comments and the binfmt one
too.

Thanks a lot for reviewing!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
