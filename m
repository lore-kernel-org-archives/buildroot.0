From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 15:02:37 +0200
Subject: [Buildroot] [PATCH] libmemcached: don't use -fPIE and -pie with
	FLAT binaries
In-Reply-To: <20150512142246.590460cb@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 12 May 2015 14:22:46 +0200")
References: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d226iwpp.fsf@dell.be.48ers.dk>
 <20150512132632.2cbbc566@free-electrons.com>
 <87wq0egf7w.fsf@dell.be.48ers.dk>
 <20150512142246.590460cb@free-electrons.com>
Message-ID: <87sib2gd8y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> But my question was actually why we shouldn't disable PIE/PIC for static
 >> builds in general, and not just for flat mode?

 > Yes, -fPIC is not needed for static, but it works (it generates
 > slightly less efficient code though). But I'm fine with turning this
 > BR2_BINFMT_FLAT condition to a BR2_STATIC_LIBS condition.

 > But in practice, they are lots of packages that build code only once to
 > generate both a shared library and a static library, and they use -fPIC
 > for both. Guaranteeing that all static libraries have non-PIC code
 > would be a major effort.

 > Should I resend an updated patch, or will you commit after doing the
 > change?

I'll just fix it up when applying, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
