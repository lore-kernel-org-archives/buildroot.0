From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Sep 2012 21:32:26 +0200
Subject: [Buildroot] External toolchain with eglibc?
In-Reply-To: <CALoHCLOYcabRC5FZqLqAMyRdFUR7ALu4D7i-MjDuFYyOQm4OSA@mail.gmail.com>
References: <CALoHCLOYcabRC5FZqLqAMyRdFUR7ALu4D7i-MjDuFYyOQm4OSA@mail.gmail.com>
Message-ID: <20120924193225.GB4439@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Mon, Sep 24, 2012 at 11:02:13AM -0700, Eric Seifert wrote:
> I am using an external toolchain (custom toolchain) and it asks which
> external toolchain C library I am using, the only two options listed are
> uClibc and glibc. My external toolchain uses eglibc, does this matter?
> Should I select glibc?

You should select glibc. glibc and eglibc are almost the same as far as 
Buildroot is concerned. The Linaro toolchains also use eglibc, and select the 
BR2_TOOLCHAIN_EXTERNAL_GLIBC config symbol. We should probably change the 
prompt string to "glibc/eglibc", patch follows.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
