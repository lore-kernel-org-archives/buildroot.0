From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 08:51:00 +0100
Subject: [Buildroot] Festival on Buildroot
In-Reply-To: <SNT105-DS199722A66CD236B883E6E7EBF00@phx.gbl>
References: <SNT105-DS199722A66CD236B883E6E7EBF00@phx.gbl>
Message-ID: <20110114085100.1a7fcd34@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jan 2011 18:55:08 +0000
Jon Ambrose <jonathan.ambrose@live.uwe.ac.uk> wrote:

> I am trying to get festival compiled by Buildroot, but having no luck
> what so ever. Has anyone got this running?
> 
> I keep on getting errors complaining about linking
> to ../lib/libestools.so libestbase.so "cannot find -lesd"

Well, obviously,  libesd wasn't compiled before festival. And it seems
we don't even have a package for it in Buildroot. So it looks like a
package needs to be created to build the ESD library.

It's a bit odd though, since I remember building festival maybe about a
year ago, and I think it was a least building. But from a quick look,
it really seems to depend on esd.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
