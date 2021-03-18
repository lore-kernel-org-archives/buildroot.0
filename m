From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Mar 2021 21:08:23 +0000
Subject: [Buildroot] [Bug 13621] Buildroot builds for i686 even though i486
 is selected
In-Reply-To: <bug-13621-163@https.bugs.busybox.net/>
References: <bug-13621-163@https.bugs.busybox.net/>
Message-ID: <bug-13621-163-amEeEuRmV3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13621

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to moelzerjens from comment #0)

The buildroot kernel configure/make is called with the correct 'ARCH=i386' and
uses the kernel i386_defconfig without further specification of CPU type, which
defaults from the linux kernel configure (see e.g.
build/linux-5.11/arch/x86/Kconfig.cpu) to M686:

  choice
        prompt "Processor family"
        default M686 if X86_32
        default GENERIC_CPU if X86_64

For workaround specify the correct CPU either by configuring a custom linux
kernel config/defconfig file (or configure by 'make linux-menuconfig')...

Maybe something which can be improved in buildroot..., on the other side a very
special use-case ;-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
