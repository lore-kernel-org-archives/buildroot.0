From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2012 14:33:08 +0200
Subject: [Buildroot] Kernel does not boot : dts is not appended to the
 kernel (Karo TX53 [imx53])
In-Reply-To: <60668BA527D046AF87F109CE552F27AF@JohanW7>
References: <1E9ED8BFF49147018F72AEB3007FC941@JohanW7>
 <5081BC26.3000103@mind.be> <60668BA527D046AF87F109CE552F27AF@JohanW7>
Message-ID: <50829A04.30900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/10/12 11:25, Sagaert Johan wrote:
>
> Hi Arnout
>
> After logging the output of make i found that if you have build the kernel without the dtb appended and switch on the option
> afterwards then buildroot does not do the appending when make is run again...
> Would it need some .dtb_appended stamp in the linux.mk makefile ?

  Buildroot never rebuilds things automatically when you change the
configuration.  E.g. if you change the "kernel config file to use", this
will not trigger a reconfigure.  Or if you change from zImage to bzImage,
it is not rebuilt.  Sometimes it does rebuild, but that's more by accident
than anything else.

  Automatically detecting changes in the config would be possible, but messy.
I don't think we want to add that complexity to buildroot.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
