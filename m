From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Nov 2014 12:26:28 +0100
Subject: [Buildroot] [git commit] arch/Config.in.x86: drop
	BR2_x86_generic
In-Reply-To: <20141108110116.22dd9c53@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 8 Nov 2014 11:01:16 +0100")
References: <20141107185346.68E2FB2F56@busybox.osuosl.org>
 <20141108110116.22dd9c53@free-electrons.com>
Message-ID: <87fvduue57.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Fri, 7 Nov 2014 19:51:06 +0100, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=80e406090893ab5a7b5d78e4d243d12fca2b22fb
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> The fuzzy generic x86 variant doesn't make much sense in the context of
 >> Buildroot, and the recent change to use -march instead of -mtune broke it.

 > No Config.in.legacy handling?

It is only used in the variant choice, so kconfig will automatically
change to the default value (586 for i386, nocona for x86-64) and as
"generic" is not really well defined (see the description in the GCC
manual) I think that is good enough - But yeah, we should inform the
user about it using the legacy support.

I'll add it now, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
