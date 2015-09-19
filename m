From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Sep 2015 17:47:35 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
In-Reply-To: <20150919144017.4fdcc90a@free-electrons.com>
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
 <20150913232942.736dea75@free-electrons.com>
 <20150913213513.GA21306@free.fr>
 <20150919144017.4fdcc90a@free-electrons.com>
Message-ID: <20150919154735.GA3613@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-09-19 14:40 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sun, 13 Sep 2015 23:35:13 +0200, Yann E. MORIN wrote:
> 
> > > Do we actually understand why it doesn't work? There is really no
> > > reason for .py files to be necessary.
> > 
> > Well, what do I know about python? ;-)
> > 
> > I never said I understood the issue. Just that having only .pyc modules
> > make Kodi segfault, while having .py makes it work... :-(
> > 
> > All I got was the trace above. There was nothing (of interest) in Kodi's
> > own log file.
> 
> As you can imagine, I'm not too happy with this solution. I believe
> Kodi is doing something incorrect, since if you just run Python with
> the .pyc files, and do "import site", it works just fine.

Yeah, I would not say the patch is the optimal solution.

> There is some logic in Kodi that tries to set the PYTHONHOME
> environment variable. Can you see in the logs if you see the following
> messages (from xbmc/interfaces/python/XBPython.cpp) :
> 
>   CLog::Log(LOGINFO, "initializing python engine.");
>   CLog::Log(LOGDEBUG, "PYTHONHOME -> %s", CSpecialProtocol::TranslatePath("special://frameworks").c_str());
>   CLog::Log(LOGDEBUG, "PYTHONPATH -> %s", CSpecialProtocol::TranslatePath("special://frameworks").c_str());

No, those messages I did not see. Only the message about suggesting to
set PYTHONHOME followed by the segfault.

> Alternatively, can you change Python, in file Modules/getpath.c,
> function calculate_path(), and dump all the environment variables?

Sure, I can have a look at it. No promise, though...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
