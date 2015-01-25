From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:06:52 +0100
Subject: [Buildroot] [PATCH 1/3] python-jinja2: add python-markupsafe as
 dependency
In-Reply-To: <54C431B0.4090304@mind.be>
References: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
 <54C431B0.4090304@mind.be>
Message-ID: <20150125150652.532fb6ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sun, 25 Jan 2015 00:58:40 +0100, Arnout Vandecappelle wrote:
> On 01/23/15 21:58, Erico Nunes wrote:
> > BR2_PACKAGE_PYTHON_JINJA2 selects the BR2_PACKAGE_PYTHON_MARKUPSAFE
> > option but doesn't depend on it in python-jinja2.mk.
> > 
> > This turned in an error in an attempt to build python-jinja2 for host:
> > "No local packages or download links found for markupsafe"
> > 
> > Adding the python-markupsafe fixes this error and also ensures that it
> > builds before python-jinja2 in any case.
> 
>  I've tested it and python-jinja2 builds fine without python-markupsafe.
> 
>  It is true that host-python-jinja2 does depend on host-python-markupsafe
> (otherwise it will try to download it and we want to avoid that). But then you
> should add

It is quite weird that the target and host variants don't have the same
dependencies. Do you have an explanation about this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
