From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Oct 2012 22:46:30 +0200
Subject: [Buildroot] Kernel does not boot : dts is not appended to the
 kernel (Karo TX53 [imx53])
In-Reply-To: <1E9ED8BFF49147018F72AEB3007FC941@JohanW7>
References: <1E9ED8BFF49147018F72AEB3007FC941@JohanW7>
Message-ID: <5081BC26.3000103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/12 17:02, Sagaert Johan wrote:
> #2. Concatenate the kernel with the generated DT blob:
> cat arch/arm/boot/zImage arch/arm/boot/tx53.dtb>  arch/arm/boot/zImage_tx53
>
> When I look under output/images I see only zImage, not the kernel with the appended dts blob (zImge_tx53).

  This is what buildroot does, except it goes to images/zImage.
Can you verify that buildroot builds arch/arm/boot/tx53.dtb correctly?  It builds
just one specific dtb, not all dtbs, so that should be easy to verify.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
