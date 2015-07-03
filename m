From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 3 Jul 2015 11:44:59 -0400
Subject: [Buildroot] [PATCH 1/1] yad: new package
In-Reply-To: <871tgpxsls.fsf@dell.be.48ers.dk>
References: <1435874967-6416-1-git-send-email-james.knight@rockwellcollins.com>
 <20150703053105.GL2391@tarshish>
 <20150703094910.750481b4@free-electrons.com>
 <871tgpxsls.fsf@dell.be.48ers.dk>
Message-ID: <CALe+oY9GJsPCnAjgOprM5g6ZeJkeYTb4_WLV6Gde_LEcPO6AQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentlemen,

I'll just go straight to the two (2) issues I believe we are down to.

On Fri, Jul 3, 2015 at 9:45 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Ok, but that really a common enough situation to add such an option?
> E.G. how often do people have a config where:
>
> - They have enabled BOTH gtk2 and gtk3
> - They are not happy with yad using gtk3

Maybe I have an odd setup but I actually have both gtk2 and gtk3 for
my configuration. The intent of enabling both was to maintain support
for some legacy software on my target as well as provide the means for
new updates/capabilities.

For myself, I'm in a situation where I do not want yad to use gtk3;
however my reasons might not be worthy enough. Truthfully, the issue I
am experiencing is that I have not had time to create a gtk3 theme
that matches my target's gtk2 theme. So, using yad with gtk3 yields
some very plain dialogs. To get it working (quickly) in my situation,
I just wanted the capability to force the package to use gtk2 and
worry about other stuff for now (until I can go back and look at gtk3
theming).

> For those situations where we want to check for A and !B we often stick
> a dummy character like 'x' in between to make it clearer - E.G.
>
> ifeq ($(BR2_PACKAGE_LIBGTK3)x$(BR2_PACKAGE_YAD_FORCE_LIBGTK2),yx)
>...
> A comment explaining this would also be good.

This is a more clear approach I was looking for (frustrated that I
cannot think of them or find them until after I submit a patch).

--

I don't mind adjusting the patch and dropping the ability to change
the gtk backend to make things simpler. I'll just modify my own
repository to restrict to gtk2. In the end, this might be the better
approach: a simple make file and if a package supports gtk3 it should
most likely be using it.
