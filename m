From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Jan 2014 13:51:03 +0200
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <CAHt8ZCP=Xicy5PWy7rd_i-YfwPO0KjV5imeKacOSwg0fWMtmLw@mail.gmail.com>
References: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
 <20140107033917.GD4503@tarshish>
 <CAHt8ZCP=Xicy5PWy7rd_i-YfwPO0KjV5imeKacOSwg0fWMtmLw@mail.gmail.com>
Message-ID: <20140107115103.GA4659@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Tue, Jan 07, 2014 at 11:17:14AM +0000, Simon Dawson wrote:
> Hi Baruch. Thanks for the feedback.
> 
> On 7 January 2014 03:39, Baruch Siach <baruch@tkos.co.il> wrote:
> > My uClibc toolchain has spawn.h as well. Is this a specific feature that is
> > missing in uClibc?
> 
> Are you sure that spawn.h is present? My uClibc 0.9.33.2 doesn't have
> it, and I can't see where it would come from... Apparently, the spawn
> function family is not currently supported in uClibc.

This was added with uClibc commit 0dcf66744f53 (librt: add posix_spawn 
support), which is only in the snapshot version. I think you may add 
BR2_UCLIBC_VERSION_SNAPSHOT to the dependency list.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
