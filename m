From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:48:56 +0200
Subject: [Buildroot] [PATCH] ruby: add upstream security patches bumping
 rubygems to 2.6.13
In-Reply-To: <20170907091755.9491-1-peter@korsgaard.com>
References: <20170907091755.9491-1-peter@korsgaard.com>
Message-ID: <20170909224856.3226b95b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Sep 2017 11:17:55 +0200, Peter Korsgaard wrote:
> We unfortunately cannot use the upstream patches directly as they are not in
> 'patch -p1' format, so convert them and include instead.
> 
> Fixes:
> 
> CVE-2017-0899 - RubyGems version 2.6.12 and earlier is vulnerable to
> maliciously crafted gem specifications that include terminal escape
> characters.  Printing the gem specification would execute terminal escape
> sequences.
> 
> CVE-2017-0900 - RubyGems version 2.6.12 and earlier is vulnerable to
> maliciously crafted gem specifications to cause a denial of service attack
> against RubyGems clients who have issued a `query` command.
> 
> CVE-2017-0901 - RubyGems version 2.6.12 and earlier fails to validate
> specification names, allowing a maliciously crafted gem to potentially
> overwrite any file on the filesystem.
> 
> CVE-2017-0902 - RubyGems version 2.6.12 and earlier is vulnerable to a DNS
> hijacking vulnerability that allows a MITM attacker to force the RubyGems
> client to download and install gems from a server that the attacker
> controls.
> 
> For more details, see
> https://www.ruby-lang.org/en/news/2017/08/29/multiple-vulnerabilities-in-rubygems/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ruby/0001-rubygems-2612-ruby24.patch | 445 +++++++++++++++++++++++++++
>  package/ruby/0002-rubygems-2613-ruby24.patch | 364 ++++++++++++++++++++++
>  2 files changed, 809 insertions(+)
>  create mode 100644 package/ruby/0001-rubygems-2612-ruby24.patch
>  create mode 100644 package/ruby/0002-rubygems-2613-ruby24.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
