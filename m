From: David Peverley <pev@sketchymonkey.com>
Date: Wed, 17 Aug 2011 13:15:29 +0100
Subject: [Buildroot] Logging output from init
Message-ID: <CALGOZk078HSZEY-bnrFxC+i38OgGVrE8EUHK9xkoMcKG=nfQMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

I'm running a system where it's pretty similar to the latest
buildroot-2011.05. My init calls an rcS that loops through individual
scripts from init.d as in the skeleton :
  fs/skeleton/etc/init.d/rcS

What I want to do is log the output from the scripts run so I can
check the output on remote boards. It seems the obvious way to do so
would be to use logger (from busybox). Digging around the interweb it
seems some people invoke it as follows :

  for i in /etc/init.d/S??* ;do
    ...
  done |  logger -s -p 6 -t sysinit

This is great in theory, but there are various scripts in my init.d
that background processes which keep stdout open (and I don't have the
option to change them). Effectively this means rcS never completes...
I know I could background the whole loop but I don't want to do that
(I *do* need to wait for it to complete) I'd be happy if I could
temporarily redirect stdout to logger and then stop the redirection
after the loop completes - it's not tidy or good but it would work
enough for my purposes but I can't see a way to do so.

I can't be the only person to have come up against this - is there an
elegant solution others have found before? Is there alternately
another way to achieve this and am I making life for myself overly
tricky?!

Cheers! :-D

~Pev
