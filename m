From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2018 00:25:16 +0100
Subject: [Buildroot] [PATCH v3 1/2] dependencies.sh: Check for a host
 python version >= 2.7
In-Reply-To: <2B863C9D-397E-4EED-B47D-1E08D4D45741@gmail.com>
References: <20181216232734.100068-1-aduskett@gmail.com>
 <20181217082836.72eff0aa@gmx.net>
 <2B863C9D-397E-4EED-B47D-1E08D4D45741@gmail.com>
Message-ID: <3924a6bb-00c4-8157-6294-6b24834456b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/12/2018 14:10, ratbert90 wrote:
> Hello Peter;
> 
> I would question as to why we would do anything to support such an old version of Python that was EOLed over 5 years ago.  Heck, even 2.7 will be EOLed in 2020.
> 
> Looking around, the only distribution that has 2.6 that still has any kind of support is CentOS6, and even that is in maintenance mode. 

 RHEL6 will be retired November 30, 2020. SLES11 also hase Python 2.6 and will
be retired 31 Mar 2022.

> 2.7 is a safe bet in my opinion. 

 Indeed, because it can be installed both on RHEL6 and on SLES11.

 However, IIUC, it is *not* possible to install python 2.7 as the *default*
python on these distros, because some scripts that are used in normal operation
don't work with python 2.7. So, the test that you added to dependencies.sh is
probably too strict, because it checks that python -V gives at least 2.7...

 Regards,
 Arnout
