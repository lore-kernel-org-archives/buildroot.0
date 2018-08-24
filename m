From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 11:05:53 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-23
In-Reply-To: <20180824075557.GL9365@scaer>
References: <20180824060019.899B4207B1@mail.bootlin.com>
 <20180824075557.GL9365@scaer>
Message-ID: <20180824110553.2121c1b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 09:55:57 +0200, Yann E. MORIN wrote:

> On 2018-08-24 08:00 +0200, Thomas Petazzoni spake thusly:
> > Results for branch 'master'
> >         i586 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/7e1cbeb458cb6536a36eae0d24cefb36edb22f55 |     
> >       x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/1b32b5daf5d3e3cf77e6779af7d9b79ce7e6a8e5 |       
> 
> Those two occur on Hollis' autobuilder (again! ;-)), because the host
> has kernel headers v2.6.32, which are too old for rauc, which needs
> headers >= 3.0. However, we have no way to express this dependency on
> host headers, only for the target headers...
> 
> (patch incoming to add that dependency for the target variant).

Rather than adding a dependency on >= 3.0 kernel headers, perhaps we
can find a way to make the code not use the missing definitions when
they are not available. This would avoid the >= 3.0 dependency for the
target variant *and* solve the host build problem at the same time.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
