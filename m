From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 15:29:37 +0200
Subject: [Buildroot] [PATCH 1/1] boost: bump to 1.65.1
In-Reply-To: <20171017204407.27704-1-Adamduskett@outlook.com>
References: <20171017204407.27704-1-Adamduskett@outlook.com>
Message-ID: <20171021152937.438dfae9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 16:44:07 -0400, Adam Duskett wrote:
> Other changes:
> - The coroutine2 library has been removed.  As such it has been removed
>   from the boost.mk file, the boost Config.in file, and a new entry has
>   been added to Config.in.legacy explaining that it has been removed.
> 
> - Add LICENSE_1_0.txt sha256sum to boost.hash
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  Config.in.legacy         | 6 ++++++
>  package/boost/Config.in  | 4 ----
>  package/boost/boost.hash | 7 +++++--
>  package/boost/boost.mk   | 9 ++++-----
>  4 files changed, 15 insertions(+), 11 deletions(-)

Following the comments from the reviewers (thanks to them!), I've:

 - Reworded the commit log to be correct about what happened to
   coroutine2

 - Removed the Config.in.legacy handling: even though we're removing an
   option, coroutine2 support is now unconditionally present in Boost,
   so having legacy handling for this doesn't make much sense.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
