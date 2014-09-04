From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Sep 2014 22:39:33 +0200
Subject: [Buildroot] [PATCH 2/2] setserial: Disable manpages
In-Reply-To: <54088422.8060507@imgtec.com> (Vicente Olivert Riera's message of
 "Thu, 4 Sep 2014 16:24:18 +0100")
References: <1409829526-49853-1-git-send-email-Vincent.Riera@imgtec.com>
 <1409829526-49853-2-git-send-email-Vincent.Riera@imgtec.com>
 <87a96fs96p.fsf@dell.be.48ers.dk> <54088422.8060507@imgtec.com>
Message-ID: <878ulzqfwa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 >> > +-all: setserial setserial.cat
 >> > ++all: setserial
 >> 
 >> As far as I can see, nroff is only used for setserial.cat, and
 >> setserial.cat is not installed / used anywhere, so just patching this
 >> line is enough and the rest of the patch can get dropped.

 > Don't you prefer to completely get rid of the manual pages?

Well, yes - But we already do that globally in target-finalize, so we
don't need to do it explicitly here.

I've committed an even simpler fix - Simply use 'make setserial' instead
of 'make all' so setserial.cat doesn't get built.

Thanks.

-- 
Bye, Peter Korsgaard
