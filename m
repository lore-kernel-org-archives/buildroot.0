From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Feb 2013 16:45:58 +0100
Subject: [Buildroot] [RFC] Python 3 external packages support
In-Reply-To: <20130211160908.2da60098@skate>
References: <1360594442.60393.YahooMailNeo@web171801.mail.ir2.yahoo.com>
 <20130211160908.2da60098@skate>
Message-ID: <CAHXCMMJnMGN5+2HbWkLoDwE37C=u5bHsZQm=2XPpAmJhJ2qTsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

2013/2/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>
> If we make them exclusive, then we can ensure that
> $(HOST_DIR)/usr/bin/python is either a symbolic link to python2 (when
> Python 2 is used) or a symbolic link on python3 (when Python 3 is
> used), and that should make the thing work pretty smoothly.
>
> Then, Python external modules would have to depend on
> BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 is they support both,
> BR2_PACKAGE_PYTHON if they support Python 2 only, and
> BR2_PACKAGE_PYTHON3 is they support Python 3 only.

Also, keep in mind, that having a symlink python pointing to python3
may/will break some build system,
like scons (which does not yet support python3) and some other per-package ones.

Regards,

-- 
Samuel
