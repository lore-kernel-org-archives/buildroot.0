From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 28 Nov 2015 22:30:41 +0200
Subject: [Buildroot] [PATCH] support/dependencies: ensure we have 'file'
 on the host
In-Reply-To: <1448654529-27021-1-git-send-email-yann.morin.1998@free.fr>
References: <1448654529-27021-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151128203041.GB2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Nov 27, 2015 at 09:02:09PM +0100, Yann E. MORIN wrote:
> When 'file' is missing on the host, libtool fails miserably. Packages
> that use libtool will suddenly FTBFS, with cryptic error messages, like
> missing libraries on the linker invocation.
> 
> We could ensure that autotools based packages now all depend on
> host-file. But It itself is an autotools package, so it's again a
> chicken-n-egg issue. And even non-autotools package may use libtool.
> 
> So, just require that 'file' is present on the host.

The "Mandatory packages" section in docs/manual/prerequisite.txt should 
mention that.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
