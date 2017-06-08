From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:15:05 +0200
Subject: [Buildroot] [PATCH]Libssp support
In-Reply-To: <AM3PR05MB4333F3A6ACA381824BCE787C9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
References: <AM3PR05MB433972636565D3B639BB0BAC9C80@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170607201316.jkzcuamoovnbkcla@tarshish>
 <AM3PR05MB433D9ACAA63A9ED51BBFF7EC9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170608121224.vrmjd5zxulhu57h7@tarshish>
 <AM3PR05MB4333F3A6ACA381824BCE787C9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
Message-ID: <20170608231505.0ab8924c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Jun 2017 12:57:17 +0000, Guy Benyei wrote:

> I don't change the gcc end - the ssp support is implemented in gcc
> anyway, the compiler built with or without the "--disable-libssp" is
> the same compiler. This change only adds the libssp library, so the
> ssp feature can be activated. The reason I prefer this over building
> uClibc with ssp support is that in this case I may choose whether to
> add the libssp binaries to my image. Changing uClibc, or creating an
> alternative uClibc with ssp support would require a bigger uClibc or
> two different builds. I agree, that the patch should be enhanced in
> order to take in account the buildroot configuration, probably by
> adding a separate configuration item. Of course, I'am ready to do
> this work, but as you said, I'll have to convince the maintainers
> that this feature is worth to be added.

On my side, as long as there is a proper patch to support SSP support
at the compiler level, in addition to at the C library, I think I'd be
fine with applying it.

However, it has to be a proper patch, that makes sure SSP support can
only be enabled either at the compiler level *or* at the C library
level. For example, I'm not sure if you can disable SSP support in musl
or glibc, and what happens if you have SSP support in both the C
library and gcc's libssp. All those questions have to be answered in
the commit log of such a patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
