From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 16:17:08 +0100
Subject: [Buildroot] [git commit] qt5base: unconditionally install
	Qt5printSupport if widgets are enabled
In-Reply-To: <20141113160320.4391cb1a@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 13 Nov 2014 16:03:20 +0100")
References: <20141113144933.8E075B4453@busybox.osuosl.org>
 <20141113160320.4391cb1a@free-electrons.com>
Message-ID: <87vbmji0zv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 >> -	bool "print support module"
 >> -	select BR2_PACKAGE_QT5BASE_WIDGETS
 >> -	help
 >> -	  This option enables the Qt5PrintSupport
 >> +	depends on BR2_PACKAGE_QT5BASE_WIDGETS
 >> +	def_bool y

 > So why have a Config.in option for this in the first place?

Just because I wanted to make as minimal as possible a change now that
we're past -rc1. I don't follow qt5 development, but presumably this
used to be user settable and could become so again in future qt5
releases.

-- 
Bye, Peter Korsgaard 
