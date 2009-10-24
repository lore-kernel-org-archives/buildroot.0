From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 24 Oct 2009 11:18:55 +0200
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <87eiot1fea.fsf@macbook.be.48ers.dk>
Message-ID: <C14F9A0CE21B40B59ECA6069CB9213D8@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi

I already upgraded the m4 package to use 1.4.13 and that does not help ...
Will have to do more checks, it seems several guys have this problem.

Johan  

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: zaterdag 24 oktober 2009 8:21
Aan: Sagaert Johan
CC: 'Peter Korsgaard'; buildroot at busybox.net
Onderwerp: Re: [Buildroot] Autoconf still not building (M4 ) results

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> The logfile with ok suffix is the one run manually.

 Sagaert> The PATH is diffferent when running through buildroot make
compared with  Sagaert> manual run of ./configure with the same options.

Exactly, that's the whole point. We build our own m4 version in
output/host/usr/bin. Maybe a fix is to upgrade our m4 version, but I would
prefer to understand the problem first.

 Sagaert> I still have no explanation why this 'bug' does not show up on my
debian  Sagaert> machine.

Presumably because Ubuntu is odd/different/newer than other dists?

The config.log output is not very verbose, so you'll need to do the
configure tests by hand to see what fails - E.G.:

output/usr/vin/m4 -F conftest.m4f </dev/null should not output anything and
produce a conftest.m4f file.

echo 'changequote(<,>)indir(<ifdef>,mac,bug)patsubst(a,\(b\)\|\(a\),\1)dnl'
|\
 output/host/usr/bin/m4 --trace=mac

should not output anything.

Could you test that?

--
Bye, Peter Korsgaard
