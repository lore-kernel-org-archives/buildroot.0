From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Mon, 8 Mar 2010 10:45:00 -0800 (PST)
Subject: [Buildroot] How to build crosstools-ng and commonc++ POSIX
	framework library
In-Reply-To: <201003072326.15905.yann.morin.1998@anciens.enib.fr>
References: <190455.98316.qm@web44814.mail.sp1.yahoo.com>
	<201003072326.15905.yann.morin.1998@anciens.enib.fr>
Message-ID: <100422.20458.qm@web44804.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thank you for your guidance.? I will explore DESTDIR next weekend and update my build procedure.

Thank you also for your fine work on crosstool-ng.

Jim




________________________________
From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
To: buildroot at busybox.net
Cc: Jim Thomas <jimthomasembedded@yahoo.com>
Sent: Sun, March 7, 2010 4:26:15 PM
Subject: Re: [Buildroot] How to build crosstools-ng and commonc++ POSIX framework library

Hello Jim, All.

On Sunday 07 March 2010 22:00:30 Jim Thomas wrote:
[--SNIP--]
> Install commonc++:

Disclaimer: I know nothing about commonc++.

> Configure commonc++, using exports to avoid 'realloc' compile error, and the prefix for the crosstools:
[--SNIP--]
>? $ ./configure --host=arm-linux --prefix=/home/jthomas/work/libcommonc++-0.6.2/usr

It should be noted that the prefix is the _runtime_ prefix, not the install
directory. Normally, auto-stuff based packages will support the DESTDIR
directive. Use that way:
? ./configure --host=arm-linux --prefix=/usr
? make
? make DESTDIR="/home/jthomas/work/libcommonc++-0.6.2"

This is very important because the path given to --prefix might/will be
hard-coded in the generated files (eg. to search for runtime configuration
files, yo search for resource files...), whereas DESTDIR is just used
during the installation, and thus do not leak into the target files.
? http://www.gnu.org/prep/standards/html_node/DESTDIR.html

[--SNIP--]
> The commonc++ cross-build for ARM was successful.

Well, that was a very detailed tutorial. Great! :-)

> Need to coordinate toolchain build options between Buildroot and
> crosstools-NG for Buildroot package build compatibility.

> Need to coordinate kernel headers version used by Buildroot and
> crosstools-NG.

> Configure Buildroot and crosstools-NG to use the same tarball
> directory, external to both project directories.

There is work under way for buildroot to use crostool-NG as a backend to
generate the toolchains. I am working on that, but it takes much more time
that I expected, and I have much less time available than I expected. :-(

Really, I do apologise for the delay...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? |? ___? ? ? ? ? ? ? |
| +33 223 225 172 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? v? conspiracy.? |
'------------------------------^-------^------------------^--------------------'


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100308/4b20beb1/attachment.htm>
