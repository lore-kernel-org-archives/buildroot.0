From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 19:44:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.0
In-Reply-To: <20200229070506.48605-1-james.hilliard1@gmail.com>
References: <20200229070506.48605-1-james.hilliard1@gmail.com>
Message-ID: <20200808194440.67c274f9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Feb 2020 00:05:06 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Remove patch that is no longer needed as of upstream commit
> 1c33be992e8120abd20add8021e4d91d226f5b6a which removed the old VM.
> 
> We need to add an exclusion rule for guile modules to check-bin-arch as
> they appear as valid ELF binaries but with an architecture of "None".
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I've applied to next after:

 - Updating to 3.0.4, which was released in the mean time

 - Changing the logic in check-bin-arch to ignore files in
   /usr/lib/guile rather than all .go files that have a "None" machine
   type.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
