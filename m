From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Feb 2021 10:46:16 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <20210213083538.GN1679218@scaer> (Yann E. MORIN's message of
 "Sat, 13 Feb 2021 09:35:38 +0100")
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
 <20210212203939.GK1679218@scaer> <20210212210725.GL1679218@scaer>
 <20210213083538.GN1679218@scaer>
Message-ID: <87a6s8e1w7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > I whipped up something quick during my morning coffee:

 > https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/linux-fw-rework&id=8dd299681fdf80c284680833175387ac6a428a11

 > Lightly tested by enabling a random set of firmwares, and comparing the
 > lists of installed files before/after are identical. Then tested by
 > enabling all firmwares. No delta in either case: it installed the same
 > set of files, and there was no missing/extra ones.

Ok, that looks good. I see that you dropped the installation macros, so
how do you suggest to handle the installation to $BINARIES_DIR? Copy the
entire installation logic?

-- 
Bye, Peter Korsgaard
