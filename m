From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 09:17:40 +0100
Subject: [Buildroot] [PATCH v3 1/1] iputils: resolve musl compatibility
In-Reply-To: <CAFt09wOgaktzEG+GVhf=fEfC=bnQdqAYLF3kn8fj7A10emMEBQ@mail.gmail.com>
References: <1453292421-21583-1-git-send-email-matt@thewebers.ws>
 <20160120214518.2914b389@free-electrons.com>
 <CAFt09wOgaktzEG+GVhf=fEfC=bnQdqAYLF3kn8fj7A10emMEBQ@mail.gmail.com>
Message-ID: <20160121091740.795734ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Wed, 20 Jan 2016 18:27:17 -0600, Matthew Weber wrote:

> > You don't explain here why you are adding libcap as a mandatory
> > dependency. USE_CAP=no still exists, and it stills works, so there is
> > no reason to make libcap a mandatory dependency.
> 
> That's fair, I was attempting to cleanup assumptions in the build to
> build the standard config without and disables (except deprecated
> items).  I will update per the below suggestion to enable that option
> with libcap is selected.

Our policy in general is to try to build things with minimal
dependencies by default. So if it can build with libcap, then it should
be built without libcap by default, unless libcap is explicitly
selected, of course.

Like any rule, there are some exceptions, like if a package can build
without a dependency, but becomes really useless. I don't think it's
the case of iputils.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
