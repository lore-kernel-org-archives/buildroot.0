From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:38:16 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
 BR2_PACKAGE_LIBFSLVPUWRAP=y
In-Reply-To: <20160609211911.GC3826@free.fr>
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160609224203.599c50c1@free-electrons.com>
 <20160609211911.GC3826@free.fr>
Message-ID: <20160609233816.1a494a7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 23:19:11 +0200, Yann E. MORIN wrote:

> > This is a known bug in Kodi, which nobody has investigated so far.  
> 
> Saying that "nobody has investigated" is wrong. Both Bernd and I have
> done some research on the topic [0].

True.

> And we concluded that upstream is unwilling to take patches that will
> accept only .pyc or .pyo to be present. Upstream *wants* to have the .py
> files present. Period.

Another upstream project also rejected the idea of working just
with .pyc files, until I showed the filesystem size difference between
having .py+.pyc and having just .pyc. Have you tried this approach with
the Kodi people?

(Though I admit it might be less impressive than what the case I had,
due to the massive size of Kodi and its dependencies.)

> So indeed, noone has tried to fix it, because the fix has *zero* chance
> of getting upstream.
> 
> I however submitted two proposals that would make it impossible to have
> that situation, but you did not like them (FTR: one was to hide Kodi
> away when .py files were not present, the other was to add options for
> packages to require .py files to be kept).
> 
> So, unless we revise our position, the bug will stay. And it is a
> Buildroot bug, not an upstream one.

It is and remains an upstream bug, there is absolutely no reason to
not work with just .pyc/.pyo files.

However, since there has been apparently no movement on that side
upstream, then let's just add the dependency that you suggested. It's a
crappy solution, but our motto is to follow upstream, so when upstream
is crappy, so we are :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
