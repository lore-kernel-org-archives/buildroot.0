From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jan 2012 18:34:05 +0100
Subject: [Buildroot] pci_ids.h missing
In-Reply-To: <CAOrAeomeuJhMTOicaqz22Y+xULo1hZBs92xASrWsSYCG8gvVdw@mail.gmail.com>
References: <CAOrAeokiOHCwrwG7VGbAem=w4-Gx-P8QjuqQYK_y3=S278S=xg@mail.gmail.com>
 <201201160050.53285.vapier@gentoo.org>
 <CAOrAeomeuJhMTOicaqz22Y+xULo1hZBs92xASrWsSYCG8gvVdw@mail.gmail.com>
Message-ID: <201201161834.06077.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 16 January 2012 17:38:01 vbr vbr wrote:
> Just downloaded and extracted a vanilla 2.6.39.4 kernel from kernel.org,
> and this version does ship pci_ids.h. There must be something else going on:
> 
> x linux-2.6.39.4/include/linux/pch_dma.h
> x linux-2.6.39.4/include/linux/pci-acpi.h
> x linux-2.6.39.4/include/linux/pci-aspm.h
> x linux-2.6.39.4/include/linux/pci-dma.h
> x linux-2.6.39.4/include/linux/pci.h
> x linux-2.6.39.4/include/linux/pci_hotplug.h
> x linux-2.6.39.4/include/linux/pci_ids.h   <<<<<<<<<<<<<
> x linux-2.6.39.4/include/linux/pci_regs.h
> x linux-2.6.39.4/include/linux/pcieport_if.h
> 
> Thanks
> Vincent
> 
> 
> On Sun, Jan 15, 2012 at 9:50 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> 
> > On Sunday 15 January 2012 14:24:41 vbr vbr wrote:
> > > pci_ids.h is missing from the include/linux directory in the staging
> > area:
> > >
> > > # ls output/staging/usr/include/linux/pci*.h
> > > output/staging/usr/include/linux/pci.h
> > > output/staging/usr/include/linux/pci_regs.h
> > >
> > > Am I missing something in the buildroot configuration?
> >
> > upstream linux kernel doesn't ship it, thus buildroot does not
                                  ^^^^
 This should be: upstream linux kernel doesn't *install* it.

 pci_ids.h is not considered ABI and should not be accessed by userspace.
External modules should always be compiled from the Linux source tree 
itself so they don't need pci_ids.h in staging.

 pciutils, for instance, includes its own list of ids.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
