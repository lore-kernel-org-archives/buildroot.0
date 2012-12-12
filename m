From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 12 Dec 2012 16:26:46 +0100
Subject: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault
In-Reply-To: <50C5C08D.407@zacarias.com.ar>
References: <BCF3711885AE41AB966E9545FDB3C8D6@JohanW7>
 <50C54E15.1030008@zacarias.com.ar> <97E0CBC5EB794A11A2835644E2E3CC1D@JohanW7>
 <50C5C08D.407@zacarias.com.ar>
Message-ID: <7EE27C3F912F450282DD2DE63A6A7FED@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi

I was using the newer pthreads implementation,
The old/stable pthreads are working for both lsusb (usbutils) and for usb_modeswitch with uClibc 0.9.33
I did not try NTPL since this breaks the build of GDB.

I am not sure about what packages need the newer pthreads and what need the older/stable version.

Regards, Johan

 

-----Oorspronkelijk bericht-----
Van: Gustavo Zacarias [mailto:gustavo at zacarias.com.ar] 
Verzonden: maandag 10 december 2012 11:59
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault

On 12/10/2012 07:57 AM, Sagaert Johan wrote:

> Hi
> 
> I am using buildroot's internal toolchain gcc 4.6.3 and uClibc 
> 0.9.33.3 and I the pthreads library.

Which threading implementation are you using? linuxthreads, linuxthreads
(stable/old) or Native POSIX Threading (NPTL) ?
NPTL should be the safe bet, i don't know how good/bad the others work on later versions of uClibc.
Regards.
