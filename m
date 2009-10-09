From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:10:52 +0200
Subject: [Buildroot] [PATCH 03/14] RESEND: handle MMU configuration
In-Reply-To: <20091009120618.GO2266@mx.loc> (Bernhard Reutner-Fischer's
	message of "Fri\, 9 Oct 2009 14\:06\:18 +0200")
References: <87skduj4ut.fsf@macbook.be.48ers.dk>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<20091009115343.0fae0659@surf> <87r5tchkvv.fsf@macbook.be.48ers.dk>
	<20091009113902.GM2266@mx.loc> <87eipchjw9.fsf@macbook.be.48ers.dk>
	<20091009120618.GO2266@mx.loc>
Message-ID: <874oq8hinn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> why would you want to hide most of the package?
 >> 
 >> Because they use fork or other nommu-nono's?

 Bernhard> On a nommu box you'd typically not install KDE or stuff like that.

make randpackageconfig still shouldn't fail. That's the idea behind
kconfig's depends/select handling.

Besides, plenty of non-desktop stuff uses fork() or similar.

 Bernhard> The typical package which will be used on nommu boxes should handle
 Bernhard> fork vs, vfork just fine. If a package does not then this package
 Bernhard> needs to be fixed and the fix sent upstream, obviously.

-- 
Bye, Peter Korsgaard
