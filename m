From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 31 Mar 2016 09:49:56 +0200
Subject: [Buildroot] [PATCH v2] boost: fix getchar issue with uClibc and
 gcc <= 4.8.2
In-Reply-To: <20160331034802.4d1d7f1e@free-electrons.com>
References: <1459376376-18985-1-git-send-email-joerg.krause@embedded.rocks>
 <20160331034802.4d1d7f1e@free-electrons.com>
Message-ID: <1459410596.2416.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2016-03-31 at 03:48 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 31 Mar 2016 00:19:36 +0200, J?rg Krause wrote:
> > 
> > getchar() is defined as a macro in uClibc. This hits gcc bug 58952
> > [1] for all
> > gcc versions <= 4.8.2 and building boost/test fails:
> > 
> > ./boost/test/impl/unit_test_main.ipp: In function 'int
> > boost::unit_test::unit_test_main(boost::unit_test::init_unit_test_f
> > unc, int, char**)':
> > ./boost/test/impl/unit_test_main.ipp:194:18: error: expected
> > unqualified-id before '(' token
> > 
> > To allow building boost/test with uClibc based toolchains with gcc
> > <= 4.8.2 use
> > parenthesis for std::getchar.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/506/506b3b1b4087318a42474567
> > 82ac9e4f128d5db6/
> > http://autobuild.buildroot.net/results/5f2/5f2a8fb5cb823160542ee721
> > 591867b34bd25de6/
> > http://autobuild.buildroot.net/results/e3e/e3e6002ac5b40f7f03d32ba9
> > da99f6497f01b42f/
> > .. and more
> > 
> > Upstream status: Pending
> > https://github.com/boostorg/test/pull/97
> > 
> > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58952
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> > v2:
> > ?- add autobuild fixes
> Weird, I remember discussing this issue quite a long time ago, and I
> think we had already fixed it. But it looks like not. So thanks for
> submitting this patch. Applied!

Yes, we discussed about the issue, but somehow we missed it to submit a
patch. You're welcome!

J?rg
