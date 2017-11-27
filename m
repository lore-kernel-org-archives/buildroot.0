From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 23:52:18 +0100
Subject: [Buildroot] [PATCH 2/3] package/dvb-apps: is not parallel-safe
In-Reply-To: <a5cb242853434b99a016d430dc3030ba10602d09.1511779719.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 27 Nov 2017 11:48:55 +0100")
References: <cover.1511779719.git.yann.morin.1998@free.fr>
 <a5cb242853434b99a016d430dc3030ba10602d09.1511779719.git.yann.morin.1998@free.fr>
Message-ID: <87r2sj9vx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This is invisible because the timings make it excessively difficult to
 > hit, but the Makefile is inherently flawed for parallel build, as it
 > contains:

 >     $(objects): atsc_psip_section.c atsc_psip_section.h

 >     atsc_psip_section.c atsc_psip_section.h:
 >         perl section_generate.pl atsc_psip_section.pl

 > and the perl script section_generate.pl will create both the .c and .h
 > files in one go, but given the construct above, there can be two such
 > script that run in parallel, which can clobber the generated .c and/or
 > .h files.

 > So, make dvb-apps a MAKE1 package.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > The time to build increased by one third, from ~7.5s to ~10s, on a
 > core-i7 quad-core, which is not much in the end, and totally acceptable.

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
