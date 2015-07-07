From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Jul 2015 14:28:09 +0300
Subject: [Buildroot] [PATCH] fs/cpio: drop static random-seed
In-Reply-To: <87fv50nrz6.fsf@dell.be.48ers.dk>
References: <b00f4e7c142fdff8a1f311de5816008b08b13e67.1436263286.git.baruch@tkos.co.il>
 <87fv50nrz6.fsf@dell.be.48ers.dk>
Message-ID: <20150707112809.GR3139@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Jul 07, 2015 at 01:10:21PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Initializing the kernel entropy pool in initramfs from a seed file that never
>  > changes doesn't make much sense. Not initializing the entropy pool at all is
>  > better than initializing it from a known seed.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I agree, but why don't we simply drop our static /etc/random-seed from
> the default skeleton instead?

Good idea. /etc/random-seed is less harmful on persistent filesystems, as it 
only affects the first boot. But it probably doesn't do any good either.

In addition to that I think it would also be better not to use 
/etc/random-seed when the filesystem is read-only, even when that file exists. 
Currently /etc/init.d/S20urandom reads /etc/random-seed from a read-only 
filesystem, but doesn't write it, which seems just wrong.

What do you thing?

I'll send patches if everybody agree on the plan.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
