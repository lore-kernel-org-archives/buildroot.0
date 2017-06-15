From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:28:29 +0200
Subject: [Buildroot] [PATCH] boost: module context affected by GCC bug
 64735
In-Reply-To: <20170615094000.28246-1-joerg.krause@embedded.rocks>
References: <20170615094000.28246-1-joerg.krause@embedded.rocks>
Message-ID: <20170615222829.7eee4a5d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Jun 2017 11:40:00 +0200, J?rg Krause wrote:
> Building boosts module context is affected by GCC bug 64735 [1]:
> 
> ```
> ./boost/context/execution_context_v2.hpp:298:31: error: 'exception_ptr' is not a member of 'std'
>      auto p = std::make_tuple( std::exception_ptr{}, std::move( data) );
> ```
> 
> This is because `exception_ptr` from libstdc++ is not available for
> architectures not supporting always lock-free atomic ints.
> 
> Note, that this bug is fixed in GCC 7.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f4e/f4e8a3727f19f7df4a1c45efe3603422fafd4af5/
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
