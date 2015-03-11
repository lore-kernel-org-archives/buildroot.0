From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:22:55 +0100
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
	on target
In-Reply-To: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Wed, 11 Mar 2015 12:35:27 +0300")
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <877funmrkw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > If target has connection to the network it might be pretty useful to
 > have telnet connection to it instead of serial console or even in
 > addition to serial console.

 > Even though it's possible to add telnetd on target manually via:
 >  [a] Busybox - with "make busybox-menuconfig" and in "Networking
 > Utilities" select "telnetd"
 >  [b] xinetd

 > Still additional manual steps will be required to allow root login over
 > telnet.

 > With this change it will be possible to get telnetd built and installed
 > on target with only enabling BR2_SYSTEM_STANDALONE_TELNETD option in
 > Buildroot configuration utility or in boards defconfig.

 > Note that telnetd won't auto-start on boot because of securilty concerns
 > - until user manually starts telnetd while connected via serial console
 > there's no chance for unexpected root access to the target (this is
 > especially true if root has no password set - which is by defult).

Any specific reason why you don't just configure a root password and
enable dropbear instead?

-- 
Bye, Peter Korsgaard 
