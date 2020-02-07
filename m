From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Feb 2020 15:53:30 +0100
Subject: [Buildroot] [PATCH] package/libftdi1: fix python support
In-Reply-To: <CAGm1_ksGCvr8bmLMjrrNaGQvcaGS=2GuC7yqQcvTBE93_1Z-Jw@mail.gmail.com>
 (Yegor Yefremov's message of "Fri, 7 Feb 2020 13:26:18 +0100")
References: <20200206095421.12987-1-yegorslists@googlemail.com>
 <87imkiyd32.fsf@dell.be.48ers.dk>
 <CAGm1_kvMR9y5FtiAUNcMDT8V4diTFNk=3KSD7twQzkXw0jm-tQ@mail.gmail.com>
 <875zgiy8dq.fsf@dell.be.48ers.dk>
 <CAGm1_ksGCvr8bmLMjrrNaGQvcaGS=2GuC7yqQcvTBE93_1Z-Jw@mail.gmail.com>
Message-ID: <871rr6xxcl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 > This is what I get when invoking "make libftdi1"

Ok. It is not really clear to me why it fails for you but not for me,
but ok - Committed, thanks.

 > P.S. another issue is that as you can see cmake has found the host's
 > own SWIG version and not BR's version which is 4.0.x.

Hmm, indeed. We do add our host-swig to the path, so I guess something
is hardcoded to look in /usr/bin first?

Care to take a look?

-- 
Bye, Peter Korsgaard
