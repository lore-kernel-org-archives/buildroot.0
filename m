From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 18:05:31 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
 helloworld module be compiled and added to the tartget with a local
 external source
In-Reply-To: <A6242A8294D64D7AB6880414BDC9F71C@NKDELL>
References: <20131119152923.1d5efac0@skate>
 <A6242A8294D64D7AB6880414BDC9F71C@NKDELL>
Message-ID: <20131119180531.56fe828f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nils Koehler,

On Tue, 19 Nov 2013 17:59:47 +0100, Nils Koehler wrote:

> > There is no such thing as a /Build/ directory in Buildroot. Maybe
> > you're talking about output/build/helloworld-1.0/, right?
> 
> ...sorry yes... /buildroot-2013.08/output/Build/helloworld-1.0/

Sorry, this still doesn't exist. I know I'm nitpicking, but
output/Build and output/build are two different things. output/Build
doesn't exist, while output/build does exist. May I suggest you to
copy/paste file paths instead of manually re-writing them and adding
mistakes in them?

See what I was saying earlier:

> > Please be *precise* in the paths you give. Even a single character
> > difference... makes a complete difference.


> > It should be:
> > 
> > 	$(INSTALL) -D -m 0755 $(@D)/helloworld $(TARGET_DIR)/bin/helloworld
> 
> 
> After that change helloworld is still not available in
> /buildroot-2013.08/output/target/bin/

Hum, strange.

> > If it still doesn't work, please post the file named "build.log" after
> > executing:
> > 
> > make helloworld-rebuild 2>&1 | tee build.log
> 
> I have attached the build.log file
> 
> I saw that inside:
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers
> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_users_table.txt
> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target >>
> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
> Zeile 363: [: helloworld: Ganzzahliger Ausdruck erwartet.
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
> Zeile 370: [: helloworld: Ganzzahliger Ausdruck erwartet.
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
> Zeile 394: [: foo: Ganzzahliger Ausdruck erwartet.
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
> Zeile 402: [: foo: Ganzzahliger Ausdruck erwartet.

That's in German, and I unfortunately don't read German. Please run your
build with "LANG=C make ..." so that we get error messages in english.

Moreover, this is not the useful part of the build log. Please run:

  make helloworld-rebuild 2>&1 | tee build.log

Then paste the *entire* output to http://code.bulix.org, and then send
us the URL at which it was posted.

Also, please post on http://code.bulix.org your entire .mk file, and
give us the URL at which it was posted.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
