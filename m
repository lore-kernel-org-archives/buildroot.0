From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:07:23 +0200
Subject: [Buildroot] [PATCH 1/2] autobuild-run: create reason file on
 build failures
In-Reply-To: <20190622174449.4340-1-itsatharva@gmail.com>
References: <20190622174449.4340-1-itsatharva@gmail.com>
Message-ID: <20190622200723.1810910f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jun 2019 23:14:48 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> When a build fails, we calculate the reason of failure on
> the server side as well as client side. To solve this redundancy
> we only calculate on the client side and submit a file which
> contains the reason of failure.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

This should have been two separate commits:

 - One making autobuild-run generate the reason file, with the logic to
   calculate the reason as it exists today

 - A second one that improves the reason calculation logic to take into
   account the BR2_REPRODUCIBLE=y case

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
