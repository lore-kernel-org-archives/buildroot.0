From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 8 Oct 2008 10:20:23 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/vsftpd
In-Reply-To: <gcg0k4$7ap$1@ger.gmane.org>
References: <20081006224641.F0B81F8008@busybox.net>
	<20081007055134.GF5127@cloud.net.au> <gcg0k4$7ap$1@ger.gmane.org>
Message-ID: <20081007232023.GB7236@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 07, 2008 at 09:52:09AM -0600, Wade Berrier wrote:
> Hamish Moffatt wrote:
> > On Mon, Oct 06, 2008 at 03:46:41PM -0700,
> > wberrier at uclibc.org wrote:
> >> Added: trunk/buildroot/package/vsftpd/vsftpd-init
> >> ===================================================================
> >> --- trunk/buildroot/package/vsftpd/vsftpd-init                              
> >> (rev 0)
> >> +++ trunk/buildroot/package/vsftpd/vsftpd-init       2008-10-06 22:46:41 UTC
> >> (rev 23611)
> > 
> > Too bad this can't be disabled - as soon as this package is installed
> > the init script will be run on boot. Some users may not want this.
> 
> Really?  I would think if users didn't want it started they wouldn't include
> it in their config.

Maybe they want to start it conditionally, or run it from inetd? 

The dropbear package has the same issue. It includes an init script, but
I run it from inetd here. (SSH connections are unusual in my application
so there's no point wasting RAM running dropbear permanently.)

> I see config/init handled a bit differently in different projects.  Is there
> no set standard?

I don't think there is.

> integrate custom configs.  I like how samba does it:
> 
> $(INSTALL) -m 0755 package/samba/S91smb $(TARGET_DIR)/etc/init.d
> @if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
>                 $(INSTALL) -m 0755 -D package/samba/simple.conf
> $(TARGET_DIR)/etc/samba/smb.conf; \
> fi
> 
> It installs a base sample config, unless a user has a custom config already
> in $(TARGET_DIR).
> 
> Opinions?  Feedback?

Better than nothing. What to do about the init scripts though?

cheers,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
