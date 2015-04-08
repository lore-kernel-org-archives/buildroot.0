From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Apr 2015 10:26:12 +0300
Subject: [Buildroot] [PATCH] procps-ng: fix/patch wrong ncursesw headers
 assumption
In-Reply-To: <1428447006-6279-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428447006-6279-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408072612.GF2241@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Apr 07, 2015 at 07:50:06PM -0300, Gustavo Zacarias wrote:
> The configure script/code assumes ncursesw headers live in
> /usr/include/ncursesw.
> That's a distribution-ism where they want to have both versions for
> ABI/API compatibility, but not the case for embedded where that's not a
> concern.
> Hence kill the hard-coding and use pkg-config to find this out instead
> of the half-made effort about it.
> Fixes:
> http://autobuild.buildroot.net/results/97d/97dc7f238457609c861c24f81b556973f5dec9c1/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks. This supersedes my patch http://patchwork.ozlabs.org/patch/458254/.

Tested-by: Baruch Siach <baruch@tkos.co.il>
[build only]

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
