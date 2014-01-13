From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2014 10:25:45 +0200
Subject: [Buildroot] [PATCH v2] rt-tests: disable NPTL is missing
In-Reply-To: <20140113161012.06535faf@skate>
References: <0255f67e72bc626106163b3cfb821a68d99970fd.1389596187.git.baruch@tkos.co.il>
 <20140113161012.06535faf@skate>
Message-ID: <20140113082545.GK4944@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 13, 2014 at 04:10:12PM +0800, Thomas Petazzoni wrote:
> On Mon, 13 Jan 2014 08:56:27 +0200, Baruch Siach wrote:
> 
> > +	# priority-inheritance mutex needs NPTL
> > +	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
> 
> No, these symbols are specific to the internal toolchain backend, and
> do not make sense for external toolchains. Therefore, they shouldn't be
> used for package dependencies.

Well, my v1 patch didn't have this dependency. Do you have any better 
suggestion for the NPTL situation?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
