From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 17 Mar 2018 23:44:33 +0200
Subject: [Buildroot] [PATCH] glibc: install the obsolete libnsl
In-Reply-To: <40bb97a2-602f-5e5c-58da-26a57b512efd@lucaceresoli.net>
References: <d9f3b3cf8413fcabd4468a6057ee399a3968d20d.1520956780.git.baruch@tkos.co.il>
 <40bb97a2-602f-5e5c-58da-26a57b512efd@lucaceresoli.net>
Message-ID: <20180317214433.ymu7vuk4b64ztyzk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Sat, Mar 17, 2018 at 10:33:24PM +0100, Luca Ceresoli wrote:
> On 13/03/2018 16:59, Baruch Siach wrote:
> > glibc 2.27 stopped installing libnsl by default. Restore libnsl install
> > to fix packages, like exim, that use that library.
> 
> Are you aware of other packages using it?

I'm not aware of any.

> > Fixes (exim):
> > http://autobuild.buildroot.net/results/a19/a19df43be7d27cf8815e1257122d25aa8285d75b/
> > http://autobuild.buildroot.net/results/8ec/8ecfc42a81efec8485784f945e231eb40a087b5b/
> > http://autobuild.buildroot.net/results/054/054eb702a9b8c66454970333ef45a0afccb7cc80/
> > 
> > Cc: Waldemar Brodkorb <wbx@openadk.org>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> [Tested on
> http://autobuild.buildroot.net/results/cbbb893a03dd1f6dfd67d1144ead0473938e3283/
> ]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Thanks.

> However the glibc NEWS file says libnsl is deprecated and has been moved
> to an external library [0]. So it will likely be removed at some point,
> and thus this is only a temporary solution.

When glibc drops libnsl completely we can patch out the libnsl dependency of 
exim, like we do when linking with non-glibc libc. Hopefully upstream exim 
will find a better solution by then.

> [0]
> https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=5c0a3c6780ba4d8fc550e0eecdb43e1ded228049;hb=HEAD#l748

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
