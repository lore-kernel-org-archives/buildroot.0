From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 11:45:09 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-29
In-Reply-To: <20160301104110.GO2399@tarshish>
References: <20160301073021.01B48101C84@stock.ovh.net>
 <20160301104110.GO2399@tarshish>
Message-ID: <20160301114509.7f078e7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Tue, 1 Mar 2016 12:41:10 +0200, Baruch Siach wrote:

> On Tue, Mar 01, 2016 at 08:30:20AM +0100, Thomas Petazzoni wrote:
> >     mips64el |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/752eeb388e7d1ab8de28e61b3a0d91953e62c3da/
> > microblazeel |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/45cb459f030edf4cb519133a4b621bb44d9ce901/
> >       x86_64 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/8e8b12dbca4ef8cac2e5f33cd3cdcddd8e849840/
> 
> The direct trigger of these failures is apparently c7bfa2310724 (package/zsh: 
> add optional support for pcre, 2016-02-21). But the real cause seems to be 
> that the pcre-config script of host-pcre overwrites that of target pcre. That 
> causes all sort of mis-detections in the configure stage. Not sure what is the 
> right fix here. A pre-package staging directory might fix most occurrences of 
> this problem.

Normally the rule is that:

 1/ *-config scripts for host libraries are installed in
    $(HOST_DIR)/usr/bin

 2/ *-config scripts for target libraries are installed in
    $(STAGING_DIR)/usr/bin

 3/ Target packages are convinced to use the *-config scripts from
    $(STAGING_DIR) by passing the appropriate configure environment
    variables.

How is it possible that the pcre-config script of host-pcre overwrite
the one of target pcre ? They should not be installed in the same
directories.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
