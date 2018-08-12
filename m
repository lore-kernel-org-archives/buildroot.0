From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 09:41:15 +0200
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <CANQCQpZXCEBy-sxPm+dbHELJm5AD8+Mc9Q2o=C2nUFfgSenViQ@mail.gmail.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <20180810225051.4f34fb06@windsurf>
 <CANQCQpYDuFNMYrwmWiJefh89NjOMoABQwCSne1sM1=-Kcjt9vA@mail.gmail.com>
 <20180811122954.15470d8a@windsurf>
 <CANQCQpZXCEBy-sxPm+dbHELJm5AD8+Mc9Q2o=C2nUFfgSenViQ@mail.gmail.com>
Message-ID: <20180812094115.1a17f172@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Aug 2018 22:55:47 -0500, Matthew Weber wrote:

> I started to look at this tonight and if I understand the current
> wrapper, it's solely working with cc/gcc.  If someone explicity uses
> ld, the wrapper doesn't take affect? (I'll do a build tomorrow and
> look at behavior, didn't have a linux machine handy tonight to check.

We only wrap gcc/cc indeed. Packages should not call "ld" directly, as
it breaks a bunch of other situations. For example, on mips64, using
"ld" directly doesn't work as it needs to be passed the "machine
emulation", which gcc does.

So I don't think we need to wrap "ld", as ld shouldn't be used
directly. The only packages that should use "ld" directly are things
like the Linux kernel or bootloaders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
