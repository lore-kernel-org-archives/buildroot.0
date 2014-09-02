From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Sep 2014 09:06:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/xbmc: enhance startup script
In-Reply-To: <f9702163e9f2ec5c3753961c5ce742841879425a.1409588958.git.yann.morin.1998@free.fr>
References: <cover.1409588958.git.yann.morin.1998@free.fr>
 <f9702163e9f2ec5c3753961c5ce742841879425a.1409588958.git.yann.morin.1998@free.fr>
Message-ID: <20140902090612.0748dfac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  1 Sep 2014 18:31:40 +0200, Yann E. MORIN wrote:
> Now that we can run XBMC with full openGL, it needs an X server to be
> running, so it has to wait for it before running.
> 
> So, we create a config file (in /etc/default/xbmc) in which we store
> whther to wait for an X server or not. All options to XBMC are now
> hard-coded in our br-xbmc wrapper, not unlike we're doing for the
> systemd unit.
> 
> Then, if it has to wait for X, our own br-xbmc wrapper will do the
> waiting. We do it as thus, because we can not do it in the startup
> script.

Waiting for X to start seems a bit clunky. Why not instead use the X
mechanisms (.Xsession, or other initialization files) to let X start
XBMC when X is ready?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
