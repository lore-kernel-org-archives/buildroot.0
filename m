From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 3 Aug 2012 13:07:01 +0200
Subject: [Buildroot] A little summer game ? :-)
In-Reply-To: <20120803111951.2269f1ca@skate>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <20120803103052.5ec63fb7@skate> <501B9416.3090700@lucaceresoli.net>
 <20120803111951.2269f1ca@skate>
Message-ID: <CAAXf6LXqbEF=aPnV6+Wg4QghOg5EG4B4yySqSKuR-XUP7bXd2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Aug 3, 2012 at 11:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Fri, 03 Aug 2012 11:04:22 +0200,
> Luca Ceresoli <luca@lucaceresoli.net> a ?crit :
>
>> Wheee, what a fun, Thomas! Call it "Buildroot Summer Of Bugfix" and
>> people will flock in! :-D
>
> I like this name, adopted! :-)

I like the game, I like the name.

>
>> Seriously, I admit I'm not investing a lot of time in fixing build
>> errors. This is in part due to the limited time available, but
>> another important blocking factor is that many build errors happen
>> with external, custom toolchains that are installed on your build
>> server.
>>
>> I almost daily skim through the build failures and take a look at
>> those about by packages and/or architectures I use and somehow know.
>> These are already a small subset of all the possibilities.
>> But often I discover these happen with toolchains (and probably
>> architectures) I don't have an easy access to, so I just go along.
>>
>> It would help if the external toolchains used for the builds were
>> always available within Buildroot, so we could just apply the
>> [def]config, run make, have an icy drink while it downloads and
>> fails building and then, happily refreshed, hunt for the bug.
>>
>> I'm not saying this would be easy to do, but it would be helpful
>> to me.
>
> Yes, I know this is a problem with the current autobuilders. My plan is
> to make the tarballs of those external toolchains available somewhere,
> so that people can easily install them as well. But that will take a
> bit of time, and still leave some work when you want to reproduce a bug
> (download the external toolchain, download .config, adjust .config to
> match the path of the external toolchain on your local machine, build).
> Or maybe, I should put all of them somewhere, and have my defconfig
> download them from this common place. This could be a good idea to make
> it easier to reproduce the build problems.
>
> Also, there is a problem with BR external toolchains that are not (yet)
> relocatable. I can create a tarball for them, but it will force you to
> install them to /home/test/toolchains/... which is the location where
> they are built on my build server. I guess the best solution for this
> is just to make Buildroot toolchains relocatable :-)

One of the hurdles I experience with looking/fixing the
autobuild-reported problems is that it's not clear:
- who is already looking at a given issue
- who has already looked at a certain issue and determined the
problem, without being able to fix it or not having time.
    => For these, some kind of comment field would be nice, attached
to each issue.

- whether there is progress. How many issues are remaining?
    => Due to the random build principle it's a bit hard to give exact
numbers, but maybe some alternative statistics are possible? For
example, the amount of issues found each week?

- at first sight, which issues are related? It would be nice if two
issues caused by the same thing could be identified as such. This may
not be completely possible in an automatic fashion, but we could try.
For example, on the first problem, a manual intervention could be
possible to specify which is the identifying string of that error
(part of the error message). If a later build finds a problem in a
given package, grep in the endlog for that identifying string. If
present, we assume it's the same problem. Obviously, the choice of the
identifying string is critical.
It could be that the same problem can occur in different packages, in
which case the above strategy wouldn't mark them as such. You could
expand the strategy across packages, so that you only check for the
string, but it may yield too much false relations.

This probably needs some further thinking...

Best regards,
Thomas
