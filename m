From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 06 Sep 2020 09:34:07 +0300
Subject: [Buildroot] package/strace --enable-mpers=no
In-Reply-To: <CAEyMn7a8hML1-mFD11YMWoZ7VM+YHLNJQyBJEpg5x2jJx2qXRw@mail.gmail.com>
References: <CAEyMn7a8hML1-mFD11YMWoZ7VM+YHLNJQyBJEpg5x2jJx2qXRw@mail.gmail.com>
Message-ID: <87k0x72z34.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

On Sun, Sep 06 2020, Heiko Thiery wrote:
> I faced an issue when building strace for aarch64 on my host where a
> 32bit arm toolchain is installed. As discussed with Brandon on IRC
> strace seems to find the 32bit toolchain because of the
> --enable-mpers=check option and fails with that.
>
> Do you think it makes sense to set --enable-mpers=no since buildroot
> does not support multi personality toolchains?
>
> [1] https://pastebin.com/8uaFHgyP
> [2] https://pastebin.com/GeSYYvnB

I never really got around to fully understand strace mpers handling. I
have been bitten by mpers in the past (commit fc0d31caeedb).

Buildroot built strace might run on external executable binaries. If
this functionality is useful, I don't think we should just disable it.

Why didn't the autobuilders catch this failure?

James' autobuilder does show a different mpers related build failure:

  http://autobuild.buildroot.net/?reason=strace-5.7

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
