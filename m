From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Sun, 12 Oct 2014 02:55:57 +0200
Subject: [Buildroot] libdaemons localstatedir /usr/var
Message-ID: <5439D19D.2030706@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a package which uses libdaemon for running as a daemoon and for 
creating the pid file. libdaemons default directory for opening the pid 
file is /usr/var/run. However, buildroot does not create this directory 
in the output directory by default. The package compiles successfully 
but fails to run because of the missing directory.

How should I deal with this?

1) patch libdaemon.mk: LIBDAEMON_CONF_OPTS = ... --localstatedir=/var
2) add /usr/var/run to my rootfs overlay directory

What do you think? Any other suggestions?


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141012/e99f62df/attachment.html>
