From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:20:19 +0200
Subject: [Buildroot] [PATCH 1/3] beaglev: update to new starfive linux
 and u-boot
In-Reply-To: <20210609063834.2193864-1-drew@beagleboard.org>
References: <20210609063834.2193864-1-drew@beagleboard.org>
Message-ID: <6f3c7e9e-f770-3224-38fe-d14e72673abd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2021 08:38, Drew Fustini wrote:
> Update the commit id for u-boot to include fixes from the starfive-tech
> u-boot repository:
> 
> 494e5ef7b807 jh7100: Enable full 2M L2 cache
> 4571f5a4e1e4 vic7100: enable cache ways (L2 cache)
> abb06422a5cd Remove fdt_high and initrd_high for Starfive
> 93099a61c7b0 starfive: beaglev: Disable SIFIVE_CLINT and enable RISCV_TIMER
> bfb5abac3d1f Revert "riscv: Enable the SiFive CLINT block driver in S-Mode(VIC7100 ONLY)"
> 7b70e1d44ba9 defconfig: enable cache_wayenable for better performance
> 7c585978616b configs: earlycon=sbi is deprecated
> 
> The commit abb06422a5cd ("Remove fdt_high and initrd_high for Starfive")
> has removed the need for buildroot to patch the fdt_addr_r address.
> 
> Update linux from commit in the old 5.10 branch that Fedora image was 
> using to head of esmil_starlight branch [1] which is currently based 
> on 5.13-rc5 and represents the best kernel for this board [2].
> 
> In addition, the updated kernel now has jh7100-beaglev-starlight.dtb so
> buildroot no longer needs to copy the dtb from u-boot.
> 
> [1] https://github.com/starfive-tech/linux/tree/esmil_starlight
> [2] https://github.com/starfive-tech/linux/issues/26
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

 Series applied to master, thanks.

 I've added a comment to refer to the tag you added to the linux repo, and I
changed the commit message of the other two to make it explicit in the Subject
line that it's a version bump.

 Regards,
 Arnout

[snip]
