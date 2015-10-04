From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 11:30:57 +0200
Subject: [Buildroot] musl/gettext issue
In-Reply-To: <55FB3E49.5050606@mind.be> (Arnout Vandecappelle's message of
 "Fri, 18 Sep 2015 00:27:21 +0200")
References: <20150916221636.039df52b@free-electrons.com>
 <55FB3E49.5050606@mind.be>
Message-ID: <87oagfvv3i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Another option is that we add a different flag to indicate the dependency on
 > libintl:

 > config BR2_PACKAGE_GETTEXT_WITH_LIBINTL
 > 	bool
 > 	default y
 > 	depends on BR2_PACKAGE_GETTEXT
 > 	depends on BR2_STATIC_LIBS
 > 	depends on !BR2_TOOLCHAIN_USES_GLIBC


 >  HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
 >         $(if $(BR2_PACKAGE_GETTEXT_WITH_LIBINTL),-lintl) \


 >  There's just about 30 packages that ned to be adapted.

Yes, I guess that's the best solution.

-- 
Bye, Peter Korsgaard
