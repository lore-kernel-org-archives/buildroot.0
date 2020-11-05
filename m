From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Nov 2020 09:40:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: fix build
 without xsltproc
In-Reply-To: <20201105074739.325141-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 5 Nov 2020 08:47:39 +0100")
References: <20201105074739.325141-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1p819j6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 8efb52c1a17210dc79cfb61f56a71ffb760ccbe9 added a libxslt
 > dependency presumably to manage
 > https://github.com/freedesktop/ModemManager/commit/bbd39a457ce2949dd167f9c2e01eecf6a9e14716

 > However, this is wrong and build will fail on:

 > checking for xsltproc... no
 > configure: error: Please install xsltproc before configuring.

 > xsltproc is used to generate ModemManager-names.h since, at least,
 > version 0.7.990 and
 > https://github.com/freedesktop/ModemManager/commit/365b906a3e1bda05af10f92451a6b6ae60f8b879
 > However, this file is already available in the official tarball so drop
 > this unneeded dependency and set ac_cv_prog_XSLTPROC_CHECK to yes

 > Fixes:
 >  - http://autobuild.buildroot.org/results/edc755b874ea43d1c009ad76c28f05e18519138e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
