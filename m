From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:43:39 +0100
Subject: [Buildroot] [PATCH v2 1/1] qt5webengine: enable build for 5.6.3
In-Reply-To: <20171123232619.29849-1-gael.portay@savoirfairelinux.com>
References: <20171123232619.29849-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171127214339.6851dd9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Nov 2017 18:26:19 -0500, Ga?l PORTAY wrote:
> The build was broken in 5.6.2 and was disabled.
> 
> It compiles fine since 5.6.3.
> 
> The two additional patches are useful at run-time.
> 
> The first one avoid the need to specify the path to the SSL certificate
> directory (using an additional environment variable).
> 
> The second one is the same used in 5.9.x (plus resolved conflicts). It uses the
> process's context to get handles on EGL and GLESv2 libraries. Those libraries
> are linked to Qt WebEngine at compile time.
> 
> The patch is particularly usefull for RPI boards since the raspberrypi userland
> package does not provide the libEGLv2.so.2 and libGLES.so.1 symlinks. Both
> library paths are hardcoded in Qt WebEngine.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---

Following the feedback from Yann on the licensing question, I applied
to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
