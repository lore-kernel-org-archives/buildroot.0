From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jun 2017 15:19:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] linuxconsoletools: new package
In-Reply-To: <20170620150550.7cbbae30@windsurf.lan> (Thomas Petazzoni's
 message of "Tue, 20 Jun 2017 15:05:50 +0200")
References: <201706191656.v5JGuLc9093352@mx1.sonologic.net>
 <20170619214458.7fe41175@windsurf.home>
 <87a852g8v0.fsf@dell.be.48ers.dk>
 <20170620150550.7cbbae30@windsurf.lan>
Message-ID: <87wp86eqzb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> What is the way forward? Drop the old package and add Config.in.legacy
 >> handling for the old symbols?

 > Thanks for pointing out, I didn't notice there was an overlap with our
 > input-tools package. Our input-tools package references
 > http://linuxconsole.sourceforge.net/ as  the upstream URL, which no
 > longer exists, and fetches a Debian package from 2010 called joystick.
 > All of this is a pretty confusing:

 > Buildroot package name != upstream URL project != Debian package name

 > Since linuxconsoletools provides the three utilities provided by
 > input-tools, has a name matching the upstream project, and uses a more
 > recent version, I would suggest to drop input-tools indeed, and add a
 > Config.in.legacy option that automatically enables linuxconsoletools.

Yes, I agree - The input-tools package is very old and hasn't been
updated in close to 10 years.

Will you send a patch to add the legacy handling or should I?

-- 
Bye, Peter Korsgaard
