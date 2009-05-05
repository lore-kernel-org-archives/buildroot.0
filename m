From: angus salkeld <angus.salkeld@alliedtelesis.co.nz>
Date: Tue, 05 May 2009 22:52:00 +1200
Subject: [Buildroot] [PATCH] gcc-4.3.3: add a patch to link with	 the
	math lib to	 get copysignal (updated)
Message-ID: <4A00C3110200007000014C7F@gwia.alliedtelesyn.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

For my powerpc-603e build I did have SOFT_FLOAT off, but multilib on.
If I turn multilib off then I can also build without this patch.

So the logic looks like:
powerpc && shared-libgcc_s && (soft-float || multilib)

I'll send in a new patch with the new logic in the morning.

Regards 
Angus Salkeld


 angus> I have just tried powerpc-603e and it has the same problem, so
 angus> I have altered the logic slightly.

 angus> Conditionally apply the following patch by Bernhard Reutner-Fischer which
 angus> solves a link error on powerpc when using a shared libgcc_s

Peter> .. and BR2_SOFT_FLOAT I guess? Without soft float it works fine here
Peter> (why would you not use the hardware FPU of the 603e)?
