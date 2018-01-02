From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 21:40:53 +0100
Subject: [Buildroot] [PATCH 0/8] python: clean up host version logic.
In-Reply-To: <20180102163337.6334-1-aduskett@gmail.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
Message-ID: <20180102214053.7c49ec09@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 11:33:29 -0500, Adam Duskett wrote:
> Currently, packages that rely on host-python, and are compatible with both
> python2 and 3, only build python3 if python3 is selected for the target.
> 
> This causes a problem in the following scenario:
> 
> - A user does not have a target python selected.
> - Package A depends on host-python3
> - Package B is compatible with host-python and host-python3
> 
> In this scenario, host-python is not needed, as package A and B are
> both compatible with python3. However; both host-python and host-python3 will
> be built because no target-python has been selected.
> 
> To fix this, the following patch series introduces a few minimal changes
> that will allow the user to manually select a host version of python.
> (Note: I have changed only the packages that I personally use and have tested.)

I will have to think a lot to fully grasp the potential consequences of
your changes.

However, there is one thing that I believe is missing in your patch
series: BR2_PACKAGE_PYTHON3 should select BR2_PACKAGE_HOST_PYTHON3, and
BR2_PACKAGE_PYTHON should select BR2_PACKAGE_HOST_PYTHON.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
