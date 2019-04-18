From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:27:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: don't install boost
 cmake files
In-Reply-To: <20190418091350.13582-1-fontaine.fabrice@gmail.com>
References: <20190418091350.13582-1-fontaine.fabrice@gmail.com>
Message-ID: <20190418112703.7480a41b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 11:13:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since version 1.70.0, boost installs its own cmake files which are
> utterly broken so don't install them otherwise all cmake packages using
> boost (host-thrift, domoticz, i2pd ...) will fail because
> BOOST_INCLUDE_DIRS will be empty
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4ada26bab5c1e6504c7d8c92672326ced1d336df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
