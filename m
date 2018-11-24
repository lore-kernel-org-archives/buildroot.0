From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 24 Nov 2018 11:56:30 +0100
Subject: [Buildroot] [PATCH/next v3 5/8] support/testing: add
 perl-libwww-perl test
In-Reply-To: <20181124110608.681120b2@windsurf>
References: <20181124090723.14722-1-francois.perrad@gadz.org>
 <20181124090723.14722-6-francois.perrad@gadz.org>
 <20181124110608.681120b2@windsurf>
Message-ID: <CAB0FRstu85RTQ1tQm=fSkYOouLRZgxvkCq8VkXF+y0J82_o-xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 24 nov. 2018 ? 11:06, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fran?ois,
>
> Thanks a lot for this work on adding tests for Perl packages. It is
> really great to see the testing infrastructure being used more widely.
> A few questions below.
>
> On Sat, 24 Nov 2018 10:07:19 +0100, Francois Perrad wrote:
>
> > +class TestPerllibwwwperl(TestPerlBase):
> > +    """
> > +    package:
> > +        libwww-perl
> > +    direct dependencies:
> > +        Encode-Locale
> > +        File-Listing
> > +        HTML-Parser
> > +        HTTP-Cookies
> > +        HTTP-Daemon
> > +        HTTP-Date
> > +        HTTP-Message
> > +        HTTP-Negotiate
> > +        LWP-MediaTypes
> > +        Net-HTTP
> > +        Try-Tiny
> > +        URI
> > +        WWW-RobotRules
> > +    indirect dependencies:
> > +        HTML-Tagset
> > +        IO-HTML
> > +    """
>
> Sorry if I haven't followed the previous discussion, but why do we have
> this docstring ? Is it just for information ?
>
>
Yes, this is for information.
By this way, we know that we don't need to write another test for HTTP-Date
or IO-HTML.

> +    config = TestPerlBase.config + \
> > +        """
> > +        BR2_PACKAGE_PERL=y
> > +        BR2_PACKAGE_PERL_LIBWWW_PERL=y
> > +        """
> > +
> > +    def test_run(self):
> > +        self.login()
> > +        self.module_test("LWP")
> > +        self.module_test("LWP::UserAgent")
> > +        self.module_test("LWP::Authen::Basic")
> > +        self.module_test("LWP::Authen::Digest")
> > +        self.module_test("HTTP::Message")
> > +        self.module_test("HTTP::Daemon")
> > +        self.module_test("WWW::RobotRules")
>
> Why are you testing specifically those modules ? What is the rule to
> decide what modules are tested here ?
>
>
libwww-perl is a special package/distribution from the beginning of the WWW
history
(started in 1995, see https://metacpan.org/changes/distribution/libwww-perl
).
In fact, libwww-perl collection is a set of Perl modules.
LWP (Lib World-Wide Web Perl) is just a name space for some of them, and
doesn't match with the distribution name libwww.
So, we need load most of them.

Fran?ois


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181124/67c3d3c3/attachment.html>
