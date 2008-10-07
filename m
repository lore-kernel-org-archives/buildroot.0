From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 07 Oct 2008 09:52:09 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/package/vsftpd
References: <20081006224641.F0B81F8008@busybox.net>
	<20081007055134.GF5127@cloud.net.au>
Message-ID: <gcg0k4$7ap$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:

> On Mon, Oct 06, 2008 at 03:46:41PM -0700,
> wberrier at uclibc.org wrote:
>> Added: trunk/buildroot/package/vsftpd/vsftpd-init
>> ===================================================================
>> --- trunk/buildroot/package/vsftpd/vsftpd-init                              
>> (rev 0)
>> +++ trunk/buildroot/package/vsftpd/vsftpd-init       2008-10-06 22:46:41 UTC
>> (rev 23611)
> 
> Too bad this can't be disabled - as soon as this package is installed
> the init script will be run on boot. Some users may not want this.

Really?  I would think if users didn't want it started they wouldn't include
it in their config.

I see config/init handled a bit differently in different projects.  Is there
no set standard?

It seems convenient to have a default config set up and installed.  That way
not everyone has to write their own custom config and init scripts.  And
for those who want a custom config, it should be easily allowable to
integrate custom configs.  I like how samba does it:

$(INSTALL) -m 0755 package/samba/S91smb $(TARGET_DIR)/etc/init.d
@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
                $(INSTALL) -m 0755 -D package/samba/simple.conf
$(TARGET_DIR)/etc/samba/smb.conf; \
fi

It installs a base sample config, unless a user has a custom config already
in $(TARGET_DIR).

Opinions?  Feedback?

I imagine that most people run into this same issue with their projects.

Or, how is everyone else solving this issue?

Wade
