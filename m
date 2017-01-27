From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:53:36 +1300
Subject: [Buildroot] [PATCH 1/1] gst-plugins-base: add missing
 dependency on libxml2 for subparse
In-Reply-To: <1482979928-2625-1-git-send-email-danomimanchego123@gmail.com>
References: <1482979928-2625-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20170127215336.42e110de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Dec 2016 21:52:08 -0500, Danomi Manchego wrote:
> The gst-plugins-base configure script claims that the subparse plugin is
> dependency-less - but it also silently disables subparse if libxml2 is
> not available.  So depend on libxml2 when subparse is selected.
> 
> Note: the analogous gst1 subparse plugin does not have this requirement.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/gstreamer/gst-plugins-base/Config.in           | 1 +
>  package/gstreamer/gst-plugins-base/gst-plugins-base.mk | 1 +
>  2 files changed, 2 insertions(+)

I've applied to master, but before that, I've moved the "subparse"
option from the "dependency-less plugins" category to the "plugins with
external dependencies" section.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
