From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2014 18:56:07 +0100
Subject: [Buildroot] [PATCHv2 buildroot-test 01/11] autobuild-run:
	check-requirements does not need to know the login details
In-Reply-To: <CAAXf6LX4SQsCCnbU5aR37KypC+QUx3ryVPk4hoiceQebu9ic4Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 20 Oct 2014 11:47:17
 +0200")
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-2-git-send-email-patrickdepinguin@gmail.com>
 <20141019225918.57f55ebf@free-electrons.com>
 <CAAXf6LX4SQsCCnbU5aR37KypC+QUx3ryVPk4hoiceQebu9ic4Q@mail.gmail.com>
Message-ID: <87fve95rd4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> are you not overlooking another place where http_login + http_password
 >> are used to find out whether uploading should take place? I.e, in:
 >> 
 >> if http_login and http_password:
 >> # Submit results. Yes, Python has some HTTP libraries, but
 >> # none of the ones that are part of the standard library can
 >> # upload a file without writing dozens of lines of code.
 >> 
 >> Probably we want the same test to be used everywhere?

 > Hmm, indeed.
 > But then I think we better add do_send_results to kwargs so the value
 > can be calculated once and used multiple times. Btw, if you have a
 > better name than do_send_results, that would be great. I'd pick
 > 'send_results' but it's already the function name...

What about 'upload'?

-- 
Bye, Peter Korsgaard
