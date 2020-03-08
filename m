From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 08 Mar 2020 10:39:01 +0200
Subject: [Buildroot] [PATCH v3 1/8] package/mariadb: fix permissions of
 data dir when using systemd
In-Reply-To: <877dzvx3js.fsf@dell.be.48ers.dk>
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <877dzvx3js.fsf@dell.be.48ers.dk>
Message-ID: <874kuzxmu2.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Mar 07 2020, Peter Korsgaard wrote:
>>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:
>
>  > mysql_install_db is currently called in the systemd unit without
>  > --user=mysql that the sysv script uses. This will generate the initial
>  > database files with root permissions. However, mysqld runs as user mysql
>  > so this will cause problems. We fix this by calling chown instead of
>  > passing the user parameter because an upcoming version bump will fail when
>  > ran this way.
>
>  > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
>  > ---
>  > Changes v2 -> v3:
>  >   - separate changes into separate patches (suggested by Thomas)
>  > Changes v1 -> v2:
>  >   - no change
>
> Committed to 2019.02.x and 2019.11.x, thanks.

Not in 2019.02.x as of 06d3d2602, or 2019.11.x as of 51f9a97831e.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
