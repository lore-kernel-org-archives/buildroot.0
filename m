From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Dec 2010 13:28:14 +0100
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <20101206202754.57658344@surf> (Thomas Petazzoni's message of
	"Mon, 6 Dec 2010 20:27:54 +0100")
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101205115745.0e86c054@surf> <20101205131952.50400c59@surf>
	<201012060156.53523.vapier@gentoo.org> <20101206202754.57658344@surf>
Message-ID: <8762v5u5r5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Those two sets of packages are not identical, that's why I
 Thomas> proposed two different options. A package that doesn't support
 Thomas> static build should do:

 Thomas> 	depends on !BR2_PREFER_STATIC_LIB

 Thomas> and all packages that do not work on !MMU should do

 Thomas> 	depends on BR2_USE_MMU

And as this will be most packages, we should probably do something like
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS - E.G. add this dependency in
package/Config.in instead of moving it down to each individual package.

-- 
Bye, Peter Korsgaard
