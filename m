From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Oct 2012 11:00:47 +0200
Subject: [Buildroot] [PATCH] mxs-bootloader: Barebox entry point symbol
	changed in 2012.08
In-Reply-To: <50805E2A.1010308@mind.be> (Arnout Vandecappelle's message of
 "Thu, 18 Oct 2012 21:53:14 +0200")
References: <1350547326-31407-1-git-send-email-maxime.ripard@free-electrons.com>
 <50805E2A.1010308@mind.be>
Message-ID: <877gqmx2dc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> load barebox;
 >> -        load ivt (entry = barebox:exception_vectors)>  0x8000;
 >> +        load ivt (entry = barebox:start)>  0x8000;
 >> hab call 0x8000;
 >> 
 >> }

 Arnout>  Shouldn't this somehow depend on the selected barebox version then?

Indeed. What happens if people use <2012.08?

-- 
Bye, Peter Korsgaard
