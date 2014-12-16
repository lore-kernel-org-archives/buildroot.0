From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Dec 2014 23:55:32 +0100
Subject: [Buildroot] Second try: Configuration for real hardware / How
 to configure RTAI
In-Reply-To: <d4a8b511599845a89f0c34664c0ed8b1@dsw332.wattens.swarovski.com>
References: <d4a8b511599845a89f0c34664c0ed8b1@dsw332.wattens.swarovski.com>
Message-ID: <5490B864.30406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/12/14 16:19, Spielmann Werner wrote:
> Hello,
>
>  
>
> this is my second try?    :-(    Any help is appreciated!
>
>  
>
>  
>
> I was able to pass ?make? (for a x86 configuration: kernel 2.6.32.11, rtai
> 3.8.1, gcc 4.5.4)  for the first time (with the help of Peter Koorsgard).
>
>  
>
> I found this document:
> http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf
>
>  
>
> But I still have several questions:
>
>  
>
> ?         How can I adapt the configuration to my real hardware?
>
> I want to use a x86 architecture with is nearly a standard PC with flash cards.
>
> Have I to configure a board/ directory and a configs/ directory for this Board?
>
> The Ethernet devices will need the Intel e1000e-Driver, the serial devices a
> 8250/16550 driver?

 If you passed the build, then the next step is to create a bootable image (SD
or CF card). On a PC that is unfortunately a little complicated. You can look at
e.g. board/ts/ts5x00/ for an example.

 Next, you'll probably want to make a custom kernel configuration because the
i386_defconfig is pretty bloated. So do a 'make linux-menuconfig' and remove all
the drivers you don't need.

 Finally, to save all that configuration, you can create a board/ directory and
a defconfig. Look at the BR2_EXTERNAL explanation in the manual for suggestions
on how to approach that.

>
> Can you give me any pointers?
>
>  
>
> ?         To configure RTAI on a standard PC I have to execute within the RTAI
> directory (before building the kernel):
>
>  
>
>    ?make menuconfig?
>
>  
>
> and then:
>
>  
>
>     ?make?
>
> When and how can I configure RTAI in combination with buildroot?

 I haven't used RTAI myself, but I thought it's Kconfig was merged with the
kernel's. Hm, looking at RTAI's README, it turns out that I was wrong... Well,
currently we only support the automatic configuration of RTAI, not the
interactive configuration. Patches to improve that are welcome.



 Regards,
 Arnout


>
> Thanks for reading. Any help is appreciated!
>
>  
>
> Werner
>
>  
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
