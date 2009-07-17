From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Jul 2009 22:50:35 +0200
Subject: [Buildroot] [PATCH 3/8] external toolchain: use LANG=C when
	calling gcc -v
In-Reply-To: <fd5570970e1a488815b8ca94b516f92901cefacb.1247819731.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri\,
	17 Jul 2009 10\:35\:30 +0200")
References: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
	<cover.1247819731.git.thomas.petazzoni@free-electrons.com>
	<fd5570970e1a488815b8ca94b516f92901cefacb.1247819731.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ocrjhw4k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Lionel Landwerlin <lionel.landwerlin@openwide.fr> reported that using
 Thomas> the external toolchain support when LANG=fr_FR.UTF-8 doesn't work,
 Thomas> since the messages printed by gcc -v are translated in another
 Thomas> language, defeating the grep ^Configured test.

 Thomas> Therefore, as per Lionel suggestion, we force LANG=C when calling
 Thomas> $(TARGET_CC) -v.

I use LANG=C/en_US myself, but wouldn't it make sense to fix this
globally in the main Makefile instead as we might have similar
problems other places? The only disadvantage I can think of is that
the users will get error messages in English (but that's a good thing
when they send logs to us).

Could someone with a different locale test that please? E.G. add an:

export LANG=C

To the toplevel Makefile.

-- 
Bye, Peter Korsgaard
