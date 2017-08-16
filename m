From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 10:39:02 +0200
Subject: [Buildroot] [PATCH v2 1/2] whois: fix build with NLS disabled
In-Reply-To: <20170816034027.flnapeznknwvkllk@tarshish>
References: <a73c8c9cceb698f9b2fa61339baa694087a00377.1502824481.git.baruch@tkos.co.il>
 <20170816034027.flnapeznknwvkllk@tarshish>
Message-ID: <20170816103902.0b889b11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 06:40:27 +0300, Baruch Siach wrote:
> Hi Thomas, all,
> 
> On Tue, Aug 15, 2017 at 10:14:40PM +0300, Baruch Siach wrote:
> > whois build uses the xgettext utility to build translation files.
> > This utility may not be available when NLS is disabled. Add a patch that
> > allows skipping the generation of translation files. Use that to skip
> > the translation when NLS is disabled.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/862/862d8165a59711c970c65d90009a527315a1a6b4/
> > http://autobuild.buildroot.net/results/b62/b62ec9d6f350e409731d47ffb585344c516944e8/
> > http://autobuild.buildroot.net/results/be2/be28d06ae004a46c87133d6f07709c6f909288d8/
> > 
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > v2: patch to add HAVE_GETTEXT that allows disable for gettext (Thomas P)  
> 
> Upstream rejected[1] the patch, basically suggesting the approach of v1[2], 
> that is, make only the targets we want while omitting the gettext targets. So 
> we can either carry this patch forever, or apply [2].

OK, fair enough, let's take your original PATCH 1/3. Thanks for pushing
this further anyway!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
