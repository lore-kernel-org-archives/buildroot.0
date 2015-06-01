From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 01 Jun 2015 22:09:32 +0200
Subject: [Buildroot] [PATCH 1/2] arch: tidy up mmu config
In-Reply-To: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <556CBBFC.4080002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/21/15 18:54, Guido Mart?nez wrote:
> Instead of blacklisting which architectures support MMUs (mandatorily
> or optionally), introduce two Kconfig options that are selected by each
> architecture in each case.
> 
> This simplifies the logic in BR2_USE_MMU.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Two small improvements, but even without them this patch is OK for me.

- In arch/Config.in, the ARM section and the Blackfin section look the same to
the casual onlooker, but for ARM the MMU options depend on the subarchitecture,
while for Blackfin it's always NOMMU. So I'd make this explicit by adding a
comment for ARM:

config BR2_arm
        bool "ARM (little endian)"
	# MMU support is set by subarchitectur in Config.in.arm

 Same for ELF in the second patch.

- Like you did for ARM, I think you should move the MMU selection to the
subarches for xtensa as well. Since in fact, the fsf variant is always MMU.


 So if you repost this patch and make the above changes, you can add my Acked-by.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
