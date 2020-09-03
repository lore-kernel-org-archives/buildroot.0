From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:50:15 +0200
Subject: [Buildroot] [PATCH 2/4] odroidc2_atf: new Package
In-Reply-To: <20200717164643.4702-2-daggs@gmx.com>
References: <20200717164643.4702-1-daggs@gmx.com>
 <20200717164643.4702-2-daggs@gmx.com>
Message-ID: <20200903205015.250c7dc3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dagg,

On Fri, 17 Jul 2020 19:46:41 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> introduce a package that holds the ATF for AmLogic's Odroid C2 boards
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

So I applied this patch, but after doing significant rework:

 - Instead of using your own custom repository, I used the Hardkernel
   U-Boot repository as a source.

 - I changed to a target package instead of a host package. I agree it
   builds a host tool, but it also installs a bunch of firmware files
   for the target, and that felt more "important" to me than the host
   tool. Of course, this can be a never-ending discussion, as it's
   difficult to draw the line.

 - Renamed to odroidc2-firmware.

See the final commit at:

  https://git.buildroot.org/buildroot/commit/?id=f0de62b7066c58a88207f0edf98ae49a23649421

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
