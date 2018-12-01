From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 1 Dec 2018 22:12:24 +0100
Subject: [Buildroot] [PATCH 2/2] quagga: zebra needs dynamic library
In-Reply-To: <20181201214608.562738c2@windsurf.home>
References: <20181201183151.3853-1-fontaine.fabrice@gmail.com>
 <20181201183151.3853-2-fontaine.fabrice@gmail.com>
 <20181201214608.562738c2@windsurf.home>
Message-ID: <CAPi7W83WYWBnPV9q4SGzaqDyTsSO32D_pvYFsHvrHaBHeayryw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
Le sam. 1 d?c. 2018 ? 21:46, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat,  1 Dec 2018 19:31:51 +0100, Fabrice Fontaine wrote:
> > zebra library defines optind and opterr which are already defined in
> > libc
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/32f93a73379d073abcaf8936ffbb8b5707583024
>
> Meh, can't we just rename those variables ?
Actually, they have just copy/pasted getopt.c from the libc. This code
is enabled only on musl because musl does not defined __GLIBC__, I
will find a way to disable it and send a new patch.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
