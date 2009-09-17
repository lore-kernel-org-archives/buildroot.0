From: Will Newton <will.newton@gmail.com>
Date: Thu, 17 Sep 2009 10:23:48 +0100
Subject: [Buildroot] A more readable build output ?
In-Reply-To: <87fxamyrkw.fsf@macbook.be.48ers.dk>
References: <20090916231925.0a8ce23b@surf> <87fxamyrkw.fsf@macbook.be.48ers.dk>
Message-ID: <87a5b0800909170223l1f37a05cg2dbe055b7fffab8b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 17, 2009 at 8:10 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> ?Thomas> Hello,
> ?Thomas> Currently, Buildroot displays the full build log on the standard
> ?Thomas> output. Having the full build log is of course nice, but:
>
> ?Thomas> ?*) It is quite scary for new users
>
> ?Thomas> ?*) It makes it more complicated for new users to understand the
> ?Thomas> ? ? different steps of the Buildroot build process
>
> ?Thomas> ?*) It makes it more complicated to see the progression of the build
> ?Thomas> ? ? process (what is it doing now ? is it almost at the end ?)
>
> ?Thomas> Therefore, I've prototyped a simple thing that redirects the
> ?Thomas> build log to a file (so that the full build log is not lost and
> ?Thomas> can be examined for diagnostic purposes) and only display
> ?Thomas> messages like "Doing this", "Doing that" on the standard
> ?Thomas> output. The goal is to disable this behaviour when V=1 is
> ?Thomas> passed, but this isn't implemented yet.
>
> We basically have this already when you build with 'make -s'. It's not
> quite as quiet as we could wish, and non-makefile.autotools.in packages
> don't print their steps, but we could probably fix that.
>
> We can argue about what the default should be though, as the output is
> quite interesting for debugging purposes when things go wrong (your
> suggestion about logging to a file is nice).

Yes, I would certainly like to have a log to file option, it would
save me from repeatedly typing the same redirection. I'm not sure
whether the build would be noisy enough with the other suggested
change though. For example "Building GCC" would offer very little
feedback for a long time, especially on slower build machines.
