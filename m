From: Scott Reese <sreese@indianaheart.org>
Date: Tue, 07 Nov 2006 20:11:08 -0500
Subject: [Buildroot] Buildroot on Ubuntu 6.10
Message-ID: <45512EAC.9030703@indianaheart.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Greetings:

Just a warning to the buildroot users.  The newest Ubuntu (6.10 -
released 10/26) has modified /bin/sh.  In previous versions /bin/sh was
a link to bash.  In the newest version it is a link to dash, a smaller,
limited function shell based on bash that Debian developed to use on
their boot floppies.

Dash is missing a lot of functionality that bash contains, and I've been
having a lot of trouble building using it.  Ubuntu's claim is that dash
is a POSIX shell and that if you needed the additional functionality of
bash, you should have used #!/bin/bash instead of #!/bin/sh as the
header in your script.

In any event, just changing the /bin/sh link from dash to bash fixed all
of my problems with no noticeable problems on the workstation.  If
you're having problems building on a Ubuntu 6.10 system, that's a good
place to start.

- -Scott Reese
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFUS6sS7FYdPX6+iYRAsR1AJoCEPiyV44Jg8DuMT6enNMDOcc2lgCfSpCf
+rUBnQADY6gIzTS4n1seeq4=
=BroF
-----END PGP SIGNATURE-----
