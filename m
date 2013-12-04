From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Dec 2013 13:33:06 +0100
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <529EFEBA.8040103@zacarias.com.ar>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
 <1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>
 <20131204094419.6d4d4279@skate> <529EFEBA.8040103@zacarias.com.ar>
Message-ID: <20131204133306.7e7e8e07@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 04 Dec 2013 07:06:50 -0300, Gustavo Zacarias wrote:

> Version freedom to begin with, for the system emulation you sometimes
> need a special version (example: sparc won't work with 1.7.0) that might
> not be the latest. You might also want this freedom for user emulation,
> but then nobody guarantees you'll match system for a given architecture.
> Then i also don't know what to do with the user variant, if it's going
> to be used for anything or what (it's an orphan now) - maybe killing
> user is an option and replace it by system?

Yes, I agree, the user mode emulation should probably be removed. It
simply cannot work properly, because we have no way of guaranteeing
that the kernel headers used for the target toolchain are older than
the kernel running on the system.

And even if we want to keep the user mode emulation, I think there
should be one single package. Nothing prevents from having sub-options
to enable either the user mode or system mode emulation, or both, or to
have a version selection.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
