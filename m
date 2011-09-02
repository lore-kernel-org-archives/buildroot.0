From: Will Moore <will.moore@beraninstruments.com>
Date: Fri, 2 Sep 2011 09:21:22 +0100
Subject: [Buildroot] [PATCH v2 2/2] syslinux: add support forhost-install
In-Reply-To: <201109011826.47154.arnout@mind.be>
References: <1314770813-12307-1-git-send-email-arnout@mind.be>
 <1314770813-12307-2-git-send-email-arnout@mind.be>
 <20110831101935.03bda653@skate> <201109011826.47154.arnout@mind.be>
Message-ID: <1BE66A5E5E5242C993E3B3918F0628D3@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Arnout Vandecappelle
> Sent: 01 September 2011 17:27
>
snip
>
> > Not related to your patches directly, but could you elaborate a bit on
> > how syslinux is used in practice by giving an example usage. This would
> > explain a bit why a host version is needed, how to set up syslinux on
> > the target, etc.
> 
>  To build a rescue disk that rewrites the disk of the target device.  The idea
> is that the whole thing can be sent as a zip file and the customer just has to
> unzip it to a USB stick and run syslinux (from Windows) and voila, he has a
> rescue USB stick.  The compiled syslinux.exe is taken from the tar file for
> that.  However, I also want to be able to create a rescue disk directly from
> buildroot, hence I want a working host-syslinux.
> 
>  FYI the make_rescue script is attached.

I use syslinux on an i486 target.  I use host syslinux to make a bootable USB
flash drive of buildroot Linux.  I then plug the USB flash drive into the target
and boot from it, then use target syslinux to make the target Disk on Module
(DoM) flash drive bootable and install buildroot Linux.  The USB flash drive is
then unplugged and the target boots from the DoM evermore.  I like having the
same version of syslinux on host and target.  Thanks for your work Arnout.

> 
> 
>  Regards,
>  Arnout
> 
> 
> 
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
