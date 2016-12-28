From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 Dec 2016 11:32:21 +0200
Subject: [Buildroot] [PATCH] fs/tar: make --no-recursion effective
In-Reply-To: <87o9zwbe95.fsf@dell.be.48ers.dk>
References: <a5d19ac14d835abbc645fef67aad61ce48e247b9.1482860523.git.baruch@tkos.co.il>
 <87o9zwbe95.fsf@dell.be.48ers.dk>
Message-ID: <20161228093220.kgnkh7r4eogp5wau@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Dec 28, 2016 at 10:21:26AM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > The tar --no-recursion option is position sensitive. It only affects following
>  > file listing options. Move --no-recursion before the -T option to make it
>  > effective. This fixes duplication of entries in the generated rootfs.tar
>  > archive.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I got a bit confused by this, as the manual explicitly shows the -T -
> --no-recursion sequence:
> 
> https://www.gnu.org/software/tar/manual/html_section/tar_54.html

That part of the tar manual looks wrong. The "Position-Sensitive Options"[1] 
section shows this example to illustrate the position sensitivity concept:

  tar -cf a.tar --recursion /usr --no-recursion /var/*

[1] https://www.gnu.org/software/tar/manual/html_section/tar_22.html#SEC44

> But indeed, tar -tvf output/images/rootfs.tar | grep '/usr/$' had 2 hits
> before, and not after applying this patch - So committed, thanks!

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
