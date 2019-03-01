From: James Grant <james.grant@jci.com>
Date: Fri, 1 Mar 2019 02:21:29 +0000
Subject: [Buildroot] No OpenSSL 1.1.x support in Qt 5.6.x.
Message-ID: <BL2P132MB00203E45B23E62E378ED9B02E5760@BL2P132MB0020.NAMP132.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There is no OpenSSL 1.1.x support in Qt 5.6.x and no-one appears to have back-ported support.

https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9

I'm suggesting that for upcoming 2019.02 release that no attempt is made to build with SSL support for 5.6.

About to send patch to that effect.

Also the custom configuration options should be added last in the .mk file. This allows all options set by Buildroot to be overridden. This change is needed so I can place '-no-openssl' in BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS and have it work.

Regards,
James Grant.
