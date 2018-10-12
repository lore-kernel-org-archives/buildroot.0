From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 12 Oct 2018 08:54:18 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <c7c0d90d-a25e-7832-67c4-4aa3598691fd@mind.be>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <c7c0d90d-a25e-7832-67c4-4aa3598691fd@mind.be>
Message-ID: <7c64c3162d310b9aabc3a5305b7484d38628fa39.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2018-10-10 at 23:35 +0200, Arnout Vandecappelle wrote:
> 
> On 10/10/18 17:48, Thomas Petazzoni wrote:
> > >          arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/2bdbb93e6404943e59791773106d8b2680211886 |     
> > luvi 2.8.0 fails to build. Bernd, you bumped this package, and J?rg
> > suggested to revert the bump. Could you discuss this, and provide a fix?
> > 
> 
>  I think luv is missing a dependency on lua-compat53.

That's right! Unfortunately, it does not fix the build issue for luvi
as lua-compat53 does not install the required header file c-api/compat-
5.3.h at all.

So, lua-compat53 needs to be fixed first to install the header file and
luv needs an optional dependency on lua-compat53 if
!BR2_PACKAGE_LUA_5_3.

Best regards,
J?rg Krause
