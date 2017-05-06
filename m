From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 7 May 2017 01:05:04 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-05
In-Reply-To: <20170506215714.frikpdlcuwom57fm@tarshish>
References: <20170506062848.3CE3120C7A@mail.free-electrons.com>
 <20170506215714.frikpdlcuwom57fm@tarshish>
Message-ID: <20170506220504.c4pyl4d2hfmglxw5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 07, 2017 at 12:57:14AM +0300, Baruch Siach wrote:
> On Sat, May 06, 2017 at 08:28:48AM +0200, Thomas Petazzoni wrote:
> >          arm |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/7091ad71e743efb5fd530357b0f59c5c2b0e6d8f |     
> 
> Seems to be related to the recent libnl version bump, though I could not 
> figure out how. I could not reproduce this failure here, even after installing 
> host libnl header files.
> 
> For some reason the following wpan-tools macro evaluates to true:
> 
> src/nl_extras.h:
> #if (LIBNL_VER_MIN < 2) || (LIBNL_VER_MIN == 2) && (LIBNL_VER_MIC <= 26)

Scratch that. Just found your commit 5d80e1c9263b in my tree.

Sorry for the noise,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
