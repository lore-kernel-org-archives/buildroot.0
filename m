From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 16:07:46 +0100
Subject: [Buildroot] [PATCH v2 2/2] python-cheetah: add new package
In-Reply-To: <CAHXCMMJmRERqJg9so6M1dW8-oLGMEhahZd4tVr=5PsWZ1hNgDg@mail.gmail.com>
References: <1419074278-17625-1-git-send-email-gwenj@trabucayre.com>
 <1419074278-17625-2-git-send-email-gwenj@trabucayre.com>
 <CAHXCMMJmRERqJg9so6M1dW8-oLGMEhahZd4tVr=5PsWZ1hNgDg@mail.gmail.com>
Message-ID: <20141220160746.0e91d485@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat, 20 Dec 2014 13:59:36 +0100, Samuel Martin wrote:

> If you mean: "target python-cheetah needs target python-markdown
> package", we usually use "select ...", and don't forget to add this
> dependency in the *.mk file too.

Unless it's a runtime dependency, which is very often the case for
Python modules. In this case, having a select in Config.in is
sufficient, there is no need to have a dependency in the .mk file.
However, in such cases, we clarify things by doing:

	# runtime dependency only
	select BR2_PACKAGE_<foobar>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
