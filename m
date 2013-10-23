From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Oct 2013 13:54:01 +0200
Subject: [Buildroot] git packages and revision number length
Message-ID: <CAAXf6LUjx9RjkCQDbO+O3EZfFPPYNW-5hQUpANG9jCgekokbpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The buildroot manual says:
http://buildroot.uclibc.org/downloads/manual/manual.html#github-download-url

"When using a commit ID as version, usually the first 7 characters of
the SHA1 are enough."


I disagree with that. The first 7 characters do not guarantee that a
few years from now their will not be an ambiguity in that project,
where two revisions have the same 7 initial characters.

Shortened revision numbers are great in communication (verbal, mail,
IRC, ...) but should not be committed in a build system that is
supposed to create reproducible builds over a long-term lifespan.

We can start discussing statistics, about how many years it takes on
average for a clash to occur with a given revision number length, but
the fact is that it is possible to have a clash by tomorrow. Only the
chances are much smaller with increasing lengths.

So I propose to change that recommendation (and the packages that use
it) and use the full 40-hex-char revision numbers.

Best regards,
Thomas
