From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 22:58:48 -0300
Subject: [Buildroot] microperl fixes and improvements
Message-ID: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As Peter noted on IRC libxml-parser-perl and intltool have issues with
the microperl package conversion and bump.

The first problem is hardcoded PERLLIB paths.
This is no longer necessary and actually harmful.

Also implemented a new library search path tweak that SHOULD fix building
on newer ubuntu distributions which use non-conventional library paths.

TODO:

* Rename libxml-parser-perl closer to it's real name XML::Parser
  We can wait until we do more modules since it's host-only for now.

* Make target microperl optionally a fully-fledged perl
  Needs an architecture cache implementation.

* Start adding other useful modules from CPAN
