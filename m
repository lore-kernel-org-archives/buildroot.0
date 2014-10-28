From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 28 Oct 2014 12:10:50 +0100
Subject: [Buildroot] [PATCHv2 buildroot-test 01/11] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <87fve95rd4.fsf@dell.be.48ers.dk>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-2-git-send-email-patrickdepinguin@gmail.com>
 <20141019225918.57f55ebf@free-electrons.com>
 <CAAXf6LX4SQsCCnbU5aR37KypC+QUx3ryVPk4hoiceQebu9ic4Q@mail.gmail.com>
 <87fve95rd4.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUw-7815B8ffeSpqLGgeRjtXCdkhjg+vYEpaXg=Do2v8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 27, 2014 at 6:56 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  >> are you not overlooking another place where http_login + http_password
>  >> are used to find out whether uploading should take place? I.e, in:
>  >>
>  >> if http_login and http_password:
>  >> # Submit results. Yes, Python has some HTTP libraries, but
>  >> # none of the ones that are part of the standard library can
>  >> # upload a file without writing dozens of lines of code.
>  >>
>  >> Probably we want the same test to be used everywhere?
>
>  > Hmm, indeed.
>  > But then I think we better add do_send_results to kwargs so the value
>  > can be calculated once and used multiple times. Btw, if you have a
>  > better name than do_send_results, that would be great. I'd pick
>  > 'send_results' but it's already the function name...
>
> What about 'upload'?

Sounds good to me.
Thomas Petazzoni: do you agree?

Thanks,
Thomas
