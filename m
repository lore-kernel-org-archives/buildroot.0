From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 29 Oct 2015 11:39:19 +0000
Subject: [Buildroot] [PATCH 4/9 v2] toolchain/external: use generic
 extract commands (!blackfin case)
In-Reply-To: <4dfbf001b46ffeddf9c4fb300967473a3860b200.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
 <4dfbf001b46ffeddf9c4fb300967473a3860b200.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <56320567.6080303@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 10/24/2015 01:48 PM, Yann E. MORIN wrote:
> Now that packages can provide a list of files to be excluded when
> extracting their archive, downloaded external toolchains are no longer
> special in this respect.
> 
> Still, those toolchains are currently extracted directly into their
> final location, $(HOST_DIR)/opt/ext-toolchain/ which means we still
> need a custom extract command.
> 
> Except, we don't really need it: we can just move the toolchain, after
> it's been extracted by the generic extract command, with a post-extract
> hook.
> 
> This means that:
> 
>   - we now extract the toolchain with the generic extract command,
> 
>   - the toolchain is thus extracted into $(@D) ,
> 
>   - fixup commands are run against $(@D), as a post-extract hook,
>     instead of against $(HOST_DIR)/opt/ext-toolchain ,
> 
>   - once this is done, we move $(@D)/* into the final location with a
>     new post-extract hook.
> 
> Note: the blackfin case is special, and will be handled in a follow-up
> patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

After applying this patch (and the previous ones) I have built a rootfs
for MIPS architecture using the latest Codesourcery external toolchain.

Regards,

Vincent.
