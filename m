From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 14:29:58 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/dstat: needs python
In-Reply-To: <20170525231207.22360-2-bernd.kuhls@t-online.de>
References: <20170525231207.22360-1-bernd.kuhls@t-online.de>
 <20170525231207.22360-2-bernd.kuhls@t-online.de>
Message-ID: <20170526142958.0f422ff7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 May 2017 01:12:07 +0200, Bernd Kuhls wrote:
> The package contains a python script, so having python compiled for
> target is needed for the package to work.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Python is just a runtime dependency, dstat builds just fine *before*
python. So the current situation is correct. The only thing that could
be improved is the addition of a:

	# runtime dependency

comment in the Config.in, above the "select BR2_PACKAGE_PYTHON".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
