From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Mar 2017 09:25:24 +0200
Subject: [Buildroot] [git commit] system: do not overwrite /bin/sh
	Busybox symlink
In-Reply-To: <87h929x6l9.fsf@dell.be.48ers.dk>
References: <20170329212901.DE1518265E@busybox.osuosl.org>
 <87h929x6l9.fsf@dell.be.48ers.dk>
Message-ID: <20170331092524.5912de2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 09:12:34 +0200, Peter Korsgaard wrote:

>  > commit: https://git.buildroot.net/buildroot/commit/?id=fc91501e6b32ef1b015ac9b0fbf6d64aa1ce0162
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master  
> 
>  > The BR2_SYSTEM_BIN_SH hidden option defines to what binary the /bin/sh
>  > symlinks should point to. If busybox is chosen, then /bin/sh is created
>  > to point to /bin/busybox.  
> 
>  > This works fine with the default installation mode of Busybox, but it
>  > fails with the upcoming "individual binaries" mode, in which each applet
>  > is installed as its own binary, and /bin/busybox doesn't exist: we get
>  > /bin/sh as a broken symlink to /bin/busybox.  
> 
>  > Since Busybox already installs its own /bin/sh symlink, properly
>  > pointing to /bin/ash or /bin/hush depending on the selected shell, it
>  > doesn't make sense for the BR2_SYSTEM_BIN_SH logic to override
>  > this. Just let Busybox install its own /bin/sh by making
>  > BR2_SYSTEM_BIN_SH empty when Busybox shell is selected as /bin/sh.  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>  > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> 
> Committed to 2017.02.x, thanks.

I don't think this one was needed for the LTS branch. Really it's not a
fix. This patch is only useful for the support of installing Busybox as
individual binaries, which will anyway not go into the LTS branch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
