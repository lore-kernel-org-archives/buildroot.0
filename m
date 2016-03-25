From: David Picard <davepiq@yahoo.fr>
Date: Fri, 25 Mar 2016 12:08:16 +0100
Subject: [Buildroot] [PATCH 2/2] package/qwt : added support for Qt5.
In-Reply-To: <20160325105155.071f73ae@free-electrons.com>
References: <1458850791-4205-1-git-send-email-davepiq@yahoo.fr>
 <1458850791-4205-2-git-send-email-davepiq@yahoo.fr>
 <20160325105155.071f73ae@free-electrons.com>
Message-ID: <56F51C20.4080505@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

OK, thanks for your help and patience. It was very instructive.

Cheers,
David.


Le 25/03/2016 10:51, Thomas Petazzoni a ?crit :
> Hello,
>
> On Thu, 24 Mar 2016 21:19:51 +0100, David Picard wrote:
>
>> +	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEG) || \
>> +		BR2_PACKAGE_QT5_GL_AVAILABLE
>
> I know I told you to use this, but in fact I think a more correct
> dependency is:
>
> 	(BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_QT) || \
> 	(BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_QT5)
>
> so that we are sure that if we're using Qt, we have the dependencies
> that are needed to have OpenGL support in Qt, and if we have Qt5, we
> have the dependencies that are needed to have OpenGL support in Qt5.
>
> I've applied after fixing this.
>
> Also, after applying, I noticed there was a typo: BR2_PACKAGE_HAS_LIBEG
> in your patch should have been BR2_PACKAGE_HAS_LIBEGL. I've fixed that
> up with a following commit, as I only noticed while replying to this
> e-mail.
>
> Thanks!
>
> Thomas
>
