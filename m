From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 19:10:35 -0300
Subject: [Buildroot] [PATCH 2/2] mpd: bump to version 0.18.7
In-Reply-To: <20140128225448.3aa40140@skate>
References: <1389651438-13529-1-git-send-email-gustavo@zacarias.com.ar>	<1389651438-13529-2-git-send-email-gustavo@zacarias.com.ar>
 <20140128225448.3aa40140@skate>
Message-ID: <52E82ADB.8050405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/28/2014 06:54 PM, Thomas Petazzoni wrote:

>> +	depends on !(BR2_avr32 || BR2_sparc) # gcc too old
> 
> Shouldn't we test on the GCC version here instead? There may very well
> be modern SPARC toolchains, for example.

Probably, but currently we can't check that in external toolchains.
It was a compromise, for LEON (basically the only embedded SPARC out
there) we're stuck with gcc <= 4.4.x and mpd requires >= 4.6.x
The other option for running SPARC is very old Sun hardware which i
don't think anybody really cares about these days.
Removing the condition will leads to somewhat clear errors when building
mpd (it does an #error check in the source).
Regards.
