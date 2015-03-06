From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Mar 2015 06:07:08 -0300
Subject: [Buildroot] [PATCH 1/2] samba: deprecate package due to EOL
In-Reply-To: <20150306091932.2ec87e37@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<54F8D05F.4050300@mind.be>	<20150305230631.4e19032b@free-electrons.com>	<54F8D470.9060308@mind.be>	<20150305232325.3e137c1d@free-electrons.com>	<54F8F0AA.5020902@zacarias.com.ar>
 <20150306091932.2ec87e37@free-electrons.com>
Message-ID: <54F96E3C.7080201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/2015 05:19 AM, Thomas Petazzoni wrote:
> Switching everything to Samba 4 is fine for me: that's the upstream
> decision, and in Buildroot we generally try to follow upstream
> decisions. If people are unhappy with Samba 4 being much bigger than
> Samba 3, then it's up to them to work with the Samba folks upstream to
> solve this. One guy posted some Buildroot patches at some point to only
> install certain parts of Samba 4 to reduce the installed size, and we
> invited him to work with upstream to resolve this.
> 
> So in my side, I'm fully OK with a solution that consists in switching
> kodi, mpd and gvfs over to Samba 4.

Just to document for people: The problem is that the libsmbclient
library is pretty much connected with many of the other libraries, you
just can't build that library alone and expect it to work.
And for samba4 it's not binary (as in /usr/bin/* & /usr/sbin/*) size
that bloats since all common code was moved to libraries.
With the new smbtorture option (the one and only big binary) i think
it's not worth the effort, specially that python is being pulled in and,
again, it's pretty wired into the samba4 build system hence hard to avoid.
Regards.
