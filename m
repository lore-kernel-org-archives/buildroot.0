From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 10 Mar 2011 11:04:39 +0100
Subject: [Buildroot] source-check shouldn't depend on allyesconfig
Message-ID: <AANLkTimhNcWoYZbk4rXxWNwCSkgT3bff_ujWGjMEPG3N@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently, the source-check target is implemented as follows:

# check if download URLs are outdated
source-check: allyesconfig
        $(MAKE) $(EXTRAMAKEARGS) _source-check


As a result of the allyesconfig dependency, executing this target will
override your .config file. For everyone, except the core buildroot
developers, this behavior is undesirable. Running this command, I had
expected that it would only check the packages that are actually
configured, so based on the current config.

If the allyesconfig dependency is removed, then core buildroot
developers can first do a manual 'make allyesconfig' before running
'make source-check', and everybody will be happy. Or we could
implement a second target, like 'all-source-check' or
'source-check-all' that implements the current behavior.

Any comments?

Thanks,
Thomas
