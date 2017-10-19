From: Dushara Jayasinghe <nidujay@gmail.com>
Date: Thu, 19 Oct 2017 21:20:45 +1100
Subject: [Buildroot] [V2 3/3] prosody: remove tweaked configuration
In-Reply-To: <20171018223136.49cbc0de@windsurf.home>
References: <20171018164650.514-1-francois.perrad@gadz.org>
 <20171018164650.514-3-francois.perrad@gadz.org>
 <20171018223136.49cbc0de@windsurf.home>
Message-ID: <20171019102045.GA4544@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Oct 18, 2017 at 10:31:36PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 18 Oct 2017 18:46:50 +0200, Francois Perrad wrote:
> > Upgrading a tweaked configuration is painful,
> > so stay with the upstream configuration which is already installed.
> > 
> > Everybody could make its own configuration in its rootfs_overlay.
> > 
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/prosody/prosody.cfg.lua | 184 ----------------------------------------
> >  package/prosody/prosody.mk      |  11 ---
> >  2 files changed, 195 deletions(-)
> >  delete mode 100644 package/prosody/prosody.cfg.lua
> 
> I'd like to have the opinion of the package submitter, Dushara
> Jayasinghe, on this patch. Dushara, can you comment on why you added a
> custom prosody.cfg, as opposed to using the one provided in the
> upstream package?

My primary motive was for the package to 'just work'. 

1. Prosody requires the posix module to be enabled for proper deamonization
2. Logging by default is to files and not syslog (for this too, the
   posix module is required)
3. I added a service startup script. However, in order to terminate the
   service cleanly, a pidfile is required (due to lua being the process
   name). Prosody has a config option to create the pidfile.

Hope that helps.

Dushara
