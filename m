From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Aug 2014 10:38:44 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: add mechanism to install the
	getent program
In-Reply-To: <20140817102744.585db2db@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 17 Aug 2014 10:27:44 +0200")
References: <1408199992-26942-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408199992-26942-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140817102744.585db2db@free-electrons.com>
Message-ID: <87bnriw5t7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > In fact, I think I have a simpler solution to propose, with just a
 > getent package, and no need for a BR2_TOOLCHAIN_INSTALL_GETENT stuff.
 > The getent package would:

 >  * If the toolchain is glibc/eglibc based (regardless of whether it's
 >    internal of external), the package would install the getent program
 >    from STAGING_DIR to TARGET_DIR.

 >  * If the toolchain is uClibc or musl based, it would install the
 >    built-in getent wrapper script, which has been extracted from uClibc
 >    0.9.33.

 > This solution has the same result as the previously proposed solution,
 > except for case 1/ b/ (internal uClibc toolchain): with the previous
 > solution, the getent program of the current uClibc version being used
 > was installed, while with the new solution, a fixed version of the
 > getent program will be installed. However, since I don't think the
 > getent wrapper script is going to change often in uClibc, I don't think
 > this difference really matters.

 > This makes the entire patch must simpler. I'll respin with this idea
 > unless some of you disagree.

Sounds sensible to me. Please do!

-- 
Bye, Peter Korsgaard
