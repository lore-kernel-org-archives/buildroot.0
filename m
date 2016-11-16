From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Nov 2016 17:45:16 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <20161115233347.107fd31d@free-electrons.com>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <b08117ad-6edc-245d-0650-0db5eb1775ce@mind.be>
 <20161115233347.107fd31d@free-electrons.com>
Message-ID: <20161116154516.w2e2wqerideqxsra@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Nov 15, 2016 at 11:33:47PM +0100, Thomas Petazzoni wrote:
> On Sun, 13 Nov 2016 22:33:31 +0100, Arnout Vandecappelle wrote:
> 
> >  However, if bridge-utils and norm are really the only packages that suffer from
> > this problem, is it really worthwhile to apply this workaround?
> 
> I'm sure there are more packages that we have patched for this reason,
> and possibly other build failures still unfixed that would get fixed
> (or at least partially).
> 
> *However*, the musl folks have already committed a patch that
> apparently resolves the problem:
> 
>    http://git.musl-libc.org/cgit/musl/commit/?id=04983f2272382af92eb8f8838964ff944fbb8258
> 
> Baruch, could you investigate whether this musl commit fixes the header
> conflict problem for bridge-utils and norm?

The commit log links to this musl commit and to a mailing list report[1] that 
this fix is not enough on its own. As a result of this discussion Felix Janda 
posted a kernel patch[2] to address the issue. See also Rich's response[3]. 
Even if this patch is accepted, we'll most likely have to keep this 
workaround, or an equivalent, for as long as we support kernel headers v4.9 
and older.

[1] http://www.openwall.com/lists/musl/2016/11/09/2
[2] http://www.openwall.com/lists/musl/2016/11/11/1
[3] http://www.openwall.com/lists/musl/2016/11/11/2

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
