From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Oct 2017 17:09:57 +0200
Subject: [Buildroot] [PATCH] sqlite: add security patches
In-Reply-To: <87wp3n9qep.fsf@dell.be.48ers.dk>
References: <612f27420cbbca777de7bfcf3747769cebe1727b.1508680808.git.baruch@tkos.co.il>
 <87wp3n9qep.fsf@dell.be.48ers.dk>
Message-ID: <20171022150957.6vvwvgfhclafh4mf@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Oct 22, 2017 at 05:02:38PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > CVE-2017-13685: The dump_callback function in SQLite 3.20.0 allows
>  > remote attackers to cause a denial of service (EXC_BAD_ACCESS and
>  > application crash) via a crafted file.
> 
>  > CVE-2017-15286: SQLite 3.20.1 has a NULL pointer dereference in
>  > tableColumnList in shell.c
>  > because it fails to consider certain cases where
>  > `sqlite3_step(pStmt)==SQLITE_ROW` is false and a data structure is never
>  > initialized.
> 
> Do you know if this also applies to 2017.08.x (3.19.3) or 2017.02.x
> (3.16.2)?

According to the Debian CVE-2017-13685 tracker page[1] versions as old as 
3.7.13 are affected.

The CVE-2017-15286 page[2] indicates that 3.16.2 is not affected. Not sure 
about 3.19.3.

[1] https://security-tracker.debian.org/tracker/CVE-2017-13685

[2] https://security-tracker.debian.org/tracker/CVE-2017-15286

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
