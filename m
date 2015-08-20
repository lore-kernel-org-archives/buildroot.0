From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Aug 2015 16:22:11 +0200
Subject: [Buildroot] disabling linux-pam on musl
In-Reply-To: <CA+BsyQ7_19evrfPvJXoFLSYuUaRk-kQxwYWjkULOCsBwBbGpCQ@mail.gmail.com>
 (Brendan Heading's message of "Thu, 20 Aug 2015 13:35:00 +0100")
References: <CA+BsyQ7_19evrfPvJXoFLSYuUaRk-kQxwYWjkULOCsBwBbGpCQ@mail.gmail.com>
Message-ID: <87bne26nvw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

 > Hi guys,
 > I was about to send a patch disabling linux-pam when musl is being
 > used. I guess this means that we should also disable its dependencies
 > on musl too ?

Indeed.

 > By my reckoning this means disabling the following packages musl.
 > These implicitly turn on linux-pam.

 > openvmtools

Only the pam suboption.

> python-pam
 > rsh-redone

Only the rlogind + rshd suboptions.

> util-linux

Only the chfn/chsh + login utilities suboptions.

 > Does that sound sane ?

Yes, except for the above.

 
-- 
Bye, Peter Korsgaard
