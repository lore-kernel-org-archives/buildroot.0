From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 09:50:23 +0200
Subject: [Buildroot] [PATCH 50/53] udpcast: add license information
In-Reply-To: <53B339ED.6030905@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 01 Jul 2014 19:45:01 -0300")
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
 <1403810481-10025-50-git-send-email-gustavo@zacarias.com.ar>
 <874mz0em4e.fsf@dell.be.48ers.dk> <53B339ED.6030905@zacarias.com.ar>
Message-ID: <87r424ci80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 07/01/2014 07:43 PM, Peter Korsgaard wrote:
 >> fec.c::fec_license() lists it as GPLv2+, so I've fixed that and
 >> committed, thanks.

 > Careful there, look at COPYING.

Yes, it's not really clear. From COPYING:

The bulk of the code (everything except fec.c) is covered by the GPL 2.0
licence (See http://www.gnu.org/licenses/gpl.txt)

Fec.c is covered by a BSD-like licence

From fec_licence() (which gets printed to the user when they request the
license details of the udpcast utilities):

          "   udpcast and its FEC code are free software\n"
          "\n"
          "   you can redistribute udpcast core functionality and/or\n"
          "   it them under the terms of the GNU General Public License as\n"
          "   published by the Free Software Foundation; either version 2 of\n"
          "   the License, or (at your option) any later version.\n"
...

          "the FEC code is covered by the following license:\n"
          "fec.c -- forward error correction based on Vandermonde matrices\n"


So the question is if the license should be

BSD-2c (fec.c), GPLv2+ (rest)

or

BSD-2c (fec.c), GPLv2 (rest)


Sticking to GPLv2 is safest, but I say the license info that gets
printed to the user is more "important" than what a source file says.

Comments?

-- 
Bye, Peter Korsgaard
