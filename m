From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Jan 2013 16:43:03 +0100
Subject: [Buildroot] [pull request] Pull request for branch
 pre-built-packages
In-Reply-To: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20130106164303.390d1235@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sat, 29 Dec 2012 17:14:47 +0100, Thomas Petazzoni wrote:

> Recently, we have had a number of users having issues with external
> toolchains because those are built for 32 bits Linux, and most
> developers know use 64 bits build machines. The error message such
> users get so far is very cryptic "Cannot execute cross-compiler".
> 
> So, this set of patches adds a small infrastructure in the form of a
> Kconfig option and a check in dependencies.sh. The Kconfig option
> allows packages to tell whether they need 32 bits compatibility
> libraries, and the check in dependencies.sh verifies that those
> libraries are installed (simply by checking the presence of the 32
> bits dynamic loader).
> 
> Then, all pre-built external toolchains as well as the sam-ba tool are
> modified to use this mechanism.
> 
> As a preliminary patch, all the pre-built external toolchains are
> changed to be visible only if the host architecture is x86 or x86-64.

Ping? Any problem with this?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
