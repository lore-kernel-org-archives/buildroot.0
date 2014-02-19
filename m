From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 19 Feb 2014 13:10:44 +0100 (CET)
Subject: [Buildroot] [PATCH v2 1/1] ncftp: fix cross-compilation test
In-Reply-To: <20140219002849.1afd4436@skate>
Message-ID: <1036423664.6634177.1392811844408.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

----- Mail original -----
| De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
| ?: "Romain Naour" <romain.naour@openwide.fr>
| Cc: buildroot at busybox.net
| Envoy?: Mercredi 19 F?vrier 2014 00:28:49
| Objet: Re: [Buildroot] [PATCH v2 1/1] ncftp: fix cross-compilation test
| 
| Dear Romain Naour,
| 
| On Wed, 19 Feb 2014 00:18:42 +0100, Romain Naour wrote:
| 
| > Ok, it works.
| > The configure script is regenerated correctly.
| 
| Cool. Does it fix the original problem? I only quickly looked at the
| generated configure script to verify that the cross compiling test is
| correct, but I did not verify that the original problem was really
| solved.

This is what I meant by "it works".
I tested in a Debian chroot where ncurses is not installed.
So, the original problem is solved :)

| 
| > I had problems using NCFTP_AUTORECONF = YES
| > what is the difference?
| 
| ncftp is not fully autotools based: it uses autoconf, but not
| automake.
| And the autoconf invocation needs a special -I path to find the
| aclocal.m4, since it cannot be re-generated using aclocal, because it
| uses some funky m4 macros and I have no idea where are the original
| m4
| files with these macros.

Thanks for your explanations, 
I am not yet familiar with autotools but I progress :)

Best regards,
Romain
