From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 16:22:03 +0200
Subject: [Buildroot] [RFC] libedit: start using autotools-based libedit?
Message-ID: <CAAXf6LWhF4jktm-zzHiE6Cfj6QdNNLJ7xpBQ+zvfGQB9CgBeqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The current libedit library in buildroot is downloaded from debian (no
regular homepage) and is a generic package. However, there also exists
another libedit package, that is autotools-based, based on NetBSD
libedit, and still active (latest release of 2013-07-12)

See http://www.thrysoee.dk/editline/

My question is: what do you think about starting to use that version?

I don't have code currently using libedit, so I can't assess whether
both are compatible or not.

The .mk file would become much simpler:
LIBEDIT_VERSION = 20130712-3.1
LIBEDIT_SITE    = http://www.thrysoee.dk/editline
LIBEDIT_INSTALL_STAGING = YES

so there's definitely some advantage to it.

Any users of libedit care to try?

Thanks,
Thomas
