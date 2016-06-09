From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:50:11 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
 BR2_PACKAGE_LIBFSLVPUWRAP=y
In-Reply-To: <20160609214806.GE3826@free.fr>
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160609224203.599c50c1@free-electrons.com>
 <20160609211911.GC3826@free.fr>
 <20160609233816.1a494a7a@free-electrons.com>
 <20160609214806.GE3826@free.fr>
Message-ID: <20160609235011.3bd057ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 23:48:06 +0200, Yann E. MORIN wrote:

> > However, since there has been apparently no movement on that side
> > upstream, then let's just add the dependency that you suggested.  
> 
> OK, I guess you meant have Kodi depends on .py files to be presetn (not
> the other proposal to require .py files), right?

Correct:

	depends on BR2_PACKAGE_PYTHON_PY_ONLY || BR2_PACKAGE_PYTHON_PY_PYC

or

	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY

not sure which one is best.

I am not sure what other way around is possible, but I'm probably
missing something.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
