From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Dec 2013 09:16:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-09
In-Reply-To: <ad79e2e1-bce2-4354-8b64-7b2bc5082d0e@email.android.com>
References: <20131210073007.6A2C4100850@stock.ovh.net>
 <20131211043812.GA1217@tarshish>
 <ad79e2e1-bce2-4354-8b64-7b2bc5082d0e@email.android.com>
Message-ID: <20131211071643.GF1217@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Dec 11, 2013 at 07:28:35AM +0100, Thomas De Schampheleire wrote:
> Baruch Siach <baruch@tkos.co.il> wrote:
> >On Tue, Dec 10, 2013 at 08:30:07AM +0100, Thomas Petazzoni wrote:
> >>     xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/0b9b3bb1791bbc9f902a23360c4540d90a0e05ca/
> >>     xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/ffda6f3f64c612da999229226f699c01ccebe4c2/
> >
> >I'm struggling with this one. The configure script test for posix_spawn build 
> >fails because it lacks '-lrt'. This causes m4 to use an internal 
> >implementation that fails at build time for some other reason (haven't found 
> >the reason for that yet).
> >
> >How can I add -lrt to the build test command line?
> 
> Isn't this by adding/setting the LIBS variable before
> calling the macro that executes the test? 

Thanks, I'll try that. This macro seems to be called from m4/spawn_h.m4. This 
failures seems to be xtensa specific. I wonder how other archs handle this.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
