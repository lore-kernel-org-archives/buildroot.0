From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 9 May 2014 08:11:43 +0300
Subject: [Buildroot] [PATCH v3] protobuf: fix build for some unsupported
	architectures
In-Reply-To: <87k39waqoh.fsf@dell.be.48ers.dk>
References: <7785bef8562b61c25931c80386ab9a60fe80459f.1399554410.git.baruch@tkos.co.il>
 <871tw4cauk.fsf@dell.be.48ers.dk> <20140508204850.GO3861@tarshish>
 <87k39waqoh.fsf@dell.be.48ers.dk>
Message-ID: <20140509051143.GP3861@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, May 08, 2014 at 11:47:26PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  >> So it looks like we need to tweak the arch list a bit.
> 
>  > The generic internal atomic ops implementation (which is used to fix
>  > powerpc build) is using the gcc feature of "memory model aware atomic
>  > operations".  These were introduced in gcc 4.7, while the Sourcery
>  > toolchain is gcc 4.5. I don't see a straightforward way to depend on
>  > gcc version like we have for kernel headers. Any ideas?
> 
> Hmm, not really - No :/ So that makes the patch less interesting :/

OK. So we are only left with x86, ARM and MIPS.

BTW, how do we handle host architecture dependencies? This is applicable to 
http://autobuild.buildroot.net/results/20b/20b1d279b12176c0dcbaa8b5f170f6c8a55eb6da/ 
(PowerPC host).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
