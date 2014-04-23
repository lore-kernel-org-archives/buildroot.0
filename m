From: Pascal =?ISO-8859-1?Q?H=FCrst?= <pascal.huerst@gmail.com>
Date: Wed, 23 Apr 2014 16:21:46 +0200
Subject: [Buildroot] Adding google-breakpad to buildroot
Message-ID: <1398262906.30640.4.camel@mbpro.localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

we are planing to add google-breakpad to buildroot. 

From the project description at
http://code.google.com/p/google-breakpad/:  

[...] "Breakpad is a library and tool suite that allows you to
distribute an application to users with compiler-provided debugging
information removed, record crashes in compact "minidump" files, send
them back to your server, and produce C and C++ stack traces from these
minidumps." [...]

Adding a package to buildroot is easy, but in this case we will have to
find a way to extract all symbols from the target binaries, before they
get stripped. My idea was to add a new target to the Makefile, just
before "target-finalize:" and check against an option in the config
like:

ifeq ($(BR2_ENABLE_BREAKPAD),y)
        TARGETS+=target-generate-breakpad-symbols
endif

and then:

target-generate-breakpad-symbols:
        extract symbols and deploy result to output/images 

Is this basically the way to go, or is there a better way to achieve
this?

regards,
pascal
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140423/eebac11d/attachment.asc>
