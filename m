From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 20 Dec 2017 16:29:53 +0000
Subject: [Buildroot] [PATCH 1/2] libdrm-armada: new package
In-Reply-To: <20171220162354.21092f36@windsurf.lan>
References: <20171220150843.21154-1-didin@synopsys.com>
 <20171220150843.21154-2-didin@synopsys.com>
 <20171220162354.21092f36@windsurf.lan>
Message-ID: <1513787392.21982.12.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2017-12-20 at 16:23 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> (In addition to the comments from Yann).
> 
> On Wed, 20 Dec 2017 18:08:42 +0300, Evgeniy Didin wrote:
> 
> > ?package/Config.in????????????????????????|??1 +
> > ?package/libdrm-armada/Config.in??????????|??7 +++++++
> > ?package/libdrm-armada/libdrm-armada.hash |??2 ++
> > ?package/libdrm-armada/libdrm-armada.mk???| 24
> > ++++++++++++++++++++++++
> 
> Entry in DEVELOPERS file missing.
Sure, I will add it.
> 
> > +LIBDRM_ARMADA_VERSION = 6b461c
> 
> Please use a full Git hash.
> 
Will do it.
> > +LIBDRM_ARMADA_SOURCE = libdrm-armada-
> > $(LIBDRM_ARMADA_VERSION).tar.gz
> > +LIBDRM_ARMADA_SITE = https://urldefense.proofpoint.com/v2/url?u=ht
> > tp-3A__git.arm.linux.org.uk_cgit_libdrm-
> > 2Darmada.git&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=vQk-
> > RIbjwN0zvlwiMSpq3LYUTNf7Gqc4ujhosYITtAw&m=UVQmwM_r21WNyO49KSV5QtP9z
> > c7M-MXRN94a54yeTOo&s=2Zesvx1uezua2BKA5za5lFPQGXcyC_eRzPPY5paalxs&e=
> > +LIBDRM_ARMADA_SITE_METHOD = git
> > +LIBDRM_ARMADA_DEPENDENCIES = libdrm
> > +LIBDRM_ARMADA_INSTALL_STAGING = YES
> 
> It is a problem that this package has no license information
> whatsoever. No COPYING file, no LICENSE file, no header in the source
> file that indicates the license (except for
> https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org
> .uk_cgit_libdrm-2Darmada.git_tree_libdrm-
> 5Flists.h&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=vQk-
> RIbjwN0zvlwiMSpq3LYUTNf7Gqc4ujhosYITtAw&m=UVQmwM_r21WNyO49KSV5QtP9zc7
> M-MXRN94a54yeTOo&s=d6SqLTdSxKN7A0n1Rv5fuIOQiQxDpOQB7sIkjSiq4mI&e=).
> 
> Could you ask upstream to add appropriate licensing information ?
> 
This package was added to Yocto, and they resolved it adding
libdrm_lists.h as a license file:
https://lists.yoctoproject.org/pipermail/meta-freescale/2017-May/020567
.html
Is this approach appropriate?

> Thanks!
> 
> Thomas

Best regards,
Evgeniy Didin
