From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 01 Dec 2014 18:32:29 -0300
Subject: [Buildroot] [PATCH 1/2] skeleton: make /run a directory
In-Reply-To: <CAGrucu0UjiXt22U-CFKda+Da8fNMjhszXbh=yixZLTMJ5uTN1Q@mail.gmail.com>
References: <1417106898-14444-1-git-send-email-gustavo@zacarias.com.ar>	<CAGrucu1AtrSqG8_9Z6J0u4dR-Des_9W4xHH-HwguLpoen3vY3A@mail.gmail.com>	<CAHXCMM+J7M99tGUykrxi8MrruVsb34qa3CjHMTsf9XpesHS5vw@mail.gmail.com>	<547CD9A3.3080603@zacarias.com.ar>
 <CAGrucu0UjiXt22U-CFKda+Da8fNMjhszXbh=yixZLTMJ5uTN1Q@mail.gmail.com>
Message-ID: <547CDE6D.8040303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2014 06:19 PM, Andr? Erdmann wrote:

> There are already tmpfiles.d rules for that, /usr/lib/tmpfiles.d/legacy.conf:
> 
> d /run/lock 0755 root root -
> L /var/lock - - - - ../run/lock
> 
> To make it work properly for systemd, /var/lock needs to be removed
> from the skeleton or point to /run/lock (or replace the "L" with "L+"
> in the tmpfiles.d rule).

Sure, but as i explained to Samuel on IRC this is just the tip of a
general cleanup regarding the base files.
Even though systemd ships that doing more symlinks won't help the
sysv-aspect of the cleanup since /run/lock won't exist whereas now lock
is still /tmp hence no breakage until the other patches are sent/applied.
The idea is to make a script to handle something similar to tmpfiles.d
for sysv-style so we can drop all the symlink hackery which is pointless
for systemd but necessary for sysv, we just stick is as S01basefiles or
some other preferred name.
And also to really move out all of the remaining files that make no
sense for systemd and/or sysv into a basefiles (or other nifty name)
package to avoid noise.
Regards.
