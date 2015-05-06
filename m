From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 6 May 2015 10:07:43 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150506094236.114894a2@free-electrons.com>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
Message-ID: <20150506100743.6e5c9fcd@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello
On Wed, 6 May 2015 09:42:36 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

[SNIP]
> 
> >         sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/09302c153418c3af6dc4cdd12a0149505cfbca0b/
> >          sh4 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/96f8a9758f0116aec999028fde1b9c983c143809/
> >         sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/848b9433c09d6cbc81c8d1e22778ae68223b43f3/
> >          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2062208c171207428c9121215971e00c52bf306a/
> >          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/57ef99b9dd0623e3e9b61e5964eb45e611b89cd5/
> 
> Some of these were due to the Qt coord patch that we reverted. However,
> one of them,
> http://autobuild.buildroot.org/results/848/848b9433c09d6cbc81c8d1e22778ae68223b43f3/,
> appeared after the revert. So there is still a problem with python-pyqt
> it seems. Gwenhael, can you have a look?
> 
It's seems strange. I've tested with PyQt_qreal_double enabled, this works.
Theorically PyQt_qreal_double must be disabled for SH4(a) because QT_NO_FPU is
not set... 

I need to check for the first ARM build failure.
The last build failure is fixed by http://patchwork.ozlabs.org/patch/468134/

 [SNIP]

Gwenhael Goavec-Merou
