From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 09:19:32 +0100
Subject: [Buildroot] [PATCH 1/2] samba: deprecate package due to EOL
In-Reply-To: <54F8F0AA.5020902@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <54F8D05F.4050300@mind.be>
 <20150305230631.4e19032b@free-electrons.com>
 <54F8D470.9060308@mind.be>
 <20150305232325.3e137c1d@free-electrons.com>
 <54F8F0AA.5020902@zacarias.com.ar>
Message-ID: <20150306091932.2ec87e37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 05 Mar 2015 21:11:22 -0300, Gustavo Zacarias wrote:

> There's no pretty way out of this, the 3.6.x codebase is going
> completely unmaintained upstream.
> It's basically sheer luck that upstream fixed CVE-2015-0240 (which is
> pretty severe) on the 3.6.x branch, just because 4.2.0 was delayed.
> The best solution i can think of is either use samba 3.6.x as a fallback
> libsmbclient (not very nice looking forward) or switch everything to
> samba4 with the added size and restrictions.
> kodi and mpd aren't small so i don't think it should be a deciding
> factor, gvfs is meh, but then it's optional.
> I'd favor the 2nd option.
> Another factor to consider is that eventually (maybe already) the old
> libsmbclient won't be able to talk to newer windows servers anyway,
> specially when older versions of the protocol are disabled for security
> reasons.

Switching everything to Samba 4 is fine for me: that's the upstream
decision, and in Buildroot we generally try to follow upstream
decisions. If people are unhappy with Samba 4 being much bigger than
Samba 3, then it's up to them to work with the Samba folks upstream to
solve this. One guy posted some Buildroot patches at some point to only
install certain parts of Samba 4 to reduce the installed size, and we
invited him to work with upstream to resolve this.

So in my side, I'm fully OK with a solution that consists in switching
kodi, mpd and gvfs over to Samba 4.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
