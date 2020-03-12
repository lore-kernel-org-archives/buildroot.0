From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 11 Mar 2020 23:03:15 -0300
Subject: [Buildroot] [PATCH/next v2 2/4] package/openrc: bump to version
 0.42.1
In-Reply-To: <20200311172212.GM5357@scaer>
References: <20200301151747.25723-1-unixmania@gmail.com>
 <20200301151747.25723-3-unixmania@gmail.com>
 <20200311172212.GM5357@scaer>
Message-ID: <CAJ4jsacoWEi=7sJwTBCJ=cTDEkJbPOYpo2uZT8KWCudJjuHc3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 11, 2020 at 2:22 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, Al,
>
> On 2020-03-01 12:17 -0300, unixmania at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > Add a patch to prevent starting agetty on tty[1-6]. Buildroot starts a
> > single getty, according to the system configuration. Also tty[1-6] may
> > not even exist (e.g. embedded devices with serial consoles only).
>
> It would be good if that was made into an upstreamable patch, e.g.:
>
>     if test "${MKGETTYS}" != no && test "${OS}" = Linux; then \
>         [...]
>     fi
>

Done: https://github.com/OpenRC/openrc/pull/355

-- 
Carlos Santos <unixmania@gmail.com>
