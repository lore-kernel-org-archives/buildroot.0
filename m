From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Nov 2016 09:59:37 +0200
Subject: [Buildroot] [BUG] missing file with an overlay
In-Reply-To: <CAB0FRsvLBALu3YW27JOgxdG0CG7vmyeD8Tkmxs+3jHSgbMExKw@mail.gmail.com>
References: <CAB0FRsvLBALu3YW27JOgxdG0CG7vmyeD8Tkmxs+3jHSgbMExKw@mail.gmail.com>
Message-ID: <20161115075937.mxy3hv7dmfrdwcow@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Tue, Nov 15, 2016 at 08:49:28AM +0100, Fran?ois Perrad wrote:
> With an overlay which contains a file var/spool/cron/crontabs/root,
> the file is copied in output/target/var/spool/cron/crontabs/root.
> But the file is not present in rootfs, because spool (like cache,
> lock, log) stay a symbolic link to ../tmp

You can use BR2_ROOTFS_SKELETON_CUSTOM to define you own skeleton without the 
/var/spool symlink.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
