From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 11 Mar 2015 16:44:22 +0000
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
	on target
In-Reply-To: <877funmrkw.fsf@dell.be.48ers.dk>
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
 <877funmrkw.fsf@dell.be.48ers.dk>
Message-ID: <1426092262.2375.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, 2015-03-11 at 17:22 +0100, Peter Korsgaard wrote:
> >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
>  > If target has connection to the network it might be pretty useful to
>  > have telnet connection to it instead of serial console or even in
>  > addition to serial console.
> 
>  > Even though it's possible to add telnetd on target manually via:
>  >  [a] Busybox - with "make busybox-menuconfig" and in "Networking
>  > Utilities" select "telnetd"
>  >  [b] xinetd
> 
>  > Still additional manual steps will be required to allow root login over
>  > telnet.
> 
>  > With this change it will be possible to get telnetd built and installed
>  > on target with only enabling BR2_SYSTEM_STANDALONE_TELNETD option in
>  > Buildroot configuration utility or in boards defconfig.
> 
>  > Note that telnetd won't auto-start on boot because of securilty concerns
>  > - until user manually starts telnetd while connected via serial console
>  > there's no chance for unexpected root access to the target (this is
>  > especially true if root has no password set - which is by defult).
> 
> Any specific reason why you don't just configure a root password and
> enable dropbear instead?

Well I though of telnet as an essential replacement of serial console
especially for development boards.

So my main intention was to get the most convenient tool for wide range
of developers. 

For example in Windows if I'm not mistaken Telnet client is available
right from MS, while SSH client is always 3rd-party program like Putty. 

Also ability to not set password is convenient here - because people
will ask "what's the password" otherwise. Still in case of devboards we
have limited access to the network for foreigners so we may not care
much about paranoid safety.

Indeed your proposal may work if my motivation is not convincing enough.

-Alexey
