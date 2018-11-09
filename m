From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 9 Nov 2018 22:30:28 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] libv4l: add an option for IR BPF based decoders
In-Reply-To: <20181109215404.345454ec@windsurf>
References: <20181109172648.10289-1-fontaine.fabrice@gmail.com>
 <20181109215404.345454ec@windsurf>
Message-ID: <20181109223028.640de2a8@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 9 Nov 2018 21:54:04 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri,  9 Nov 2018 18:26:48 +0100, Fabrice Fontaine wrote:
> > Bump to version 1.61.1 added BPF based protocols support:
> > https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80
> > 
> > However, this dependency needs BPF support in kernel. On old kernels
> > (before 3.18), __NR_BPF is not defined for all architectures.
> > So retrieve upstream patch and add an option to enable BPF only if
> > headers are above 3.18.
> > 
> > Also drop patch to add bpf_common.h on old kernels (not needed anymore)
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/442de57cb76a7b38d71d690490faadc641036374
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> 
> Thanks for working on this!
> 
> 
> > +ifeq ($(BR2_PACKAGE_LIBV4L_UTILS_IR_BPF_BASED_DECODERS),y)
> > +LIBV4L_CONF_OPTS += --enable-bpf
> > +LIBV4L_DEPENDENCIES += elfutils
> > +
> >  # Disable clang that is used to build BPF (in-kernel bytecode machine) protocols
> >  LIBV4L_CONF_ENV += ac_cv_prog_CLANG=""  
> 
> So without clang, how are BPF protocols being built ?

Or split the patch into first disabling bpf support unconditionally, and
second enabling bpf (with or without clang support)...and I think
it is a matter of taste if bpf support without the clang generated
files is justifiable (maybe special bpf files could be provided
from external source etc.)....

Regards,
Peter

> 
> Best regards,
> 
> Thomas
