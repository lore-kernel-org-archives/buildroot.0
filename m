From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Aug 2012 13:35:33 +0200
Subject: [Buildroot] A little summer game ? :-)
In-Reply-To: <CAAXf6LXqbEF=aPnV6+Wg4QghOg5EG4B4yySqSKuR-XUP7bXd2w@mail.gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <20120803103052.5ec63fb7@skate> <501B9416.3090700@lucaceresoli.net>
 <20120803111951.2269f1ca@skate>
 <CAAXf6LXqbEF=aPnV6+Wg4QghOg5EG4B4yySqSKuR-XUP7bXd2w@mail.gmail.com>
Message-ID: <20120803133533.1b71ff10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 3 Aug 2012 13:07:01 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> One of the hurdles I experience with looking/fixing the
> autobuild-reported problems is that it's not clear:
> - who is already looking at a given issue
> - who has already looked at a certain issue and determined the
> problem, without being able to fix it or not having time.
>     => For these, some kind of comment field would be nice, attached
> to each issue.

To solve this, my idea was to connect the autobuilders with the bug
tracker: whenever there is a failed build, submit automatically a bug
to the bug tracker. This way, we don't reinvent the bug tracker wheel
with bug state, comments, who is assigned on the bug, etc.

> - whether there is progress. How many issues are remaining?
>     => Due to the random build principle it's a bit hard to give exact
> numbers, but maybe some alternative statistics are possible? For
> example, the amount of issues found each week?

Well, every day in the e-mail I'm giving the number of successful
builds and the number of failed builds. For sure, I could draw graphs
that show these numbers over time.

> - at first sight, which issues are related? It would be nice if two
> issues caused by the same thing could be identified as such. This may
> not be completely possible in an automatic fashion, but we could try.
> For example, on the first problem, a manual intervention could be
> possible to specify which is the identifying string of that error
> (part of the error message). If a later build finds a problem in a
> given package, grep in the endlog for that identifying string. If
> present, we assume it's the same problem. Obviously, the choice of the
> identifying string is critical.
> It could be that the same problem can occur in different packages, in
> which case the above strategy wouldn't mark them as such. You could
> expand the strategy across packages, so that you only check for the
> string, but it may yield too much false relations.

Yes, this is the big problem I have with automatically feeding failed
build reports to the bug tracker: a large number of duplicates that
would have to be sorted out.

So either we create an additional field in the bug tracker that holds
some "recognizable string of the build failure", and as you suggest we
look for this "recognizable string" in the last 100 lines of the build
output or something like that.

Or we try to experiment with text similarity algorithm to detect when
the end of two build outputs are fairly similar, and before submitting a
bug, I check if we have had a similar build output since the last month
or so.

But for now, I think you can fairly safely assume that nobody is
working on fixing build issues. If anyone works on an issue that takes
a while to figure out, just send an e-mail to the list saying you're
working on it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
