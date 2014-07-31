From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 31 Jul 2014 06:26:52 +0300
Subject: [Buildroot] [PATCH 2/2 v2] package/patchelf: new host package
In-Reply-To: <fc8f5090621f94da255a6191eec78125047eb318.1406760999.git.yann.morin.1998@free.fr>
References: <cover.1406760999.git.yann.morin.1998@free.fr>
 <fc8f5090621f94da255a6191eec78125047eb318.1406760999.git.yann.morin.1998@free.fr>
Message-ID: <20140731032652.GF2480@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Jul 31, 2014 at 12:57:16AM +0200, Yann E. MORIN wrote:
> In some situations, users may want to tweak the dynamic section of the
> binaries (for example to add/set the RPATH to $ORIGIN/../lib).
> 
> Because it is not trivial to do it properly from the Buildroot
> infrastructure, allow those users to use patchelf (e.g. from a
> post-build script) to tweak binaries.
> 
> patchelf is able to:
>   - modify an existing DT_RUNPATH tags
>   - add a DT_RUNPATH tag if not already present
>   - do the above to the DT_RPATH tag, too
>   - set the path to the interpreter
>   - remove DT_NEEDED tags
>   - query a binary for the DT_RUNPATH/DT_RPATH tag, or for the
>     interpreter path
> 
> Does not really fix #7172, but this is an appropriate workaround.

Maybe this is worth a mention as a workaround to the known issue of #7172 in 
the manual?

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
