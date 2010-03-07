From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Mar 2010 16:04:02 +0100
Subject: [Buildroot] Login troubles
In-Reply-To: <4B93A1AE.8070406@iwtech.com.au>
References: <4B93A1AE.8070406@iwtech.com.au>
Message-ID: <20100307160402.09f0825a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

On Sun, 07 Mar 2010 23:53:02 +1100
Paul Jones <paul.jones@iwtech.com.au> wrote:

> I've just built a basic buildroot for my mini2440 ARM board and it 
> successfully boots to the buildroot login: prompt.
> My problem is that I can't seem to login - I haven't touched any of
> the config files and looking at /etc/passwd|shadow the login should
> be root with a blank password?

Right, no password, just press enter.

> I've tried to login both from the serial console (which I set in the 
> buildroot menu to /dev/ttySAC0) and the normal console with a usb 
> keyboard - no luck.

> buildroot login: root
> Password:
> Login incorrect

Are you sure that you haven't made any change to /etc/securetty ? It
must contain at least /dev/ttySAC0 to allow login as root from this
console. The default target skeleton has a /etc/securetty that
contains /dev/ttySAC0, so it should be ok, unless you made any change
to the skeleton, of course, or used a different skeleton.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
