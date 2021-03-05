From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 5 Mar 2021 16:38:59 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <20210305161442.066cc2de@windsurf.home>
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home>
 <CAEyMn7YFHLJ=SBaB8N4NGaKN=tO_UYAO13-D2-JUnyoLQpoWAA@mail.gmail.com>
 <20210305161442.066cc2de@windsurf.home>
Message-ID: <CAEyMn7aO8towu3BMdDwLsWhu13udCshENbbiwM_ZBrBHRhkFGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Fr., 5. M?rz 2021 um 16:14 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri, 5 Mar 2021 16:10:27 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Indeed. The netopeer package is a bit annoying to install. But I hope
> > Jan Kundrat will make his offer come true [1] and provide a better
> > solution.
> >
> > Since the problem currently only occurs on one autobuild host, I would
> > leave it alone until then. Is that ok for you? Or should I try to
> > patch the problem?
>
> We try when possible to fix or work around the issues, as having noise
> in the autobuilders is always a bit annoying. I haven't looked in
> details into the problem, so I don't have a particular suggestion to
> make, though.

I understand the problem with the noise, but at the moment I don't see
a solution here.

The problem comes from sysrepoctl which is used during the
installation. This needs a user and a group as names [1] [2]. But on
the autobuilder that fails there seems to be no name for the group in
the /etc/group.

Why all this fiddling is necessary is described in the explanation of
Jan Kundrats.

[1] https://github.com/sysrepo/sysrepo/blob/master/src/executables/sysrepoctl.c#L590
[2] https://github.com/CESNET/netopeer2/blob/master/CMakeLists.txt#L77

A possible solution would be to introduce a config option that
enables/disables the installation of the YANG modules and disable them
by default.

-- 
Heiko
