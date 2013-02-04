From: Nicolas Dechesne <ndec13@gmail.com>
Date: Mon, 4 Feb 2013 22:37:36 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <20130204223024.0e687d5b@skate>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com> <20130204214018.2efc0bfb@skate>
 <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
 <20130204223024.0e687d5b@skate>
Message-ID: <CAOT3miJUfF3Oc2XFXJRiLCtMxtsHSWZWWLGvGyc+zNkqHGgnEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2013 at 10:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Yes, I am not sure what to do with the applications. Some of them
> appear to be part of X.org releases, but not all of them. Not sure what
> to do about these.
>
> Do you have a suggestion?

well, what i would say is:
 - for apps included in X11 release, take them all
 - for other apps, it's a 'distro' choice to include it... so I would
keep the one we have already, here I assume there must be a reason why
they are there in BR already... and we can add new ones as needed...

another question: do we really want to have 100+ patches to upgrade to
R7.7, or should we make 1 commit that bumps all components (and
remove/add the relevant ones)? I am asking because i think that any
'commit' in between the 100+ patches could put BR in a bad state.. Of
course if we upgrade just 1 specific component later on (before R7.8
is made) then it can be made 'manually', but for large release
upgrade, maybe 1 commit makes sense..

your xorg-release script is really nice, we could even have the script
update the recipe ;-)
