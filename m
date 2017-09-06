From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 13:49:56 +0200
Subject: [Buildroot] [RFC] testing: add python-cryptography tests
In-Reply-To: <1216716905.8315000.1504697461058.JavaMail.zimbra@datacom.ind.br>
References: <20170904071500.3858-1-yegorslists@googlemail.com>
 <59af5dfae6364_331f1091a18551a0@ultri3.mail>
 <20170906100656.5f5de18d@windsurf.lan>
 <1216716905.8315000.1504697461058.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170906134956.7fc5f023@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Sep 2017 08:31:01 -0300 (BRT), Ricardo Martincoski wrote:

> > Actually, I am not sure I agree with this last part. I even think we
> > should probably have a minimal test for each and every Python package,
> > because the only way to verify that their dependencies are correct is
> > to have a runtime test for them. So it would be nice to have a very
> > simple way to write Python related tests, like a list of tuples
> > (Buildroot package, Python package to import or Python command to run),
> > and have the test infrastructure "generate" tests for all entries in
> > this list.  
> 
> I will cook a patch for this.

We were discussing this the other day with Yann on IRC, and we're not
sure how to do it. Especially, should we have some of the testing
information in the package recipe itself (package/python-<foo>/) ? Or
do we keep all the testing related details in support/testing/ ?

The former has the advantage that the testing information is closer to
the package, and therefore people are more likely to add the
corresponding test cases when they add a Python package.

Something like:

define PYTHON_FOO_TEST_CMDS
	python -c import foo
endef

On the other hand, it also spreads the testing information all over the
tree, which may not be desirable. So I guess one needs to play a bit
with this and see what a good solution could be. I don't have a strong
opinion yet on how we should do this. Proposals welcome!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
