From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 25 Apr 2013 11:01:15 +0000
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
In-Reply-To: <20130425050221.4846d873@skate>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
 <20130425050221.4846d873@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D6339FA392@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> (host-flex/host-bison)
Thanks for the patches! I have integrated them and added version checks. I'm not 100% certain from which version onwards the dependency has been removed, but my colleague says that he didn't encounter these dependencies with GCC 4.5, so I made it depend on 4.2,4.3,4.4.

> Do you have an idea for this pthread_mutex_t issue? Maybe ARC doesn't support NPTL or something?
Correct, we don't have NPTL support yet. It was the initial planning to have this finished before we went out with the BuildRoot patches, but priorities shifted, and I hadn't disabled it yet. Added a patch for that.

> Also, do you have a public repo to push your changes to? Since your patch series has become quite long, it would make it easier for us to test it as a whole.
Our github site has a BuildRoot repository:
https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot

I'm regularly rebasing & updating patches, and pushing them to this repo. Right now, there are two branches/tags that are relevant:
* master_arc_20130425
* master_3.9_arc_20130425

The only difference between the two is that the first relies on 3.9-rc8, and the second on 3.9. So the second branch doesn't build right now, but should build after this weekend.

BTW: would you like to repost the new set of patches on the mailing list, or would you rather have a look at it on github?
BTW2: I noticed that GNU config went from GPLv2 to GPLv3, I'm not sure what the impact would be for BuildRoot, as it is really part of BuildRoot (not downloaded).

Mischa
