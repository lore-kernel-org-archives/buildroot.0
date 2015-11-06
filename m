From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 6 Nov 2015 12:35:47 -0300
Subject: [Buildroot] Buildroot LTS?
In-Reply-To: <87eggb1keu.fsf@dell.be.48ers.dk>
References: <563336DE.4040809@2net.co.uk>
 <20151030145803.6aeb3c2d@free-electrons.com>
 <87eggb1keu.fsf@dell.be.48ers.dk>
Message-ID: <563CC8D3.1010202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/10/15 06:01, Peter Korsgaard wrote:

>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>   >> I would be interested in any comments on the above. What do Buildroot
>   >> users do in practice? Does any 3rd party offer LTS support for Buildroot?
>
>   > There is currently no long term support policy for the community
>   > maintained Buildroot. We have discussed this topic a few times during
>   > our meetings, as I remember raising the question of whether we should
>   > maintain for a longer period certain specific releases of Buildroot, at
>   > least to take care of the security problems.
>
>   > So far, our common reaction was that it is rather time-consuming to do
>   > and also not very exciting for volunteers to do. It is the type of
>   > topic that would really be helped if there was some funding from
>   > companies.
>
> Indeed, so far nobody has volunteered to do such work.

Hi.
A bit late to the talk, but still relevant i think.
I think this is the biggest issue, at least for me it doesn't sound too 
interesting, i generally live with the bleeding-edge (master), and 
recommend people to use the latest release or master.
It's the fact that it's all volunteer work that makes LTS releases a 
tough cookie to deliver.

>   > That being said, if there is sufficient interest for this, and
>   > developers willing to look at the security issues and submit the
>   > corresponding patches, I'm sure we'd be happy to create such LTS
>   > releases from time to time.
>
> Certainly. We already do bugfix releases (like 2015.08.1) for important
> issues discovered after release. I have no problems doing more of those,
> but people have to submit patches and/or point out what patches on
> master also applies to the bugfix release.

Security bumps are, in general, well tagged with i think my defacto 
standard:

$ git log --grep="security bump"|grep Author|sort|uniq
Author: Baruch Siach <xxx>
Author: Bernd Kuhls <xxx>
Author: Gustavo Zacarias <xxx>
Author: J?rg Krause <xxx>
Author: Peter Korsgaard <xxx>
Author: Yann E. MORIN <xxx>

That being said it's just a first step towards LTS releases.
Though some other security fixes might sneak-in via regular bumps 
without being tagged or looking close enough at the release notes.
With some previous experience with these things it depends very much on 
the package and how long-term the release support window is to choose if 
it's best to patch or bump.
And also what would constitute grounds for a release? One security fix? 
If it's periodic it might be too late for a security fix, hence possibly 
some cumulative periodic release plus some way of notifying when patches 
are applied (separate ML? rss feed? users checking the git repo?).
Too many things to say at once :)
Regards.
