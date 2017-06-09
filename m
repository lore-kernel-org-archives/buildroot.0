From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jun 2017 12:03:47 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/libv4l: build of v4l2
 utilities on noMMU platform
In-Reply-To: <9f921390-6cb1-b650-55d2-2099c7d7445e@st.com>
References: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
 <1496830327-5235-3-git-send-email-hugues.fruchet@st.com>
 <20170608215726.7d44a6c6@free-electrons.com>
 <9f921390-6cb1-b650-55d2-2099c7d7445e@st.com>
Message-ID: <20170609120347.40482ff2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Jun 2017 09:39:07 +0000, Hugues FRUCHET wrote:

> > However, the removal of the locale dependency, I'm not sure. Is it
> > fixed by your previous patch? Is it already fixed in v4l ?  
> On my environment (STM32F4), BR2_ENABLE_LOCALE is not set but this is 
> not preventing libv4l package build. It is not clear to me why this
> dependency is there.

OK. It could be that an older version of libv4l required locale
support, but it is no longer needed.

In any case, it is a separate matter, so it should be a separate patch.

> > package/v4l2grab/Config.in:     select BR2_PACKAGE_LIBV4L
> > package/zbar/Config.in: select BR2_PACKAGE_LIBV4L
> > 
> > Adjusting those packages (if applicable) can however be done in
> > separate patches.  
> Ok I will have a look to those packages.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
