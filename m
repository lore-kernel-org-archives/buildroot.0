From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Mar 2018 18:45:59 +0100
Subject: [Buildroot] Using grub-bios.cfg
In-Reply-To: <1521556906599-0.post@n4.nabble.com>
References: <1521556906599-0.post@n4.nabble.com>
Message-ID: <19706da9-64e6-cf98-da64-a688ec8ffdf8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-03-18 15:41, AAlex_ wrote:
> Hi,
> using a modified grub-bios.cfg dont work. 
> File located under <BR2_EXTERNAL_MY_PATH>/board/pc
> But instead, buildroot uses grub-bios.cfg under
> <BUILDROOT_INSTALL_PATH>/board/pc
> Doing the same with an pc-efi target works:
> grub-efi.cfg located in <BR2_EXTERNAL_MY_PATH>/board/pc
> will be used.
> Do i need to specify more than an external path in bios defconfig?

 It's not entirely clear to me what you mean. However:

 grub-bios.cfg and grub-efi.cfg are only used by the custom post-image script
board/pc/post-image.sh. The file to use is based on the location of that script.
In other words, if you refer to board/pc/post-image.sh in your Buildroot
configuration, then the grub-bios.cfg under <BUILDROOT_INSTALL_PATH>/board/pc
will be used.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
