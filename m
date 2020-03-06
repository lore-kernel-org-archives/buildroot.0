From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 6 Mar 2020 12:54:29 +0100
Subject: [Buildroot] [PATCH] package/linuxptp: make initscript options
 configurable
In-Reply-To: <CAJ4jsadA20L08q+ow_jjcmK3UAmeQ9jJGuHxD-i5v6_EWOeZOw@mail.gmail.com>
References: <20200306101950.23219-1-michael@walle.cc>
 <CAEyMn7b3uJGsTEBmxQ58oFZboN31v2NbrrZqv=0Kh_Evjp-HJQ@mail.gmail.com>
 <CAJ4jsadA20L08q+ow_jjcmK3UAmeQ9jJGuHxD-i5v6_EWOeZOw@mail.gmail.com>
Message-ID: <CAEyMn7bTL8mvxAfxHc-VbGpng=0d_4DqB=eZUCSgJ6oTLAUq0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos, Michael and all,

Am Fr., 6. M?rz 2020 um 12:46 Uhr schrieb Carlos Santos <unixmania@gmail.com>:
>
> On Fri, Mar 6, 2020 at 7:27 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > Hi,
> >
> > Am Fr., 6. M?rz 2020 um 11:19 Uhr schrieb Michael Walle <michael@walle.cc>:
> > >
> > > Let the user supply its own options in /etc/default/linuxptp.
> > > Additionally, let the user decide if he wants to start php2sys.
> > >
> > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > ---
> > >
> > > It might be better to have an own php2sys initscript. I'm not sure.
> > > Thoughts?
> >
> > I think 2 (ptp4l and phc2sys) scripts like done e.g. in debian would be better.
>
> I agree. It can be split in S65linuxptp and S66linuxptp-phc2sys. Just
> remember to source /etc/default/linuxptp in both scripts or to support
>  a separate defaults file for linuxptp-phc2sys.

I would suggest to create two scripts (S65ptp4l and S66phc2sys) and
create support for the defaults of them (/etc/defaults/ptp4l and
/etc/defaults/phc2sys).

> --
> Carlos Santos <unixmania@gmail.com>

--
Heiko
