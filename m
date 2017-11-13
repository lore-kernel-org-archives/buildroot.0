From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:23:49 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <d632b876-9cbe-bbec-5195-d383b6ebd440@grandegger.com> (Wolfgang
 Grandegger's message of "Mon, 13 Nov 2017 19:04:47 +0100")
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home>
 <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
 <87d14ms2x2.fsf@dell.be.48ers.dk> <20171113173611.GB2861@scaer>
 <d632b876-9cbe-bbec-5195-d383b6ebd440@grandegger.com>
Message-ID: <87375i53my.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:

 > Hello,
 > Am 13.11.2017 um 18:36 schrieb Yann E. MORIN:
 >> Peter, All,
 >> 
 >> On 2017-11-13 14:50 +0100, Peter Korsgaard spake thusly:
 >>>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
 >>> > This means: A symbolic link would work.
 >>> Ok, great - Makes sense. I wonder how much effort it wil be to get
 >>> binutils to generate symbolic links instead of hard links.
 >> 
 >> No way.

 > Well, the attached patch fixes the issue with the binary utilities (ld,
 > ar, objdump, as, ...). I think only the fixes in "binutils/Makefile.in" and
 > "gas/Makefile.in" are need, IIRC. And in the fixes did not break the
 > build, at least. Will do more checks...

Yes, either something like that or do something to cause the ln to fail
as it then falls back to use install (E.G. sed 's/\bln\b/false/' symlink
ln to false and stick that in the path).

The best solution would naturally be something that we could upstream,
E.G. way to configure the ln command to be used, but I don't know how
open upstream would be to that.

-- 
Bye, Peter Korsgaard
