From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jul 2015 14:42:31 +0200
Subject: [Buildroot] [PATCH] package/qpid-proton: needs host-python2
In-Reply-To: <20150714120325.GB2332@tarshish>
References: <1436873894-1080-1-git-send-email-yann.morin.1998@free.fr>
 <20150714114803.GA2332@tarshish>
 <20150714135627.26cf899a@free-electrons.com>
 <20150714120325.GB2332@tarshish>
Message-ID: <20150714124231.GB26192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-07-14 15:03 +0300, Baruch Siach spake thusly:
> On Tue, Jul 14, 2015 at 01:56:27PM +0200, Thomas Petazzoni wrote:
> > On Tue, 14 Jul 2015 14:48:04 +0300, Baruch Siach wrote:
> > > My interpretation of the cmake log is that cmake uses the python 
> > > interpreter it detects to run the scripts. In the failed cases cmake 
> > > detected host-python3 because host-python3 happened to build before 
> > > qpid-proton. cmake did not use the distro installed host python even 
> > > though it's python2 (most likely). So I'm not sure patching the scripts is 
> > > necessary.
> > 
> > It is necessary if your host machine has a Python 3 interpreter and not
> > a Python 2 interpreter. In this case the scripts will
> > run /usr/bin/python (because it's hardcoded in their source code), and
> > this will run Python 3.
> > 
> > So Yann's solution looks good. Am I missing something?
> 
> My point is that in the failed cases /usr/bin/python was not used, otherwise 
> the build would have succeeded. It seems that cmake uses the python 
> interpreter it detects to run the scripts. So patching the scripts doesn't 
> change anything by itself, IIUC.

OK, I know understansd what you meant. I'll check that. Thanks for the
explanations! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
