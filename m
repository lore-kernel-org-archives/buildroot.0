From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 11:40:36 +0200
Subject: [Buildroot] [PATCH 1/1] setlocalversion: fix detection of hg
	revision for untagged versions
In-Reply-To: <20170613190401.GV13116@argentina> (Thomas De Schampheleire's
 message of "Tue, 13 Jun 2017 21:04:01 +0200")
References: <20170426124311.11449-1-patrickdepinguin@gmail.com>
 <87r30fmhvp.fsf@dell.be.48ers.dk>
 <CAAXf6LXJ-0s88_sFygm0A+wFOTeorqHvBx5xCvBM4vm-T_hNaA@mail.gmail.com>
 <20170613190401.GV13116@argentina>
Message-ID: <87inj997u3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

Hi,

 >> > Perhaps synching with the kernel would be a better way forward than
 >> > adding local modifications?

 >> I tried using the latest version from the kernel in Buildroot and
 >> notice the following:
 >> 
 >> - the version from the kernel now expects to find
 >> include/config/auto.conf and bails out otherwise. Commenting out this
 >> test...
 >> - the output of that script is now just a +   i.e. the actual output
 >> of the scm version does not matter. This is due to following code:
 >> scm=$(scm_version --short)
 >> res="$res${scm:++}"
 >> 
 >> which means: if scm is empty, don't change res -- if scm is not
 >> empty, then the literal '+' is appended to res.
 >> - if I ignore that point and check the actual content of the 'scm'
 >> variable, I notice that this script suffers from the same problem as
 >> the buildroot one. My fix solves that aspect also in the kernel
 >> script.
 >> 
 >> 
 >> The kernel script has evolved a lot from the version that Buildroot
 >> once took, I don't know if the changes have real value for us.
 >> I also assume that the kernel developers will not really want to
 >> customize their version of the script to add more configuration
 >> switches to tweak the behavior.
 >> https://github.com/torvalds/linux/blob/master/scripts/setlocalversion
 >> 
 >> Based on this feedback, how do you think we should proceed?

Sorry for the slow response. I was afraid that the cut option wouldn't
be supported by older versions, but it was apparently added ~20 years
go.

Committed, thanks.

It might still be interesting to submit a similar patch to the Linux
kernel (as you presumably have the same issue there).

-- 
Bye, Peter Korsgaard
