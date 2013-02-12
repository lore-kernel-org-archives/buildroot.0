From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 12 Feb 2013 16:57:27 +0100
Subject: [Buildroot] Report from the Buildroot Developers Meeting
In-Reply-To: <20130212151823.6f38a844@skate>
References: <20130209004253.207e0741@skate>
 <CAHQn0ki4wo2xtMcsQr7ACY_EihgePe=UaWUjziHeAP_80nPR7A@mail.gmail.com>
 <20130212151823.6f38a844@skate>
Message-ID: <CAHQn0kh_8=seM=OybRGC--XY1wYFnhnB7Mts4Y+it1AWMqRgcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 12, 2013 at 3:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Daniel Nystr?m,
> On Tue, 12 Feb 2013 15:14:37 +0100, Daniel Nystr?m wrote:
>> According to the announcement of udev and systemd being merged, they
>> claimed udev would still be able to be build independently (although
>> through the systemd source tree of course). I requested some info
>> regarding the D-Bus dependency in #systemd and here is the dialog:
>>
>> < speakman> Just heard about udev and systemd merging. And it seems
>> like udev can still be compiled individually although from the same
>> source tree as systemd. But how about it's DBus dependency - will
>> "udev" compile without D-Bus libraries?
>> < ssuominen> speakman: yes, but you have to call specific Makefile.am
>> targets individually... and set environment flags DBUS_CFLAGS=' ' and
>> DBUS_LIBS='
>>                    ' to get past the ./configure check
>> < ssuominen> speakman: gentoo is packaging udev like that, and ebuilds
>> are mostly bash, you could take look at the rather complex setup from
>> the ebuild
>
> Interesting, thanks for asking about this topic.
>
> Note that there was an effort last year to make this easier:
> http://comments.gmane.org/gmane.linux.hotplug.devel/17478. But it
> doesn't seem to have been merged, and the systemd maintainers don't
> think building D-Bus is a problem:
> http://lists.freedesktop.org/archives/systemd-devel/2012-June/005516.html.

That's one sad attitude by the developers. Looks like we're on our own here.

>> Regarding Buildroot I assume dbus and systemd will merge into one
>> single package. Are there anything preventing "systemd" from being
>> "optional" and depend on D-Bus only when enabled?
>
> Why would systemd and dbus would merge into one single package? Are you
> sure you didn't confuse with "systemd and udev would merge into one
> single package" ?

That's my typo, sorry.
