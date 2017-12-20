From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Dec 2017 14:15:23 +0100
Subject: [Buildroot] [PATCH] gitlab-ci: add .config to artefacts
In-Reply-To: <5a387281cf61_bd03fa772a46ee8855bb@ultri3.mail>
References: <20171218212558.22912-1-yann.morin.1998@free.fr>
 <5a387281cf61_bd03fa772a46ee8855bb@ultri3.mail>
Message-ID: <20171220131523.GA21413@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-12-18 23:59 -0200, Ricardo Martincoski spake thusly:
> On Mon, Dec 18, 2017 at 07:25 PM, Yann E. MORIN wrote:
> > When a run-time test fails to build, it is interesting to get the
> > corresponding .config file directly as an artifact, rather than
> > reconstruct it manually from the various config snippets embedded
> > in the many runtime-test scripts.
> 
> The defconfig is already dumped to the beginning of the build log.

Ah, right, that would have been enough for my use-case.

> But I agree that having also the .config can be handy (we have both in the
> autobuilder results).

Yes, because the content of .config is influenced by the host as well,
like for the host gcc version, so it is interesting to have the resultig
.config.

> >  .gitlab-ci.yml | 1 +
> >  1 file changed, 1 insertion(+)
> You forgot to duplicate the code to the .gitlab-ci.yml.in

Damned, indeed! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
