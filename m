From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 6 Feb 2018 12:42:10 -0500
Subject: [Buildroot] [PATCH 1/1] ncurses: bump to 6.1
In-Reply-To: <20180206171659.42af67e1@windsurf>
References: <20180206134603.19957-1-aduskett@gmail.com>
 <20180206171659.42af67e1@windsurf>
Message-ID: <CAFSsvmrw9L5ETBMKP4Hu_vXeNCmW4eVq_ZQsYedgRNxVDqx1sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Tue, Feb 6, 2018 at 11:16 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Tue,  6 Feb 2018 08:46:03 -0500, Adam Duskett wrote:
>> Remove 0002-recognise-uclinux.patch as it has been applies upstream.
>>
>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>> ---
>>  package/ncurses/0001-gcc-5.x-MKlib_gen.patch |  5 +++--
>>  package/ncurses/0002-recognise-uclinux.patch | 29 ----------------------------
>>  package/ncurses/ncurses.hash                 |  2 +-
>>  package/ncurses/ncurses.mk                   |  2 +-
>>  4 files changed, 5 insertions(+), 33 deletions(-)
>>  delete mode 100644 package/ncurses/0002-recognise-uclinux.patch
>
> This seems to break the build:
>
>   http://autobuild.buildroot.net/results/3a5/3a5ddfcf7cd3a5c2bc068e3e33c823d6bcd3e79b/build-end.log
>
> It's because "install -s" is being used, which strips the binary, but
> it's using plain "strip" and not the cross strip. Ideally, it shouldn't
> strip the binary at all.
>
> Could you have a look ?
>
I pushed a patch:
https://patchwork.ozlabs.org/patch/869964/

Ncurses introduces the "--disable-stripping" option (which is set to
no by default).
enabling the option seems to have fixed the issue!

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

Adam
