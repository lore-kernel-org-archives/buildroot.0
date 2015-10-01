From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Oct 2015 10:16:46 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-09-30
In-Reply-To: <20151001063016.DF1C9101E4A@stock.ovh.net>
References: <20151001063016.DF1C9101E4A@stock.ovh.net>
Message-ID: <20151001071646.GA3337@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Thu, Oct 01, 2015 at 08:30:16AM +0200, Thomas Petazzoni wrote:
> Build statistics for 2015-09-30
> ===============================
>       xtensa |              e2fsprogs-1.42.13 | NOK | http://autobuild.buildroot.net/results/2a20e454a597f1e18beb2feb9242a84d3303e735/

pass5.c: In function 'check_inode_bitmaps':
pass5.c:614:10: warning: comparison between pointer and integer
       (i == fs->super=>s_inodes_count)) {
          ^
pass5.c:614:23: error: expected expression before '>' token
       (i == fs->super=>s_inodes_count)) {
                       ^

The original code line[1] is:

       (i == fs->super->s_inodes_count)) {

Looks like a bitflip on the build machine, as ASCII '=' (0b0111101) is just 
one bitflip away from '-' (0b0101101).

[1] 
https://git.kernel.org/cgit/fs/ext2/e2fsprogs.git/tree/e2fsck/pass5.c?id=v1.42.13#n614

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
