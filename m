From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 17:13:11 +0200
Subject: [Buildroot] [PATCH/next 1/2] python: do not use hg or svn when
 available
In-Reply-To: <1472675909-20905-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472675909-20905-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160918171311.50de8cc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Aug 2016 22:38:28 +0200, Thomas Petazzoni wrote:
> During the execution of its configure script, Python tries to find an
> available "hg" and "svn" installation, and if available, will try to use
> them to get information from the version control system. To do this, it
> tries to communicate over the network, potentially over ports that are
> blocked, causing the build to halt. This was reported by a user as part
> of bug #7802.
> 
> To solve this, we simply make the Python script use /bin/false as the
> "hg" and "svn" programs.
> 
> Fixes bug #7802 for the python package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python/python.mk | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
