From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Jan 2017 06:27:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-29
In-Reply-To: <CAFOYHZDvPhhUcSn3G3tGG0sOLZcesWJL0a0USCnFT-pbsh=Qhw@mail.gmail.com>
References: <20170130072925.E0B0B20CD6@mail.free-electrons.com>
 <CAFOYHZDvPhhUcSn3G3tGG0sOLZcesWJL0a0USCnFT-pbsh=Qhw@mail.gmail.com>
Message-ID: <20170131042747.e5mchgg5btbereoc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Tue, Jan 31, 2017 at 05:05:05PM +1300, Chris Packham wrote:
> On Mon, Jan 30, 2017 at 8:29 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> >
> >          arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/dde54ccefa32af1f46a4af5b6caed822c3209dfc
> 
> Looks like a common problem with musl-libc not liking applications
> that include linux headers directly. I've reported the issue upstream
> https://github.com/appneta/tcpreplay/issues/275 if I get time I'll see
> if I submit a fix for it.

This is a libc/kernel issue. I'm not sure libc users can do much about that.

This build failure is fixed by commit 69ced963555b (musl: workaround kernel 
if_ether.h header conflict). The autobuilder needs a rebuild of its pre-built 
toolchains to take effect.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
