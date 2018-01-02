From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Jan 2018 22:40:32 +0100
Subject: [Buildroot] [PATCH 0/8] python: clean up host version logic.
In-Reply-To: <20180102214053.7c49ec09@windsurf.lan>
References: <20180102163337.6334-1-aduskett@gmail.com>
 <20180102214053.7c49ec09@windsurf.lan>
Message-ID: <20180102214032.GA17491@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Adam, All,

On 2018-01-02 21:40 +0100, Thomas Petazzoni spake thusly:
> On Tue,  2 Jan 2018 11:33:29 -0500, Adam Duskett wrote:
> > Currently, packages that rely on host-python, and are compatible with both
> > python2 and 3, only build python3 if python3 is selected for the target.
> > 
> > This causes a problem in the following scenario:
> > 
> > - A user does not have a target python selected.
> > - Package A depends on host-python3
> > - Package B is compatible with host-python and host-python3
> > 
> > In this scenario, host-python is not needed, as package A and B are
> > both compatible with python3. However; both host-python and host-python3 will
> > be built because no target-python has been selected.
> > 
> > To fix this, the following patch series introduces a few minimal changes
> > that will allow the user to manually select a host version of python.
> > (Note: I have changed only the packages that I personally use and have tested.)
> 
> I will have to think a lot to fully grasp the potential consequences of
> your changes.
> 
> However, there is one thing that I believe is missing in your patch
> series: BR2_PACKAGE_PYTHON3 should select BR2_PACKAGE_HOST_PYTHON3, and
> BR2_PACKAGE_PYTHON should select BR2_PACKAGE_HOST_PYTHON.

Furthermore, I believe the prompt should be hidden, because it does not
make sense for the user to actually select the host version for python.

Besides, the current series allows for building both host-python and
host-python3 in the same configuration, and we do not support this for
now (or we would have made it possible for the target variant too).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
