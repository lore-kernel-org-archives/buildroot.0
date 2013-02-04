From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 23:01:53 +0100
Subject: [Buildroot] Bumping Buildroot environment
In-Reply-To: <CAFzEKXHEC4t+shO4F3YprMnxCJtRbNoo5RFp5A0bx5TOXJh+Vw@mail.gmail.com>
References: <CAFzEKXHEC4t+shO4F3YprMnxCJtRbNoo5RFp5A0bx5TOXJh+Vw@mail.gmail.com>
Message-ID: <51102FD1.9020403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 19:51, Aditya Rawat wrote:
> Hello, I am just starting out with working on Buildroot and so far its
> been amazing !
>
> my question was : How could we go about bumping a buildroot environment
> to the most recent one ?
> You see I had been working one a buildroot environment at
> https://github.com/j1nx/buildroot-AmLogic
> and noticed some of the packages were missing or not there at all as from
> the most recent Buildroot release.
>
> So I tried doing a  "Git merge" of the Buildroot current branch to the
> older buildroot environment at >> https://github.com/j1nx/buildroot-AmLogic
> and it went ahead broke dozen different things.
>
> Any pointers to update the Buildroot environment the right way ?
>
> --
> Best Wishes;
> Adi

  Hi Adi,

  Just today we were discussing on the Buildroot Developer Day what a 
pity it is that there are so many buildroot forks and that we never hear 
from them. So first of all, thank you for joining the list!

  Forking a fast-moving project like buildroot, making 615 patches to it 
and then expecting it to merge smoothly after two years is a fantasy :-)

  Although there are other paths such as rebasing or incremental merges, 
in the end you'll just have to resolve the conflicts. But probably many 
can be resolved by just checking out the buildroot version ("git checkout 
origin/master Config.in").

  You'll also have to slightly rewrite all your packages, because it is 
no longer $(eval $(call AUTOTARGETS,host)) but it's $(eval 
$(host-autotools-package)).


  For changes you think could be relevant to the buildroot community as a 
whole, you could also consider upstreaming them first, so that during the 
merge you can just resolve to the buildroot version. For the future, my 
advise is to upstream more often (certainly whenever you're touching a 
package that already exists in buildroot, and preferably also for new 
packages), and to merge more often (for instance every buildroot release).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
