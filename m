From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 10:25:09 +0100
Subject: [Buildroot] How-to export cross-toolchain and libraries to a
 build server?
In-Reply-To: <7b2f2b4d2f704f70a128d64f2b6f461f@DB3PR04MB108.eurprd04.prod.outlook.com>
References: <7b2f2b4d2f704f70a128d64f2b6f461f@DB3PR04MB108.eurprd04.prod.outlook.com>
Message-ID: <20141111102509.56db799d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabrice Mousset | GEOCEPT GmbH,

On Tue, 11 Nov 2014 07:28:14 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> I have create a Buildroot BSP for the phyCORE-AM335x board based on the PTXdist BSP PD13.1.2 from Phytec.
> This have been done on my working station.
> Now I want to migrate the cross-toolchain, libraries and some binaries like qmake, to our build server (Jenkins).
> What is the best way to do this?

Just tar the contents of output/host. However, beware that right now
the SDK is not relocatable, so you'll have to install it to the exact
same location on other machines. In general, the default location in
output/host is not very nice, so you can use the BR2_HOST_DIR
configuration option to change where the host directory gets
stored, and therefore put it for example in /opt/buildroot-sdk/, and
then tar this.

Making the SDK relocatable is on our TODO list. There is a list of the
issues to fix and some possible solutions at
http://elinux.org/Buildroot#Core_Buildroot_infrastructure.

> Do I have to enable to "Eclipse support"?

No, the Eclipse support is orthogonal to this. The Eclipse support will
only write one line to $HOME/.buildroot-eclipse.toolchains for each
Buildroot toolchain that has been built on the system, so that Eclipse
cna easily show the available toolchain when the Buildroot Eclipse
plug-in is installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
