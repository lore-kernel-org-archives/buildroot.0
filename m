From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 19 Feb 2019 21:46:20 +0100
Subject: [Buildroot] [PATCH] package/luvi: add patch to fix build issue
 with OpenSSL 1.1.1a
In-Reply-To: <20190214094306.0a28abb3@windsurf>
References: <20190213220812.29978-1-joerg.krause@embedded.rocks>
 <20190214094306.0a28abb3@windsurf>
Message-ID: <4e2d7a6a64406b266514ab8105c400dedf80356a.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
> 
> Why is luvi using a bundled lua-openssl version instead of some
> external lua-openssl package ?
> 
> I see that the change has been applied upstream
> (https://github.com/luvit/luvi/commit/0d5959a33cde81ed49314bd6c56f6906a83d2fa1),
> which is good.

Fortunately, the maintainers of luvi released version 2.9.0 which
includes the updated lua-openssl to fix the build issues with OpenSSL
1.1.1a.

Therefore, this patch is superseded.

J?rg
