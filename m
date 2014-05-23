From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 May 2014 19:08:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-22
In-Reply-To: <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
References: <20140523063008.8A64410106F@stock.ovh.net>
 <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
Message-ID: <20140523190819.45a80027@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 23 May 2014 11:32:28 +0200, Fabio Porcedda wrote:

> >    powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/520606ec674f6c8efad6ebbb840099ec89d03130/
> >     x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/cc21623fbc3d4e94f09b2cb0be36ce05cf75a2e6/
> 
> It's related to BR2_PREFER_STATIC_LIB=y, I'm trying to fix it.

Please note that Gustavo has already done a lot of investigation on
this one. It boils done to the fact that we pass --static instead of
-static when building statically. But we switched from -static to
--static a while ago, for some reason that the commit doesn't make
really clear.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
