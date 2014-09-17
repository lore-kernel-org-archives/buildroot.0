From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Sep 2014 15:21:24 +0200
Subject: [Buildroot] [PATCH 6/6] targetcli-fb: add sysv initscript
In-Reply-To: <20140917151925.15b49f86@grp-cvubrugier>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-7-git-send-email-cvubrugier@fastmail.fm>
 <20140917141204.5dbaa667@free-electrons.com>
 <20140917151925.15b49f86@grp-cvubrugier>
Message-ID: <20140917152124.62d30631@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 17 Sep 2014 15:19:25 +0200, Christophe Vu-Brugier wrote:

> > This should not be handled using a post install target hook, but rather
> > using the TARGETCLI_FB_INIT_SYSV mechanism. See the Buildroot manual or
> > other packages for example (dnsmasq for example, or ntp if you want to
> > see both the SysV and the systemd cases).
> 
> OK. By the way, I also intend to add a systemd unit file later.

Great!

> > This should continue to belong to post install hook because it isn't
> > related to which init system is used. Is the test really necessary in
> > this case? Maybe you can just to the $(INSTALL), which doesn't fail if
> > the directory already exists I believe. If not, just use mkdir -p and
> > that's it. If you really want to be nice, you could also add a comment
> > above the hook explaining why this directory is needed.
> 
> The directory "/etc/target" is needed because it is expected by
> targetcli. The configuration of the "SCSI target" driver is stored in a
> JSON file named "/etc/target/saveconfig.json". This configuration is
> used to create the configfs hierarchy that configures the target driver.

Ok, makes sense. Maybe just add exactly this explanation as a comment
above the creation of /etc/target ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
