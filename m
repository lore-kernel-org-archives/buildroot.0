From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Aug 2015 17:46:41 +0200
Subject: [Buildroot] [PATCH] libpthsem: fix setjmp/longjmp detection
In-Reply-To: <1439982525-6788-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 19 Aug 2015 13:08:45 +0200")
References: <1439982525-6788-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874mjv8en2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libpthsem has been affected since quite a while by build issues, but
 > occuring only on Nathaniel Roach's autobuilder. The failure message
 > is:

 >   error: #error "Unsupported Linux (g)libc version and/or platform"

 > This message comes from pth_mctx.c file, which implements five methods
 > for machine context initialization:

[Lots of funky stuff snipped]

Thanks a lot for debugging this - Committed, thanks!

-- 
Bye, Peter Korsgaard
