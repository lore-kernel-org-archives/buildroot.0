From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 10:51:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/qwt : added support for Qt5.
In-Reply-To: <1458850791-4205-2-git-send-email-davepiq@yahoo.fr>
References: <1458850791-4205-1-git-send-email-davepiq@yahoo.fr>
 <1458850791-4205-2-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160325105155.071f73ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 21:19:51 +0100, David Picard wrote:

> +	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEG) || \
> +		BR2_PACKAGE_QT5_GL_AVAILABLE

I know I told you to use this, but in fact I think a more correct
dependency is:

	(BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_QT) || \
	(BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_QT5)

so that we are sure that if we're using Qt, we have the dependencies
that are needed to have OpenGL support in Qt, and if we have Qt5, we
have the dependencies that are needed to have OpenGL support in Qt5.

I've applied after fixing this.

Also, after applying, I noticed there was a typo: BR2_PACKAGE_HAS_LIBEG
in your patch should have been BR2_PACKAGE_HAS_LIBEGL. I've fixed that
up with a following commit, as I only noticed while replying to this
e-mail.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
