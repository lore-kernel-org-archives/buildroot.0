From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Oct 2015 17:33:55 +0300
Subject: [Buildroot] [PATCH 1/1] bridge-utils: add upstream patch fixing
 sysfs writes
In-Reply-To: <CAAXf6LV-wLpA1Y9bGWshMoYnKBfR5FvjL5PguMr=G6M43ZPNwQ@mail.gmail.com>
References: <1444918579-30926-1-git-send-email-patrickdepinguin@gmail.com>
 <20151015142002.GF2451@tarshish>
 <CAAXf6LV-wLpA1Y9bGWshMoYnKBfR5FvjL5PguMr=G6M43ZPNwQ@mail.gmail.com>
Message-ID: <20151015143355.GG2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Oct 15, 2015 at 04:31:16PM +0200, Thomas De Schampheleire wrote:
> On Thu, Oct 15, 2015 at 4:20 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Thu, Oct 15, 2015 at 04:16:19PM +0200, Thomas De Schampheleire wrote:
> >> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> >>
> >> Add upstream patch that fixes a sysfs path in br_set.
> >> The patch is on top of the latest release 1.5, which already dates from
> >> 2011.
> >>
> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> >> ---
> >>  package/bridge-utils/0003-sysfs-write-fixes.patch | 79 +++++++++++++++++++++++
> >>  1 file changed, 79 insertions(+)
> >>  create mode 100644 package/bridge-utils/0003-sysfs-write-fixes.patch
> >>
> >> diff --git a/package/bridge-utils/0003-sysfs-write-fixes.patch b/package/bridge-utils/0003-sysfs-write-fixes.patch
> >> new file mode 100644
> >> index 0000000..2f36209
> >> --- /dev/null
> >> +++ b/package/bridge-utils/0003-sysfs-write-fixes.patch
> >> @@ -0,0 +1,79 @@
> >> +commit bb9970a9df95837e39d680021b1f73d231e85406
> >> +Author: Stephen Hemminger <shemminger@vyatta.com>
> >> +Date:   Tue May 3 09:52:43 2011 -0700
> >> +
> >> +    Check error returns from write to sysfs
> >> +
> >> +    Add helper function to check write to sysfs files.
> >> +
> >> +
> >> +[tdescham: this patch also fixes an incorrect path in br_set]
> >
> > Your sign-off on this patch is missing.
> 
> Is that also necessary for untouched, imported patches?
> 
> (I've been out of buildroot development for a while :-o)

Yes. It's a legal statement. See 
http://elinux.org/Developer_Certificate_Of_Origin.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
