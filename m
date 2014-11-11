From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Tue, 11 Nov 2014 12:10:22 +0000
Subject: [Buildroot] How-to export cross-toolchain and libraries to a
 build server?
In-Reply-To: <20141111104957.251e3809@free-electrons.com>
References: <7b2f2b4d2f704f70a128d64f2b6f461f@DB3PR04MB108.eurprd04.prod.outlook.com>
 <20141111102509.56db799d@free-electrons.com>
 <156048fd0d6d4325bbe2ba0ff5b6e9e0@DB3PR04MB108.eurprd04.prod.outlook.com>
 <20141111104957.251e3809@free-electrons.com>
Message-ID: <20833d047f3d4434b8eb867b1a46b526@DB3PR04MB108.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

it works :-)

I have built my BSP with BR2_HOST_DIR (make BR2_HOST_DIR=/opt/crosstools/am335x) and made an archive of it (tar cJf am335x-sdk.tar.xz /opt/crosstools/am335x). Then expand this archive on the build server.
And it simply works, Jenkins is now able to build Qt5 projects for my board.
The SDK is quiet big (about 57MB), but it is a simple and quick solution.
I will try to spend time on "relocatable SDK generation" in the next weeks to see if an easier/smarter solution is possible.

Thanks a lot for your support

Best regards

Fabrice

-----Urspr?ngliche Nachricht-----
Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Gesendet: Dienstag, 11. November 2014 10:50
An: Fabrice Mousset | GEOCEPT GmbH
Cc: 'buildroot at busybox.net'
Betreff: Re: [Buildroot] How-to export cross-toolchain and libraries to a build server?

Dear Fabrice Mousset | GEOCEPT GmbH,

On Tue, 11 Nov 2014 09:43:02 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> thanks a lot for your quick reply.
> I will follow your advice and use BR2_HOST_DIR to fixe SDK location.
> So I will have a quick solution to move the SDK to our build server.

Ok. Let us know if that works.

> I will also take a closer look at the TODO list, and perhaps I could contribute to buildroot to help integrating a relocatable SDK generation, which will be a very nice and useful feature.
> But I think, I will have to learn a lot of thinks about the internals of buildroot before.

Sure, your contributions would be very welcome! But indeed, working on making the SDK relocatable is clearly not the easiest thing to get started with the Buildroot internals.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
