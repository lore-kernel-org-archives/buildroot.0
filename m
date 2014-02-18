From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 00:28:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] ncftp: fix cross-compilation test
In-Reply-To: <5303EA52.8030803@openwide.fr>
References: <1392762712-29657-1-git-send-email-romain.naour@openwide.fr>
 <20140218235950.6bc82d6e@skate> <5303EA52.8030803@openwide.fr>
Message-ID: <20140219002849.1afd4436@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 19 Feb 2014 00:18:42 +0100, Romain Naour wrote:

> Ok, it works.
> The configure script is regenerated correctly.

Cool. Does it fix the original problem? I only quickly looked at the
generated configure script to verify that the cross compiling test is
correct, but I did not verify that the original problem was really
solved.

> I had problems using NCFTP_AUTORECONF = YES
> what is the difference?

ncftp is not fully autotools based: it uses autoconf, but not automake.
And the autoconf invocation needs a special -I path to find the
aclocal.m4, since it cannot be re-generated using aclocal, because it
uses some funky m4 macros and I have no idea where are the original m4
files with these macros.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
