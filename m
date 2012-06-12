From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Jun 2012 10:08:27 +0200
Subject: [Buildroot] [PATCH] New package: cJSON (v2)
In-Reply-To: <CANxTyt7PWShWW=7KcysmHxNAQUogw=8fb=+JRDfZuiVAwrQ_Dg@mail.gmail.com>
 (Danomi Manchego's message of "Mon, 11 Jun 2012 20:03:38 -0400")
References: <1338856703-4082-1-git-send-email-danomimanchego123@gmail.com>
 <87txyif9f7.fsf@macbook.be.48ers.dk>
 <CANxTyt7PWShWW=7KcysmHxNAQUogw=8fb=+JRDfZuiVAwrQ_Dg@mail.gmail.com>
Message-ID: <87txyhc5qc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Peter,
 >> I'm not sure it makes sense to build a .so of something as simple (and
 >> unversioned) as this. How about just doing a static .a like ezxml??

 Danomi> We use cJSON in about half a dozen apps in our project, so a
 Danomi> .so seemed like the way to go. ?If you feel strongly about
 Danomi> this, would you be open to having an option to make a shared
 Danomi> object? ?(Maybe something like the logic in zlib.mk or qt.mk.)

cJSON is quite small, so the overhead of dynamically loading it is
probably in the same ballpark:

size cJSON.o
   text	   data	    bss	    dec	    hex	filename
   7047	     16	      8	   7071	   1b9f	cJSON.o

But ok, I don't feel strongly about it. If you prefer .so, then keep it
like that.

-- 
Bye, Peter Korsgaard
