From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Apr 2010 20:47:14 +0200
Subject: [Buildroot] [PATCH] toolchain/binutils: Improve arm linking
	performance
In-Reply-To: <1271698792-31760-1-git-send-email-lwalkera@ieee.org> (Laine
	Walker-Avina's message of "Mon, 19 Apr 2010 10:39:52 -0700")
References: <1271698792-31760-1-git-send-email-lwalkera@ieee.org>
Message-ID: <878w8jcma5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Laine" == Laine Walker-Avina <lwalkera@ieee.org> writes:

 Laine> Backported a patch from CVS that improves linking times for large
 Laine> projects (eg 700s to 6s). See
 Laine> http://old.nabble.com/-PATCH--Reduce-ARM-linking-time-tt27961038.html
 Laine> for the original.
 Laine> ---
 Laine>  toolchain/binutils/2.20/400-arm_link_speed.patch |  179 ++++++++++++++++++++++

Nice, but why not add it to 2.20.1 instead?

 Laine> + #define bfd_elf32_bfd_final_link		elf32_arm_final_link
 Laine> + 
 Laine> + #define elf_backend_get_symbol_type             elf32_arm_get_symbol_type
 Laine> +Only in binutils-2.20/bfd: .elf32-arm.c.swp

You might want to get rid of that line.

-- 
Bye, Peter Korsgaard
