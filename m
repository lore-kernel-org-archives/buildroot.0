From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Tue, 11 Nov 2014 09:43:02 +0000
Subject: [Buildroot] How-to export cross-toolchain and libraries to a
 build server?
In-Reply-To: <20141111102509.56db799d@free-electrons.com>
References: <7b2f2b4d2f704f70a128d64f2b6f461f@DB3PR04MB108.eurprd04.prod.outlook.com>
 <20141111102509.56db799d@free-electrons.com>
Message-ID: <156048fd0d6d4325bbe2ba0ff5b6e9e0@DB3PR04MB108.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

thanks a lot for your quick reply.
I will follow your advice and use BR2_HOST_DIR to fixe SDK location.
So I will have a quick solution to move the SDK to our build server.

I will also take a closer look at the TODO list, and perhaps I could contribute to buildroot to help integrating a relocatable SDK generation, which will be a very nice and useful feature.
But I think, I will have to learn a lot of thinks about the internals of buildroot before.

Best regards

Fabrice

-----Urspr?ngliche Nachricht-----
Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Gesendet: Dienstag, 11. November 2014 10:25
An: Fabrice Mousset | GEOCEPT GmbH
Cc: 'buildroot at busybox.net'
Betreff: Re: [Buildroot] How-to export cross-toolchain and libraries to a build server?

Dear Fabrice Mousset | GEOCEPT GmbH,

On Tue, 11 Nov 2014 07:28:14 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> I have create a Buildroot BSP for the phyCORE-AM335x board based on the PTXdist BSP PD13.1.2 from Phytec.
> This have been done on my working station.
> Now I want to migrate the cross-toolchain, libraries and some binaries like qmake, to our build server (Jenkins).
> What is the best way to do this?

Just tar the contents of output/host. However, beware that right now the SDK is not relocatable, so you'll have to install it to the exact same location on other machines. In general, the default location in output/host is not very nice, so you can use the BR2_HOST_DIR configuration option to change where the host directory gets stored, and therefore put it for example in /opt/buildroot-sdk/, and then tar this.

Making the SDK relocatable is on our TODO list. There is a list of the issues to fix and some possible solutions at http://elinux.org/Buildroot#Core_Buildroot_infrastructure.

> Do I have to enable to "Eclipse support"?

No, the Eclipse support is orthogonal to this. The Eclipse support will only write one line to $HOME/.buildroot-eclipse.toolchains for each Buildroot toolchain that has been built on the system, so that Eclipse cna easily show the available toolchain when the Buildroot Eclipse plug-in is installed.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
