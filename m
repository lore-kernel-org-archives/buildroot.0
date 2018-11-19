From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 23:14:54 -0200
Subject: [Buildroot] [RFC 2/4] support/testing: add perl-time-hires test
References: <20181117175244.23594-3-francois.perrad@gadz.org>
Message-ID: <5bf20e8e32505_3eca3f955807cd6c210f5@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just giving an example of what I mentioned in a reply to the cover letter...

On Sat, Nov 17, 2018 at 03:52 PM, Francois Perrad wrote:

[snip]
> +class TestPerlTimeHiRes(TestPerl):
> +    config = TestPerl.config + \
> +        """
> +        BR2_PACKAGE_PERL_TIME_HIRES=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("Time::HiRes")

Another way to test a perl package would be to have an script added to the image
in build time, something like this:
sample_perl_time_hires.pl:
|use Time::HiRes;
|
|Time::HiRes::usleep(1_000_000)

And call:
perl sample_perl_time_hires.pl

This way we could test scripts with a few lines of code and keep it readable in
the tree.


Regards,
Ricardo
