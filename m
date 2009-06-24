From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 24 Jun 2009 15:11:44 +0000 (UTC)
Subject: [Buildroot] How to get symbolic debugging to work?
References: <h1p5br$11r$1@ger.gmane.org> <h1r69p$kd5$1@ger.gmane.org>
	<1245830343.3872.9.camel@sven> <871vp94rov.fsf@macbook.be.48ers.dk>
Message-ID: <h1tfng$p7r$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-06-24, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
>
> Sven> We also have problems with gdb 6.8 on the ARM. Or in other
> Sven> words, it just plain does not work. I will now follow your
> Sven> advice and switch to version 6.7.1. If that actually helps,
> Sven> then buildroot should probably select that version when
> Sven> building for an ARM target (similar as what is done currently
> Sven> for AVR32).
>
> Or fix 6.8. I'll take a look at the fedora patches the coming weekend.

I think the underlying problem for my backtrace and SIG32
problems is that gdb (on the dev-host) is failing to figure out
what library files are mmap'ed.  The only one that shows up in
the output of "info files" is ld-uClibc.so.  If you look at
/proc/<pid>/maps on the target, you can see the other library
files (e.g. libgcc_s, libuClibc, libpthread, etc.) that gdb is
unaware of. There's an example of this shown here:

http://news.gmane.org/find-root.php?message_id=%3ch1po1r%24457%241%40ger.gmane.org%3e

-- 
Grant Edwards                   grante             Yow! Mr and Mrs PED, can I
                                  at               borrow 26.7% of the RAYON
                               visi.com            TEXTILE production of the
                                                   INDONESIAN archipelago?
