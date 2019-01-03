From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 15:28:34 +0100
Subject: [Buildroot] [PATCH 1/2] package/gettext: Turn into virtual
 package
In-Reply-To: <CAMw6YJKfY_+pK=gDCb9QF=sbg+RXhJbgC=zJC8qXy_MxMwjsVg@mail.gmail.com>
References: <20181223150448.21980-1-vadim4j@gmail.com>
 <20181223150448.21980-2-vadim4j@gmail.com>
 <20181230181026.3ce6aca3@windsurf>
 <CAMw6YJLfzWh+=5NVkjO=TPiZ75KdOw6x-qApgPUeV+mUMKYqOg@mail.gmail.com>
 <20181231160614.0f7e9f0b@windsurf>
 <CAMw6YJKfY_+pK=gDCb9QF=sbg+RXhJbgC=zJC8qXy_MxMwjsVg@mail.gmail.com>
Message-ID: <20190103152834.3194d737@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Thu, 3 Jan 2019 16:28:52 +0200, Vadim Kochan wrote:

> Why do we need default host-gettext dependencies for such packages
> like wine, flex
> if they builds successfully (I tried uclibc, musl) if to manually
> remove such dependency
> from their *.mk files ?

Do you have gettext installed on your system ? If you do, then the
build of wine for example may succeed by using the "gettext" command of
your build machine. But Buildroot is not supposed to depend on the
gettext available on the build machine.

Note: this is speculation, I have not re-tested. If you want a
confirmation, I can do a proper test.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
