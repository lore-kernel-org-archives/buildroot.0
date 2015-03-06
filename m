From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Mar 2015 21:11:22 -0300
Subject: [Buildroot] [PATCH 1/2] samba: deprecate package due to EOL
In-Reply-To: <20150305232325.3e137c1d@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<54F8D05F.4050300@mind.be>	<20150305230631.4e19032b@free-electrons.com>	<54F8D470.9060308@mind.be>
 <20150305232325.3e137c1d@free-electrons.com>
Message-ID: <54F8F0AA.5020902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/2015 07:23 PM, Thomas Petazzoni wrote:

> Dear Arnout Vandecappelle,
> 
> On Thu, 05 Mar 2015 23:10:56 +0100, Arnout Vandecappelle wrote:
> 
>>  But that's just a condition on the .mk file so it has no implications for the
>> missing reverse dependencies.
> 
> Absolutely. But it means that the gvfs Samba support becomes unusable.

There's no pretty way out of this, the 3.6.x codebase is going
completely unmaintained upstream.
It's basically sheer luck that upstream fixed CVE-2015-0240 (which is
pretty severe) on the 3.6.x branch, just because 4.2.0 was delayed.
The best solution i can think of is either use samba 3.6.x as a fallback
libsmbclient (not very nice looking forward) or switch everything to
samba4 with the added size and restrictions.
kodi and mpd aren't small so i don't think it should be a deciding
factor, gvfs is meh, but then it's optional.
I'd favor the 2nd option.
Another factor to consider is that eventually (maybe already) the old
libsmbclient won't be able to talk to newer windows servers anyway,
specially when older versions of the protocol are disabled for security
reasons.
Regards.
