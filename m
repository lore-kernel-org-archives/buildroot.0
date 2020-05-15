From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 21:32:45 +0200
Subject: [Buildroot] [PATCH] package/elf2flt: add support for
 XTENSA_[PN]DIFF relocations
In-Reply-To: <20200513123520.30832-1-jcmvbkbc@gmail.com>
References: <20200513123520.30832-1-jcmvbkbc@gmail.com>
Message-ID: <20200515213245.1919c55b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 May 2020 05:35:20 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> Xtensa have added new relocation types R_XTENSA_[NP]DIFF{8,16,32} with
> the same properties as the existing types R_XTENSA_DIFF{8,16,32}.
> Add them to the list of ignored relocation types.
> 
> This fixes the following error when invoking elf2flt on xtensa binaries
> built with the recent binutils:
> 
>   ERROR: reloc type R_XTENSA_PDIFF32 unsupported in this context
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...-add-new-relocation-types-for-xtensa.patch | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 package/elf2flt/0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
