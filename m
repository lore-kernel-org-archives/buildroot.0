From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 28 Aug 2007 19:46:29 +0200
Subject: [Buildroot] [buildroot 0001472]: r19050 should be reverted
	or	reworked
In-Reply-To: <ea5899336b303af729d341b180546ca2@busybox.net>
References: <ea5899336b303af729d341b180546ca2@busybox.net>
Message-ID: <1188323189.4584.9.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ====================================================================== 
> Date Submitted:             08-24-2007 14:28 PDT
> Last Modified:              08-24-2007 14:28 PDT
> ====================================================================== 
> Summary:                    r19050 should be reverted or reworked
> Description: 
> hostap and hostapd are not the same thing.  hostap is the PRISM driver
> whereas hostapd is a AP configuration daemon that supports many WiFi
> drivers.
> 
> r19050 lists the hostapd tarball as the source for the driver which is
> incorrect
> 
> perhaps http://hostap.epitest.fi/releases/hostap-driver-0.4.9.tar.gz
> should be used instead although I really don't use the 'hostap' driver so
> I wouldn't know if thats the latest.
> 
> I ran into this while I was creating a package for 'hostapd' which
> conflicted with hostap as it was incorrectly referring to the same source
> package



Looking at the documentation of the hostap, it looks like you are
correct. The hostap is now integrated in the linux kernel
and use of hostap in Buildroot should depend
on BR2_DEPRECATED.


-- 
Best Regards,
Ulf Samuelsson
