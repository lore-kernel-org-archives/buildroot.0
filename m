From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 10:17:01 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
In-Reply-To: <20150919154735.GA3613@free.fr>
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
 <20150913232942.736dea75@free-electrons.com>
 <20150913213513.GA21306@free.fr>
 <20150919144017.4fdcc90a@free-electrons.com>
 <20150919154735.GA3613@free.fr>
Message-ID: <20150920101701.60fc27ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Sep 2015 17:47:35 +0200, Yann E. MORIN wrote:

> > There is some logic in Kodi that tries to set the PYTHONHOME
> > environment variable. Can you see in the logs if you see the following
> > messages (from xbmc/interfaces/python/XBPython.cpp) :
> > 
> >   CLog::Log(LOGINFO, "initializing python engine.");
> >   CLog::Log(LOGDEBUG, "PYTHONHOME -> %s", CSpecialProtocol::TranslatePath("special://frameworks").c_str());
> >   CLog::Log(LOGDEBUG, "PYTHONPATH -> %s", CSpecialProtocol::TranslatePath("special://frameworks").c_str());
> 
> No, those messages I did not see. Only the message about suggesting to
> set PYTHONHOME followed by the segfault.

All the messages you posted are coming from Python itself. I'm
interested in seeing under what conditions is Kodi starting the Python
interpreter. But there's lot of code in Kodi, so I'm not sure from
which place the Python interpreter is started and causing the segfault
you're seeing.

Any chance you do a debug symbols enabled build to get a backtrace of
Kodi ?

> > Alternatively, can you change Python, in file Modules/getpath.c,
> > function calculate_path(), and dump all the environment variables?
> 
> Sure, I can have a look at it. No promise, though...

Yes, sure. You could also report a bug in the Kodi bug tracker? They
might at least be able to give some hints about what's going on.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
