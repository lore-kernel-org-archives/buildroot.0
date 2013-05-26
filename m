From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 10:27:18 +0200
Subject: [Buildroot] [PATCH] Revert "dependencies: check that SSL
 certificates are installed"
In-Reply-To: <20130526082436.GF5037@tarshish>
References: <1369031247-2075-1-git-send-email-baruch@tkos.co.il>
 <20130526024707.GA5037@tarshish> <20130526094920.47aa7434@skate>
 <20130526082436.GF5037@tarshish>
Message-ID: <20130526102718.5b837ab4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 26 May 2013 11:24:36 +0300, Baruch Siach wrote:

> > Well, d66cd067f3 was written because if you install a very minimal
> > system, you may not have the SSL certificates installed, which prevents
> > any download from https:// website. So I added a quick check for that.
> 
> How about adding a config option (disabled by default) that adds 
> --no-check-certificate to the wget command? We may event monitor the wget exit 
> status and advice the user to enable this options when we see the status = 5 
> (SSL verification failure).

Hum, I believe it's not very wise to encourage users to use
--no-check-certificate.

> > However, apparently, the location of such certificates is not fixed
> > between various systems, so clearly my patch doesn't work properly.
> 
> Well, 'openssl version -d' does give you the default location where OpenSSL 
> expects certificates to be. However, as I said in the commit log, the presence 
> of this directory doesn't necessarily mean that you actually have any 
> certificate in this location. On Debian if you uninstall ca-certificates 
> you'll still have /etc/ssh/certs.

Ok.

> > So, for now, I believe option (1) is the only viable one, unless there
> > is some local command that allows to check whether SSL certificates are
> > installed or not.
> 
> So is this an Acked-by from you?

Yes:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
