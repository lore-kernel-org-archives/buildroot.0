From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 09:56:20 +0100
Subject: [Buildroot] [PATCH] external python modules: remove redundant
 python dependency
In-Reply-To: <7ffd4acd582283fb083a.1387905292@argentina>
References: <7ffd4acd582283fb083a.1387905292@argentina>
Message-ID: <20131225095620.7e4d611c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 24 Dec 2013 18:14:52 +0100, Thomas De Schampheleire wrote:
> File package/Config.in already groups the external python modules inside a
> 'if BR2_PACKAGE_PYTHON ... endif' statement, so adding a
> 'depends on BR2_PACKAGE_PYTHON' statement to the individual Config.in files
> is not needed.
> 
> This is in line with the way gstreamer packages are handled.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

I don't agree with this change. This duplication of "depends on" is
going to be really useful when we enable Python packages to be compiled
with Python 3. When we'll do this, we will change the:

if BR2_PACKAGE_PYTHON
source ...
source ...
endif

to:

if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
source ...
source ...
endif

But still we will want to be able to decide on a per-package basis
which package is available for Python 2.x, for Python 3.x or for both.

Therefore, I'd like to keep these "depends on" for the moment.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
