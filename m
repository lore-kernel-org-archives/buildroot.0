From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 07 Feb 2017 20:07:43 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <CAHXCMMJ_bNBo+dx3N1ugJQmJQxCvc+PaWjY93oYCi1nTBQQTew@mail.gmail.com>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
 <1485722254.4549.1.camel@embedded.rocks>
 <20170129211155.f6sebtrdmsrwb2yw@tarshish>
 <1485806342.3759.3.camel@embedded.rocks>
 <20170130212025.a5mmf5kfig3kgngo@tarshish>
 <1485811370.2212.0.camel@embedded.rocks>
 <20170130212602.xmxjbkp4zzrfhuof@tarshish>
 <1486333037.12820.6.camel@embedded.rocks>
 <20170206120617.7760c340@free-electrons.com>
 <CAHXCMMKmaRC8z6-A_xucDxiAhz1-2xqPhGvogMLhW8uTO2Xw7Q@mail.gmail.com>
 <7A7D81D5-CC2B-41A5-9275-C9D7F63A5CF1@embedded.rocks>
 <CAHXCMMJ5Mp=8v-AmAY20wGz0UZ3qBoRMAQmZBFhWVApkM4dnZA@mail.gmail.com>
 <C119D098-632D-42AB-A4C7-13481318DDDC@embedded.rocks>
 <CAHXCMMJy9T9QTviUMUUqxR8j3Y866BfXQbQ7uN4xcu6BY87eig@mail.gmail.com>
 <1486424308.4950.9.camel@embedded.rocks>
 <CAHXCMMJ-HNK9mCC8_cf1Fk4CnX7NCGF9ypWBVCu2JeBa5oK8CQ@mail.gmail.com>
 <1486472439.1692.3.camel@embedded.rocks>
 <CAHXCMMJ_bNBo+dx3N1ugJQmJQxCvc+PaWjY93oYCi1nTBQQTew@mail.gmail.com>
Message-ID: <1486494463.2089.0.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Tue, 2017-02-07 at 14:29 +0100, Samuel Martin wrote:
> On Tue, Feb 7, 2017 at 2:00 PM, J?rg Krause <joerg.krause@embedded.ro
> cks> wrote:
> > Hi Samuel,
> > 
> > On Tue, 2017-02-07 at 12:28 +0100, Samuel Martin wrote:
> > > J?rg, all,
> > > 
> > > On Tue, Feb 7, 2017 at 12:38 AM, J?rg Krause
> > > <joerg.krause@embedded.rocks> wrote:
> > > > Hi Samuel,
> > > > 
> > 
> > [snip]
> > 
> > > > 
> > > > Version 3.6.3 works, too. So, I did a git bisect. The rpath
> > > > issue
> > > > was
> > > > introduced in "Teach find_library and find_package to search
> > > > lib32
> > > > paths" [1].
> > > 
> > > Thanks for the investigation!
> > > 
> > > > 
> > > > Any ideas how to fix this?
> > > 
> > > Not so far :-/
> > 
> > Ray Donnely proposed a potential fix for this issue [1] on the
> > CMake
> > mailing list. I have not tried the patch so far.
> 
> Good to know CMake folks are already on this issue.
> 
> > 
> > > Could you apply this change, run (from an already populated build
> > > tree, no need to restart the build from scratch):
> > > ? $ make mbedtls-dirclean mbedtls-configure 2>&1 | tee mbedtls-
> > > configure.log
> > > 
> > > and pastebin/share the mbedtls-configure.log file?
> > 
> > Sorry, but I don't understand. Which change do you mean? Should I
> > run
> > this on the Debian (bctoolbox build error is reproducable) or the
> > Arch
> > (bctoolbox build error is not reproducable) host? Which CMake
> > version
> > should I use?
> 
> Sorry, I forgot the url :s this one:
> http://code.bulix.org/pkabso-113323

This is the link to the output:
http://code.bulix.org/gu6jeh-113374
