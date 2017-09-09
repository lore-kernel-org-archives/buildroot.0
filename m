From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:01:32 +0200
Subject: [Buildroot] [PATCH] stella: fix build without threads support
In-Reply-To: <1504955136-10831-1-git-send-email-sergio.prado@e-labworks.com>
References: <1504955136-10831-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20170909220132.76ba63a9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Sep 2017 08:05:36 -0300, Sergio Prado wrote:
> Fix build error when building using toolchain without threads support:
> 
> src/common/tv_filters/AtariNTSC.hxx:172:16: error: 'thread' is not a member of 'std'
>      unique_ptr<std::thread[]> myThreads;
>                      ^~~
> 
> Since version 5.0.2, Stella needs a toolchain with threads support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bd30388ee24294158d0a373764408c8c846853d4
> http://autobuild.buildroot.net/results/ad1571cecfc697650b436c147b5f3a1b4326091d
> http://autobuild.buildroot.net/results/10b73362358f3af45534a0cd096672dd1460a7d0
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/stella/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
