From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 26 Jan 2017 12:14:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <20170126111125.f7snoblajixwt322@tarshish>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
 <20170126111125.f7snoblajixwt322@tarshish>
Message-ID: <1485429244.1041.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, 2017-01-26 at 13:11 +0200, Baruch Siach wrote:
> Hi Samuel,
> 
> On Thu, Jan 26, 2017 at 12:04:41PM +0100, Samuel Martin wrote:
> > On Wed, Jan 25, 2017 at 10:15 PM, Baruch Siach <baruch@tkos.co.il>
> > wrote:
> > > On Wed, Jan 25, 2017 at 10:05:42PM +0100, J?rg Krause wrote:
> > > > On Wed, 2017-01-25 at 08:30 +0100, Thomas Petazzoni wrote:
> > > > [snip]
> > > > 
> > > > > Detail of failures
> > > > > ===================
> > > > > 
> > > > > ????????i586 |????????????????bctoolbox-0.4.0 | NOK | http://
> > > > > autobuil
> > > > > d.buildroot.net/results/4b4b00ad3b95ddacc9d5cc31c34e457ee55c9
> > > > > 364
> > 
> > Regarding this package, apologies I missed it during the initial
> > review :s
> > 
> > This build failure occurs because it goes in a path it should not.
> > In the Config.in: it is mentionned that mbedtls is prefered to
> > polarssl [1], hence the select [1] and the dependency in the *.mk
> > [2].
> > However, the cmake configure flags are not set accordingly to this,
> > and the defaults may play against us [3].
> > 
> > I would suggest to set the ENABLE_{MBEDTLS,POLARSSL} flags in the
> > *.mk first.
> > This should prevent from following this case [4], as displayed in
> > the
> > build log [5].
> > 
> > After this, if the CheckSymbolExists still causes error, we may
> > need
> > to patch the bctoolbox
> > cmake code to set/fix the variables used by CheckSymbolExists [6].
> > 
> > > > 
> > > > Unfortunately I cannot reproduce this issue. Is it a rpath
> > > > issue? cmake
> > > > links a test program with host zlib:
> > 
> > Note: I'm not able to reproduce the error either.
> 
> Do you have a 32bit libz.so.1 in /usr/lib on your host machine?

I do have:

ls -l /usr/lib??/libz.so.1
lrwxrwxrwx 1 root root 14 15. Jan 20:46 /usr/lib32/libz.so.1 ->
libz.so.1.2.11*
lrwxrwxrwx 1 root root 14 15. Jan 20:43 /usr/lib64/libz.so.1 ->
libz.so.1.2.11*

J?rg
