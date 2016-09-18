From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 17:13:35 +0200
Subject: [Buildroot] [PATCH/next 2/2] python3: do not use hg or svn when
 available
In-Reply-To: <1472675909-20905-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472675909-20905-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1472675909-20905-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160918171335.24f4f5aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Aug 2016 22:38:29 +0200, Thomas Petazzoni wrote:
> During the execution of its configure script, Python 3 tries to find an
> available "hg" installation, and if available, will try to use it to get
> information from the version control system. To do this, it tries to
> communicate over the network, potentially over ports that are blocked,
> causing the build to halt. This was reported by a user as part of bug
> 7802.
> 
> To solve this, we simply make the Python script use /bin/false as the
> "hg" program.
> 
> Fixes bug #7802 for the python3 package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python3/python3.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied after fixing the commit title to not mention svn, since python3
never tried to use svn (contrary to python 2.x).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
