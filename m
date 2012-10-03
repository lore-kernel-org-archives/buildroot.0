From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 03 Oct 2012 21:58:47 +0200
Subject: [Buildroot] initramfs compression and some other questions
In-Reply-To: <506C7BE3.9040001@gmail.com>
References: <506C7BE3.9040001@gmail.com>
Message-ID: <506C98F7.2000408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/12 19:54, Valentine Barshak wrote:
> Hi,
> I've been using buildroot for a small (i586) Linux recovery image, having both the kernel and initramfs root in a single
> image.
>
> By default, buildroot (linux/linux.mk) sets GZIP compression for initramfs, and there's no option to choose other
> compression mode.
>
> My question is why is GZIP compression forced for initramfs?
> IMHO, initramfs compression doesn't make much sense, since
> the kernel is compressed altogether with initramfs, and we
> have double compression, that adds more size to the resulting image
> and time overhead when unpacking.
>
> Why not remove the following lines from linux.mk?
> $(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
> $(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config))
>
> Or probably use KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE instead?
>
> Besides, there are other compression methods supported by linux kernel,
> so why force GZIP?

  Good idea.  Care to make a patch?

> BTW, I have submitted a number of patches to the list, that attempt
> to fix some of the issues I've encountered while building my recovery image. Is it the right place to share patches or
> do I need to use bugz and file a bug for each change?

  It's the right place.  We don't use bugzilla that much - basically only for
bugs that aren't resolved (yet).


> I have some more changes that I'd like to share.
> It's been no ack/nack for the stuff I sent last week. So I'm kind of wondering whether this stuff is needed upstream.

  It just takes a while before patches get committed.  As long as you react
to the comments you get (like you did), they should be included in the long
run.  But it can take months...


> And the last question is about adding new packages to buildroot.
> For example, do you plan to add a pdf viewer?
>
> I've added epdfview, it seems to work fine. Is there any reason
> to not include it in the mainstream buildroot?
>
> I've also added tigervnc for my small recovery image.
> Seems to work fine as well.
> Do you plan to include it as well or is it considered unneeded for the majority of the buildroot users?

  Well, firefox is on the way in, so a pdf viewer shouldn't be a problem :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
