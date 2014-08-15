From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Aug 2014 00:18:00 +0200
Subject: [Buildroot] [PATCH 2/2 v3] support/download: fix the git helper
	output file format
In-Reply-To: <20140815172816.GA22918@free.fr> (Yann E. MORIN's message of
 "Fri, 15 Aug 2014 19:28:16 +0200")
References: <cover.1407343550.git.yann.morin.1998@free.fr>
 <2205cccc9b1580208e604067224448da94599151.1407343550.git.yann.morin.1998@free.fr>
 <87ppg11xdg.fsf@dell.be.48ers.dk> <20140815172816.GA22918@free.fr>
Message-ID: <87lhqp1jon.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > -gzip "${output}"
 >> > +gzip <"${output}.tmp" >"${output}"
 >> 
 >> Don't we then end up with a bunch of foo.tmp files?

 > Nope, because the wrapper scripts first 'cd' into a temp dir, that ets
 > removed at the end of the wrapper.

 > See:
 >     http://git.buildroot.org/buildroot/tree/support/download/wrapper#n42
 > and:
 >     http://git.buildroot.org/buildroot/tree/support/download/wrapper#n91

Ahh yes, good - Thanks.

-- 
Bye, Peter Korsgaard
