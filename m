From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:06:08 +0100
Subject: [Buildroot] [PATCH/next v3 5/8] support/testing: add
 perl-libwww-perl test
In-Reply-To: <20181124090723.14722-6-francois.perrad@gadz.org>
References: <20181124090723.14722-1-francois.perrad@gadz.org>
 <20181124090723.14722-6-francois.perrad@gadz.org>
Message-ID: <20181124110608.681120b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Thanks a lot for this work on adding tests for Perl packages. It is
really great to see the testing infrastructure being used more widely.
A few questions below.

On Sat, 24 Nov 2018 10:07:19 +0100, Francois Perrad wrote:

> +class TestPerllibwwwperl(TestPerlBase):
> +    """
> +    package:
> +        libwww-perl
> +    direct dependencies:
> +        Encode-Locale
> +        File-Listing
> +        HTML-Parser
> +        HTTP-Cookies
> +        HTTP-Daemon
> +        HTTP-Date
> +        HTTP-Message
> +        HTTP-Negotiate
> +        LWP-MediaTypes
> +        Net-HTTP
> +        Try-Tiny
> +        URI
> +        WWW-RobotRules
> +    indirect dependencies:
> +        HTML-Tagset
> +        IO-HTML
> +    """

Sorry if I haven't followed the previous discussion, but why do we have
this docstring ? Is it just for information ?

> +    config = TestPerlBase.config + \
> +        """
> +        BR2_PACKAGE_PERL=y
> +        BR2_PACKAGE_PERL_LIBWWW_PERL=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("LWP")
> +        self.module_test("LWP::UserAgent")
> +        self.module_test("LWP::Authen::Basic")
> +        self.module_test("LWP::Authen::Digest")
> +        self.module_test("HTTP::Message")
> +        self.module_test("HTTP::Daemon")
> +        self.module_test("WWW::RobotRules")

Why are you testing specifically those modules ? What is the rule to
decide what modules are tested here ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
