From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 23:04:51 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <54F9A7E5.10900@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 06 Mar 2015 10:13:09 -0300")
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
 <54F8F0AC.8030707@zacarias.com.ar>
 <20150306094008.7baf8c91@free-electrons.com>
 <54F96D83.4010304@zacarias.com.ar>
 <20150306102632.20dff6f7@free-electrons.com>
 <54F974C3.2020509@zacarias.com.ar>
 <20150306104010.76c71f6b@free-electrons.com>
 <54F98235.7030509@zacarias.com.ar>
 <20150306123518.7a76d66c@free-electrons.com>
 <54F9A7E5.10900@zacarias.com.ar>
Message-ID: <8761a8o6f0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

>> Do you realize that since a few months, I've basically stopped doing
 >> any development of Buildroot on the topics I'm interested in, and
 >> switched to spending all my available time to review, test and merge
 >> the patches submitted by all the contributors? I'm spending all my
 >> evenings and week-ends shrinking the patchwork backlog so that
 >> patches sent by contributors get merged at some point.

 > This is the kind of inertia i'm refering to.
 > Something needs to change or eventually you'll wear out/wane out of
 > interest.
 > Without wanting to "rub it" and being pretty one-sided the qemu-system
 > package/idea went nowhere, a lot of time passed.
 > I still stand on my original argument for it being split.
 > I don't care what does or doesn't happen with that any more, i'm
 > bringing it up as an example of my lack of interest of doing anything
 > big regarding out-of-the-box experience.
 > Post build scripts are all great, but some things should really be
 > easier for the users.
 > Making the initscripts configurable for example is one of them, but
 > every time i want to start writing the proposal and samples i feel
 > "Bleh, Peter or Thomas won't take it" and just leave it be.
 > And it _really_ needs to happen, right now samba4 AD DC support isn't
 > complete since the initscript isn't adequate for that.
 > You've got scenarios where you start smbd, nmbd and winbindd, more usual
 > without winbindd, but for AD-DC you need to start samba, and it's hard
 > to predict based on smb.conf with dubious grepping.
 > It's also not very feasible to "try" both approaches since some delays
 > must be thrown in for the samba master process to really kick in before
 > checking things are running.

I understand. Working on new features are nice (and yes, reviewing other
peoples patches all day does get boring after some time), but we also
need to keep in mind that Buildroot should stay a simple system
(otherwise you might as well use one of the other bigger systems) and we
should try to keep it stable.

We simply cannot cater to everyones needs. With that said, we have
merged a number of new features over the years to automate some of these
things (rootfs overlays, getty settings, root password, users, init
systems, /bin/sh handling, timezones, network config, ..), and I'm sure
we will merge even more in the future.


 > remotely-exploitable CVEs affect it, but it's probably safe to say a dozen.
 > Maybe it'll entice someone to step up, but it really can't go on like this.
 > Even though we don't guarantee that packages are free of bugs/security
 > holes in them when we do know we should get something done about them,
 > either fix them or kill them.

Agreed (and not only about security issues). If a package has serious
issues and nobody cares enough to fix it then we need to deprecate and
remove the package.

We keep on adding new packages every single release, so we also need to
cleanup unloved ones.


 >> I think we should really meet once in person one day so you can feel how
 >> much I value the contributions done by all developers, and especially
 >> yours.

 > That'd be hard to achieve i'm afraid, we've got a phrase here which
 > literally translates to "we're in the ass of the world".

Heh ;)

-- 
Bye, Peter Korsgaard
