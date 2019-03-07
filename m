From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 22:37:49 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: add
 BR2_PACKAGE_QT5BASE_OPENSSL
In-Reply-To: <871s3igzyx.fsf@dell.be.48ers.dk>
References: <20190304201145.E02D08E89D@busybox.osuosl.org>
 <0f583eb7-72ed-1d26-26d1-9194309cb1a5@mind.be>
 <871s3igzyx.fsf@dell.be.48ers.dk>
Message-ID: <93e7ba61-8b18-64de-e151-767b33db320f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/03/2019 22:02, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >> +config BR2_PACKAGE_QT5BASE_OPENSSL
>  >> +	bool
>  >> +	# No OpenSSL 1.1.x support in Qt 5.6.x
>  >> +	default y if BR2_PACKAGE_QT5_VERSION_5_6 && BR2_PACKAGE_LIBRESSL
>  >> +	default y if BR2_PACKAGE_QT5_VERSION_LATEST && BR2_PACKAGE_OPENSSL
> 
>  >  Now it's not enabled for libressl... The && OPENSSL should be removed I think.
> 
> Sorry, I don't follow? If we are using 5.6, then _OPENSSL should be true
> if libressl is enabled, and for latest if openssl is enabled.
> 
> Is that not what this code does?

 Oops, sorry, I had misread _OPENSSL as _LIBOPENSSL.

 Regards,
 Arnout
