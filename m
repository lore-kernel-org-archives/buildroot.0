From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:28:24 +0100
Subject: [Buildroot] [PATCH v2 2/2] toolchain/toolchain-wrapper: handle
 __FILE__ macro for reproducibility
In-Reply-To: <20190831180113.16025-2-itsatharva@gmail.com>
References: <20190831180113.16025-1-itsatharva@gmail.com>
 <20190831180113.16025-2-itsatharva@gmail.com>
Message-ID: <20200106232824.30e88329@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 31 Aug 2019 23:31:13 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> Many tools use __FILE__ for debugging and __FILE__ captures the build path.
> This results in non-reproducible images when building in different directories.
> 
> If the config uses GCC 8 or above, we use -ffile-prefix-map=old=new and let gcc
> take care of the path remapping in __FILE__. Since GCC versions before v8 did
> not have this feature, we use a dummy string in that case.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

I have applied this patch, with the following changes:

    [Thomas:
     - as suggested by Arnout, use the empty string for the __FILE__ and
       __BASE_FILE__ value
     - as suggested by Romain, also handle __BASE_FILE__ in addition to
       __FILE__
     - pass -Wno-builtin-macro-redefined to avoid build errors when
       -Werror is passed]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
