From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 18:27:25 +0100
Subject: [Buildroot] [PATCH v3 0/3] Improve silent builds
In-Reply-To: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
References: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20141106182725.450971c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu,  6 Nov 2014 10:13:34 +0100, Fabio Porcedda wrote:
> This patch set improves silent builds.
> 
> Silent builds are nice when top-level parallel make is being used to
> reduce the output clutter.
> 
> The change logs are in each patch.
> 
> Best regards
> Fabio Porcedda (3):
>   Makefile: improve detection of make "-s" flag
>   pkg-download: silence the svn download helper if it is a silent build
>   support/download: silence git if it is a silence build

When I look at patches 2 and 3, I must say I dislike the fact that in
one case (svn), silencing is handled in pkg-download.mk when defining
the SVN variable, while in the other case (git), it's handled in the
git-specific helper script.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
