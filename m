From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 12 Feb 2013 15:14:37 +0100
Subject: [Buildroot] Report from the Buildroot Developers Meeting
In-Reply-To: <20130209004253.207e0741@skate>
References: <20130209004253.207e0741@skate>
Message-ID: <CAHQn0ki4wo2xtMcsQr7ACY_EihgePe=UaWUjziHeAP_80nPR7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 9, 2013 at 12:42 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>   http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013#List_of_topics_to_discuss
> Do not hesitate to comment those discussions as a reply to this e-mail.

> The problem of systemd and udev has been discussed. Buildroot is currently
> stuck with an old version of systemd and udev, because the project wants to
> be able to offer udev-based systems that don?t use systemd. Unfortunately,
> the modern version of systemd directly integrate udev, and it is not possible
> to build the latter without building the former, bringing D-Bus as a
> dependency. Investigating the eudev fork was discussing, but relying on a
> forked version of udev may be causing compatibility issues in the future.

According to the announcement of udev and systemd being merged, they
claimed udev would still be able to be build independently (although
through the systemd source tree of course). I requested some info
regarding the D-Bus dependency in #systemd and here is the dialog:

< speakman> Just heard about udev and systemd merging. And it seems
like udev can still be compiled individually although from the same
source tree as systemd. But how about it's DBus dependency - will
"udev" compile without D-Bus libraries?
< ssuominen> speakman: yes, but you have to call specific Makefile.am
targets individually... and set environment flags DBUS_CFLAGS=' ' and
DBUS_LIBS='
                   ' to get past the ./configure check
< ssuominen> speakman: gentoo is packaging udev like that, and ebuilds
are mostly bash, you could take look at the rather complex setup from
the ebuild

So, although it might be a bit complex, it seems like udev can be
built independently without dbus libraries.

Regarding Buildroot I assume dbus and systemd will merge into one
single package. Are there anything preventing "systemd" from being
"optional" and depend on D-Bus only when enabled?

Anything else I'm missing here?

Best regards
Daniel
