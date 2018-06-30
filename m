From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:39:17 +0200
Subject: [Buildroot] [PATCH v3] dropbear: enable PAM authentication if
 linux-pam is selected
In-Reply-To: <20180630183226.6f39e0e1@windsurf.home>
References: <20180629115039.52bpwyk7xenbly53@tarshish>
 <20180629122109.7356-1-casantos@datacom.com.br>
 <20180630183226.6f39e0e1@windsurf.home>
Message-ID: <20180630223917.211d9979@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, Baruch,

On Sat, 30 Jun 2018 18:32:26 +0200, Thomas Petazzoni wrote:

> On Fri, 29 Jun 2018 09:21:09 -0300, Carlos Santos wrote:
> > - Disable password file authentication, since it's not possible to have
> >   both at once.
> > - Install a /etc/pam.d/sshd file, based on the one installed by openssh.
> > 
> > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> > Reviewed-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > Changes v1->v2:
> > - Fix commit message.
> > Changes v2->v3:
> > - athentication -> authentication (gah!)  
> 
> Applied to master, thanks.

Since you're looking at dropbear, could you review the following
patches:

  http://patchwork.ozlabs.org/patch/909724/
  http://patchwork.ozlabs.org/patch/884051/

The former looks OK to me, but the latter seems less OK as I'm not sure
we want to handle this specifically for dropbear: there are other SSH
servers as well. Let me know if you see a reason to have that second
patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
