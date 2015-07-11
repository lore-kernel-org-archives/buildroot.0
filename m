From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 17:42:42 +0200
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <20150711173913.32fbc8a7@free-electrons.com>
References: <bug-8206-163@https.bugs.busybox.net/>
 <20150707210059.917A78015E@busybox.osuosl.org>
 <1436622071664-105281.post@n4.nabble.com> <55A12A5E.4010900@mind.be>
 <1436625379066-105305.post@n4.nabble.com> <55A1359C.5020109@mind.be>
 <20150711173913.32fbc8a7@free-electrons.com>
Message-ID: <55A13972.2060908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/11/15 17:39, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Sat, 11 Jul 2015 17:26:20 +0200, Arnout Vandecappelle wrote:
> 
>>  So that doesn't solve the issue then?
>>
>>  Well, looking at the patch, it can't fix the issue because a 'make
>> mplayer-dirclean; make mplayer' run wouldn't change anything that this patch does...
>>
>>  Back to Bernd :-)
> 
> Basically, the mplayer X11 support assumes that the user will enable
> all the relevant X.org libraries to make things work. While probably,
> it should be doing more of "select BR2_PACKAGE_<blah> if
> BR2_PACKAGE_XORG7" so that if X.org has been enabled, mplayer
> automatically enables the necessary libraries.

 But that doesn't explain why it _works_ when these packages are present _on the
host_...

 I also noticed that Xorg terminates in the bad case - before mplayer is even
started.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
