From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 12:37:25 +0100
Subject: [Buildroot] [PATCH/next v3 5/8] support/testing: add
 perl-libwww-perl test
In-Reply-To: <CAB0FRstu85RTQ1tQm=fSkYOouLRZgxvkCq8VkXF+y0J82_o-xA@mail.gmail.com>
References: <20181124090723.14722-1-francois.perrad@gadz.org>
 <20181124090723.14722-6-francois.perrad@gadz.org>
 <20181124110608.681120b2@windsurf>
 <CAB0FRstu85RTQ1tQm=fSkYOouLRZgxvkCq8VkXF+y0J82_o-xA@mail.gmail.com>
Message-ID: <20181124123725.7c17ef1a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 11:56:30 +0100, Fran?ois Perrad wrote:

> > Sorry if I haven't followed the previous discussion, but why do we have
> > this docstring ? Is it just for information ?
> >  
> Yes, this is for information.

OK.

> By this way, we know that we don't need to write another test for HTTP-Date
> or IO-HTML.

This is not really true. Indeed, if you test HTTP-Date with plenty of
other packages installed, how are you sure that HTTP-Date has all the
necessary runtime dependencies it needs ?

Only a test with only HTTP-Date installed and its dependencies will
allow to verify this.

> > > +    def test_run(self):
> > > +        self.login()
> > > +        self.module_test("LWP")
> > > +        self.module_test("LWP::UserAgent")
> > > +        self.module_test("LWP::Authen::Basic")
> > > +        self.module_test("LWP::Authen::Digest")
> > > +        self.module_test("HTTP::Message")
> > > +        self.module_test("HTTP::Daemon")
> > > +        self.module_test("WWW::RobotRules")  
> >
> > Why are you testing specifically those modules ? What is the rule to
> > decide what modules are tested here ?
> >
> >  
> libwww-perl is a special package/distribution from the beginning of the WWW
> history
> (started in 1995, see https://metacpan.org/changes/distribution/libwww-perl
> ).
> In fact, libwww-perl collection is a set of Perl modules.
> LWP (Lib World-Wide Web Perl) is just a name space for some of them, and
> doesn't match with the distribution name libwww.
> So, we need load most of them.

OK, so all those modules are the ones part of libwww-perl, i.e we are
not testing modules installed by other packages, correct ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
