From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 22:44:13 +0100
Subject: [Buildroot] [PATCH 0/8] python: clean up host version logic.
In-Reply-To: <20180102214032.GA17491@scaer>
References: <20180102163337.6334-1-aduskett@gmail.com>
 <20180102214053.7c49ec09@windsurf.lan>
 <20180102214032.GA17491@scaer>
Message-ID: <20180102224413.70930c9d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2 Jan 2018 22:40:32 +0100, Yann E. MORIN wrote:

> > However, there is one thing that I believe is missing in your patch
> > series: BR2_PACKAGE_PYTHON3 should select BR2_PACKAGE_HOST_PYTHON3, and
> > BR2_PACKAGE_PYTHON should select BR2_PACKAGE_HOST_PYTHON.  
> 
> Furthermore, I believe the prompt should be hidden, because it does not
> make sense for the user to actually select the host version for python.

If the prompt is not user-selectable, then I don't see the point of the
patch series. Indeed, you can already do:

<pkg>_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

to use host-python3 if already built as part of the python3 build
process, or fallback to host-python otherwise. We already use this
construct in a number of places.

> Besides, the current series allows for building both host-python and
> host-python3 in the same configuration, and we do not support this for
> now (or we would have made it possible for the target variant too).

Of course we support building both host-python and host-python3. What
we don't support is:

 - python and python3 in the same configuration

 - building third-party host python modules for a host python version
   different from the selected target python version

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
