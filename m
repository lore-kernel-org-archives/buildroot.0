From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:47:23 +0100
Subject: [Buildroot] [PATCH v7 04/18] core: staging symlink uses a
 relative path when possible
In-Reply-To: <1457564339-27294-5-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20160310214723.0eb96ec9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Wed,  9 Mar 2016 23:58:45 +0100, Samuel Martin wrote:
> This change turns the staging/ symlink to a relative one when
> $(STAGING_DIR) points to some location in the Buildroot's output
> directory (i.e.: in $(BASE_DIR)/).
> 
> In any other case, the symlink target remains the absolute path
> to the sysroot location.
> 
> This slight change is a step forward toward a relocatable SDK.

Why is this important for a relocatable SDK ? The SDK is $(HOST_DIR),
and the staging symlink is just a convenience symlink which sits
outside of $(HOST_DIR), and hence outside the SDK.

So why should we care?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
