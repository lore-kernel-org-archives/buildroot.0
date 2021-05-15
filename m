From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 14:01:20 +0200
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <fecfc535-58b5-4059-c1d2-9e3d05524dc2@gmail.com>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
 <a6e13bf6-0cad-41d7-396e-0b9a31d225fd@gmail.com>
 <20210515111946.GB2506@scaer>
 <fecfc535-58b5-4059-c1d2-9e3d05524dc2@gmail.com>
Message-ID: <20210515120120.GE2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-05-15 13:46 +0200, Romain Naour spake thusly:
> Le 15/05/2021 ? 13:19, Yann E. MORIN a ?crit?:
> > Romain, All,
> > 
> > On 2021-05-15 12:57 +0200, Romain Naour spake thusly:
> >> Le 15/05/2021 ? 11:40, Yann E. MORIN a ?crit?:
> >>> On the Ubuntu side (as another data point), the odest LTS is Trusty,
> >>> 14.04, and it has patch 2.7.1.
> >> Based on the host gcc requirement on gcc 4.9 (released the 22 April 2014), we
> >> already don't support such old distro. Ubuntu LTS Trusty provide gcc 4.8.
> > 
> > Ah, I don't thinks so. We still only require gcc >= 4.8:
> 
> It seems the BR2_HOST_GCC_AT_LEAST_4_8 symbol has been removed with commit
> 55fc80260b packages: host gcc >= 4.8 is now guaranteed.

Yes, the removal was on purpose: since gcc >= 4.8 is not guaranteed
(with a check in dependencies.sh), BR2_HOST_GCC_AT_LEAST_4_8 would
always be 'y'; there is no advantage to having a variable always set
to 'y', so we dropped it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
