From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Oct 2014 13:24:28 -0300
Subject: [Buildroot] Review of FOSDEM 2014 meeting action points
In-Reply-To: <20141008181424.27e753c8@free-electrons.com>
References: <20141008104845.495ad683@free-electrons.com>
 <CAHXCMMLaWJki-F0NXKAw243DWUKdtWeE=q1iDNoVdi+2_z9s7w@mail.gmail.com>
 <CAGduivy-PEV9kqjD50yhKc3T8=iZa6cdg-q0Z48dQvA4SnYg1g@mail.gmail.com>
 <20141008181424.27e753c8@free-electrons.com>
Message-ID: <5435653C.1030209@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 01:14 PM, Thomas Petazzoni wrote:
>>>>  - SystemV/systemd init scripts. The idea was to do automatic
>>>>    installation of init scripts / service files located in
>>>>    package/<foo>/. Maxime Hadjinlian said he would work on this, but
>>>>    not much happened. On a related note, there is a need to separate
>>>>    the skeleton to not avoid Busybox-related init scripts in a pure
>>>>    systemd configuration.
>> I know.. shame on me.
> 
> No problem. The point of doing a review of the action points is
> definitely *not* to put the blame on anybody.
> 
>> I still have a branch with a beginning of something. I would *really*
>> like to finish this during the dev-days, it would be great.
> 
> Ok. Though from my perspective, active development could better take
> place outside of the dev-days. Maybe focusing the dev-days on
> cleaning up the patchwork backlog is a better idea.

FYI i'm doing some cleanup regarding busybox/sysvinit init (sic) and
patches are flowing with what i'm finding out.
In the end with sysvinit it's difficult to deal with the PNP approach in
that if people want a normal booting system without busybox they'll need
to throw a bunch of packages into the mix.
I can compile a list of the usual ones and we can add some documentation
about it, but i don't think forcing (selecting) them is a good idea
since customizing the init process can drop the need for some.
I'll also do some systemd testing but it's really low priority for me.
I think the PKG_INSTALL_INIT_SYSV defines are good enough unless we want
to deal with runlevels (wouldn't make sense, at least for me), systemd
is a whole different story as we discussed before.
Regards.
