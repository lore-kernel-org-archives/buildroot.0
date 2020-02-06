From: Alex Corcoles <alex@corcoles.net>
Date: Thu, 6 Feb 2020 19:00:44 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <d69167a6-8c09-8318-e646-5b2ae4a84991@xes-inc.com>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
 <20200119213102.GA2894@ned>
 <CAPAYC_xA2zkmmADgr9G2mspcS=Ej16wOM75rT-aCKbK42hzk5g@mail.gmail.com>
 <CAPAYC_wFywnPH6j8muHXvX1n+bLrWkZxBMrm+ywXQAyTbvsK8Q@mail.gmail.com>
 <CAPAYC_whFdF00V4M9qZEZOPz4VTMzJ1aOdruR-qjvUKkWw93uQ@mail.gmail.com>
 <CAPAYC_yo=DkwQzeF-t9jqH6p2ywBF2+=+5agrKA-vhWULAB71A@mail.gmail.com>
 <d69167a6-8c09-8318-e646-5b2ae4a84991@xes-inc.com>
Message-ID: <CAPAYC_ws6G_P8xDeZ7qVeDF3RLARud62JNYd2XECJYs1C8Myaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Thu, Feb 6, 2020 at 6:50 PM Vincent Fazio <vfazio@xes-inc.com> wrote:

> I'm not familiar with Rust, but there should be a cleaner way to set the
> target cpu than hacking the default. Preferably the target MIPS cpu
> selected within Buildroot would inform the target cpu?
>
> A quick search seems to suggest this may be possible
> (https://gitissue.com/issues/5a1e9e776805170abd3c8a38):
>
> [build]
> target = "mipsel-unknown-linux-gnu"
>
> [target.mipsel-unknown-linux-gnu]
> rustflags = [
>    "-C", "link-arg=-EL",
>    "-C", "target-cpu=mips32",
>    "-C", "target-feature=+mips32,-mips32r2,-fpxx,-nooddspreg",
> ]
>

Yeah, probably there are slightly cleaner solutions. I think that Rust
targetting mips32r2 by default sucks a little bit, so I'm not losing hope
completely that the change will be reverted. If they do so, I think it
would be quite easy for buildroot to iron out the few niggles required to
get this to work.

However, I'm not really knowledgeable about buildroot, so all the patches
involved in this are terrible. I saw the solution you quote at:

https://github.com/rust-lang/rust/issues/37507#issuecomment-476026815

, but I wasn't sure how to plug that cleanly into buildroot, so I went for
the ugly solution. Perhaps I can plug that into buildroot/package/rust/
rust.mk, though. If I have some time I will try to clean things up
(unfortunately, I was unemployed since mid-November, which gave me tons of
spare time for this silly stuff... but I start a new job on Monday, so I
won't have so much time..,).

If someone wants to spend time on this, I will be happy to test or
whatever, though.

Cheers,

?lex
-- 
   ___
 {~._.~}
  ( Y )
 ()~*~()  mail: alex at corcoles dot net
 (_)-(_)  http://alex.corcoles.net/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200206/9e12a4ac/attachment.html>
