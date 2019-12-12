From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 11:41:18 +0100
Subject: [Buildroot] uClibc building fails: was [RE: [arc-buildroot]
 [autobuild.buildroot.net] Your daily results for 2019-12-11]
In-Reply-To: <CY4PR1201MB0120A08931AEE94D5DC5F8BEA1550@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB0120A08931AEE94D5DC5F8BEA1550@CY4PR1201MB0120.namprd12.prod.outlook.com>
Message-ID: <20191212114118.15b4a606@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

On Thu, 12 Dec 2019 09:23:04 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> And the solution is as simple as installation of the locale.
> On Debian/Ubuntu this could be done this way:
> ------------------------------------>8--------------------------------  
> $ sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
> $ locale-gen
> ------------------------------------>8--------------------------------  
> 
> From here http://autobuild.buildroot.net/results/d1b45b78b94387a7b15be7caec64847bd04af0f1/submitter
> it looks like that's some Bootlin owned machine:
> ------------------------------------>8--------------------------------  
> Thomas Petazzoni (Bootlin server)
> ------------------------------------>8--------------------------------  
> 
> Any possibility to check what's wrong with locales there?

Thanks for the heads up on this, it has been on my TODO list for a
while.

Since we bumped the host gcc requirement to gcc 4.8, I installed a
different Debian chroot (based on Debian Jessie) on my autobuilder, and
since it's a new installation, I did have any UTF-8 locale enabled.
I've done that now, which should hopefully fix the uClibc build.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
