From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 22:12:30 +0100
Subject: [Buildroot] [PATCH 1/2] wget: fix ssl detection in static libs
 configuration
In-Reply-To: <1478630202-1630-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1478630202-1630-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161111221230.5196a2a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 00:06:41 +0530, Rahul Bedarkar wrote:
> When building wget with openssl in static libs configuration, wget
> build system fails detect openssl because it doesn't specify LD flags
> for private libs used by openssl. This specifically happens when we
> pass --with-libssl-prefix to configure which tries to find ssl using
> custom flags. If we don't specify --with-libssl-prefix, it relies on
> pkg-config files to detect ssl and it's LD flags which helps with static
> linking.
> 
> This commit removes --with-libssl-prefix conf opts. Since this case is
> similar to gnutls, we remove same conf opts for gnutls as well.
> 
> wget can be built with either gnutls or openssl crypto libraries, so
> separate optional support for both is not required. This commit also
> does minor optimization by checking for either gnutls or openssl while
> at it.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/c6a/c6abdff37b86471cf8b0ceffeff5472042923de0/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/wget/wget.mk | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
