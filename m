From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 17 Jun 2013 11:20:40 -0500
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130617094958.33eaff88@skate>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
 <20130616200540.5a370504@skate> <20130617074535.GB16699@lukather>
 <20130617094958.33eaff88@skate>
Message-ID: <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 17, 2013 at 2:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Ripard,
>
> On Mon, 17 Jun 2013 09:45:35 +0200, Maxime Ripard wrote:
>
>> > Ok. This will require a little bit of work, because until now, the
>> > autobuild.buildroot.org machine, which sends the daily e-mails, was not
>> > using the Buildroot source code at all to do its job. So either the
>> > slave build machines will have to submit the list of maintainers of the
>> > failing package as part of the tarball they submit to
>> > autobuild.buildroot.org, or autobuild.b.o will have to look at the
>> > Buildroot source code to find the maintainers of the failing package.
>> >
>> > Either way, it will not be immediate to implement.
>>
>> Maybe having a make pkg-maintainers target that would output the list of
>> mails for a package maintainer would be a more reasonable thing to do.
>
> Of course, if the solution of <pkg>_MAINTAINERS proposed by Yann is
> adopted, we should have a corresponding "make show-<pkg>-maintainers"
> target to display the maintainers for a given package. However...
>
>> That would allow the autobuilders to not have some knowledge of the
>> buildroot source code, while we remain free to change the "maintainer
>> implementation" at any point in time.
>
> ... that doesn't solve the entire problem. For now, the slaves (doing
> the builds) do not know what is the reason of the build failure. The
> analysis of the log file to find out which package failed is currently
> done only on the autobuild.b.o machine. But this machine doesn't have
> access to the corresponding Buildroot source code to execute the "make
> show-<pkg>-maintainers". So, we would have to change the logic of what
> is done on the build slaves, but it's ok, it can be done. It's just not
> immediate.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Are we sure we want to add more variables to the .mk files.  One of
Buildroot's main differentiators is the cleanliness of these files in
comparison to other packaging methods.

As an alternative, this information could be pulled from the git log
and anyone who has made a change to the package directory in the past
would be subscribed to errors.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
