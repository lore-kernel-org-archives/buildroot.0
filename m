From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 14 Feb 2019 10:20:58 +0100
Subject: [Buildroot] [PATCH] package/luvi: add patch to fix build issue
 with OpenSSL 1.1.1a
In-Reply-To: <20190214094306.0a28abb3@windsurf>
References: <20190213220812.29978-1-joerg.krause@embedded.rocks>
 <20190214094306.0a28abb3@windsurf>
Message-ID: <6d2c8c692f78f39ea34fa31f728054845a7b2d87.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2019-02-14 at 09:43 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 13 Feb 2019 23:08:11 +0100
> J?rg Krause <joerg.krause@embedded.rocks> wrote:
> 
> > Bump the bundled lua-openssl version to 0.7.4 for compatibility with
> > OpenSSL 1.1.1a.
> > 
> > Note, that luvi 2.7.6 is the latest version providing a release tarball.
> > 
> > Runtime tested on Banana Pro, note that version string for lua-openssl
> > does not match the tag name (0.7.4):
> > 
> > ```
> > luvi v2.7.6
> > zlib: 1.2.11
> > libuv: 1.25.0
> > ssl: OpenSSL 1.1.1a  20 Nov 2018, lua-openssl 0.7.3
> > ```
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/e87994a3dc987f5aa101a5e721ac927e21453373
> > http://autobuild.buildroot.net/results/ea725ad90cfcd3c5e242268a593dcabd7297fe70
> > http://autobuild.buildroot.net/results/f2fb9eea0044e4a5f674742d29ea95af49cf5a45
> > http://autobuild.buildroot.net/results/de4daa1b930f907f06640dc98a708016217ddea5
> > .. and many more.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> This is really a huge patch.

Yes, unfortunately!

> Why is luvi using a bundled lua-openssl version instead of some
> external lua-openssl package ?

I spent some time trying to make lua-openssl an external package. It is
certainly feasible to get luvi to work to use an external lua-openssl
package, but it requires some changes in lua-openssl first, as
installing header files in staging, naming convention for the shared
library, etc.

Right now, it was easier for me, to just bump the bundled lua-openssl
version.

> I see that the change has been applied upstream
> (https://github.com/luvit/luvi/commit/0d5959a33cde81ed49314bd6c56f6906a83d2fa1),
> which is good.

Yes, there was a commit [1] on the master branch before, which bumped
lua-openssl to version 0.7.3. However, this version does not build with
OpenSSL 1.1.1.

Unfortunately, the luvi maintainers are not able to create new releases
right now. Hopefully, someone of the maintainers with push rights will
have the time soon to do so.

[1] https://github.com/luvit/luvi/commit/a981c704b960e52974ec5746a25b86de40b2cb67

Best regards
J?rg
