From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Tue, 5 Nov 2013 10:29:52 -0600
Subject: [Buildroot] [RFC] Continuous integration
In-Reply-To: <1464774.i3ScgRtXEf@sagittae>
References: <1464774.i3ScgRtXEf@sagittae>
Message-ID: <CAC2S8khWpEpUZiYOrzE2agTXehwW+g5Pkncqdp2PRsc25bT-cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2013 at 7:46 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Hello,
>

<snip>

>
> Code is available there:
>    https://github.com/jerome-pouiller/br-continuous
>

We've been giving your script a try and made some updates.  So I went
ahead and created a (github)fork (should have a few updates checked in
tonight).
I fixed a couple items that may have been bugs (or possibly just how I
used the script).  I current have been running into an issue where
after git updates are detected, previously built pkgs try to rebuild
without doing a clean.  I see where the conditional is that should be
executing the clean but haven't tracked down why I'm not hitting that
path yet.
I also noticed that once the script processes all jobs it gets into a
loop, I added a fix for that that prevents running the jobs unless
there are still jobs to execute in the job list.

I noticed there isn't a good way to restart the script after you stop
it, is my understanding correct?  I (temporarily) added a cleanup
sequence before the mainloop executes to remove history and each cfgs
build before proceeding.

I think there might be a bug with detecting when a package fails to
build, I'll see if I can resolve this and let you know.  I haven't had
a package actually error yet, but have had some that never built
because of host dependency error or download error

I was wondering what your thoughts were for the report?  I'm guessing
what's currently committed was the start of something based on this
thread of discussion.  I could see gathering a list of package err,
git id, and list to build output (similarly to the autobuilder
results).

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com


>
>
>
> --
> J?r?me Pouiller, Sysmic
> Embedded Linux specialist
> http://www.sysmic.fr
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
