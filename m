From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 01 Jun 2013 20:40:31 +0200
Subject: [Buildroot] [Bug 6290] New: copying the kernel fails
In-Reply-To: <bug-6290-163@https.bugs.busybox.net/>
References: <bug-6290-163@https.bugs.busybox.net/>
Message-ID: <51AA401F.9050301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/05/13 08:23, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=6290
>
>             Summary: copying the kernel fails
>             Product: buildroot
>             Version: unspecified
>            Platform: PC
>          OS/Version: Linux
>              Status: NEW
>            Severity: critical
>            Priority: P5
>           Component: Other
>          AssignedTo: unassigned at buildroot.uclibc.org
>          ReportedBy: jungmann0 at gmail.com
>                  CC: buildroot at uclibc.org
>     Estimated Hours: 0.0
>
>
> I want to build a linux system for my arm-based PDA (Intel PXA255 processor).
> The build fails with the following message:
>
> # dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
> cp  /home/jakob/Downloads/Buildroot/output/target/boot/
> cp is missing the destination
> ?cp --help? gives more information.
> make: ***
> [/home/jakob/Downloads/Buildroot/output/build/linux-3.7.8/.stamp_target_installed]
> Error 1

  Probably BR2_LINUX_KERNEL_CUSTOM_DTS_PATH or 
BR2_LINUX_KERNEL_INTREE_DTS_NAME is empty. We should add a check for that.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
