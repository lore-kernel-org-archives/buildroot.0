From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Mar 2019 22:02:30 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: add
 BR2_PACKAGE_QT5BASE_OPENSSL
In-Reply-To: <0f583eb7-72ed-1d26-26d1-9194309cb1a5@mind.be> (Arnout
 Vandecappelle's message of "Tue, 5 Mar 2019 20:31:54 +0100")
References: <20190304201145.E02D08E89D@busybox.osuosl.org>
 <0f583eb7-72ed-1d26-26d1-9194309cb1a5@mind.be>
Message-ID: <871s3igzyx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +config BR2_PACKAGE_QT5BASE_OPENSSL
 >> +	bool
 >> +	# No OpenSSL 1.1.x support in Qt 5.6.x
 >> +	default y if BR2_PACKAGE_QT5_VERSION_5_6 && BR2_PACKAGE_LIBRESSL
 >> +	default y if BR2_PACKAGE_QT5_VERSION_LATEST && BR2_PACKAGE_OPENSSL

 >  Now it's not enabled for libressl... The && OPENSSL should be removed I think.

Sorry, I don't follow? If we are using 5.6, then _OPENSSL should be true
if libressl is enabled, and for latest if openssl is enabled.

Is that not what this code does?

-- 
Bye, Peter Korsgaard
