From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 18:19:04 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump version to
 v1.3-chrome37-firefox30
In-Reply-To: <1414763342-6580-1-git-send-email-sagaert.johan@skynet.be>
References: <1414763342-6580-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20141101181904.797e7198@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Fri, 31 Oct 2014 14:49:02 +0100, Sagaert Johan wrote:
> 
> Bumped the version and did some trivial reworking of the patch file :
> libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  ...le-shared-library-build-when-BUILD_SHARED.patch | 38 +++++++++-------------
>  package/libwebsockets/libwebsockets.mk             |  2 +-
>  2 files changed, 16 insertions(+), 24 deletions(-)

Applied, thanks. There were however a number of issues: it wasn't
building in a non-IPv6 configuration, and wasn't building with OpenSSL
disabled. So I've fixed that when committing:

    [Thomas:
     - Pass LWS_IPV6={ON,OFF} depending on the value of BR2_INET_IPV6,
       otherwise the build failed in a non-IPv6 configuration.
     - The name of the CMake option for OpenSSL support has changed, it's
       now LWS_WITH_SSL={ON,OFF}.
     - Adjust the description of patch 0002.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
