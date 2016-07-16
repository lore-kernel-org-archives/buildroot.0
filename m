From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 16 Jul 2016 15:58:35 +0200
Subject: [Buildroot] Buildroot, github and nopullrequest.com
In-Reply-To: <20160716150917.731c5a47@free-electrons.com>
References: <CA+TH9VnO2kF00pQJB3K_f6NcRboq3afw-MmxM1sNHxXWpjdThw@mail.gmail.com>
 <20160716150917.731c5a47@free-electrons.com>
Message-ID: <CA+TH9V=4CSerf01N00NY6GhLxjXEc_ED2Y1JUEWyuMddDhzO5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, All

2016-07-16 15:09 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat, 16 Jul 2016 14:44:06 +0200, Angelo Compagnucci wrote:
>
>> Personally, I'm really sad that the buildroot infrastructure is
>> currently down from a few days, buildroot is such a wonderful project
>> that not merits such a shame.
>
> Agreed.
>
>> Obviously, the infrastructure behind buildroot is not up to date to
>> the current standards, I think we should change.
>
> I also agree.
>
>> 1) Website: we have a github account, we have github pages, we should
>> switch there! The only downside here is that github pages doesn't
>> suppo SSI, so we should write a simple bash script to assemble the
>> website before publication. Github pages resides on their own
>> repository, so we can have the website as always in the main
>> repository and the bash script will assemble the website in an outside
>> directory where the other repository it's cloned.
>
> I just created https://github.com/buildroot/buildroot.github.io for
> this purpose, and then realized that we use SSI includes. I think we
> should probably move away from SSI includes, to a more modern web-site
> generation mechanism, like Pelican (http://blog.getpelican.com/) or
> similar.

I'm not too familiar with these systems. Usually they are not too
flexibles and they tend make difficult to write your own theme for the
website. Thay are also blog oriented and not too much website
oriented.

>> 2) We have a github account, we should use it as the main repository.
>> No other words here.
>
> Well, there is one *big* issue: e-mail notifications. They are not
> available by default, and the only thing that people have been able to
> do so far is to have notifications with one e-mail per push (i.e one
> e-mail covering potentially multiple commits). This is definitely not
> acceptable, and is a show-stopper to moving to github.

I didn't realized github is so limited ...

>> 3) Githb pull requests. Obviously, we won't github pull requests, and
>> here enters the game https://nopullrequests.com. It's a simple github
>> webhook that closes a PR with a message. The source is publicly
>> available on github. We can use that service as is, or run an instance
>> ourselves on GAE. I had a look at the source code and it's pretty
>> secure, once it's authorized on github, it receives a message on each
>> pull requests and replies immediately without keeping anything
>> (caching or disk). Hosting our instance on GAE will have the benefit
>> on personalizing the commit message with something more specific than
>> the pretty aseptic default message.
>
> I'm not sure I like giving access to https://nopullrequests.com to my
> Google account.

You can jump that step, the important is to give the permission to
close the PRs (github permission). Obviously is not the most clean
solution, but the only viable one.

>> 4) Issues: well, everything is better than bugzilla!
>>
>> Again, no intention to start a flame war here, only getting a better Buildroot!
>
> There are a few more things to think about:
>
>  1/ The mailing list. I would suggest to move to lists.infradead.org,
>     which is used by numerous Linux kernel communities. We would also
>     use git.infradead.org as the Git repository, but then we wouldn't
>     have an issue tracker. Of course, if we move the mailing list to a
>     new location, the mailing list archives should be imported in the
>     new location as well.

I had a look at infradead.org and to it seems way less solid than the
infrastructure we have now. On the homepage
(http://www.infradead.org/) the author seems to look for a job ...

>  2/ Migration of the bug tracker history. How do we move Bugzilla
>     entries to the Github issue tracker? All references of bug tracker
>     entries in Buildroot commits would become wrong. Not nice.

Right, good catch.

Very intricate problem ...

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
