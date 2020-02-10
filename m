From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 10 Feb 2020 17:45:45 +0100
Subject: [Buildroot] [PATCH 12/12] support/testing: add missing test
 file for perl-html-parser
In-Reply-To: <20200210104706.19186-13-patrickdepinguin@gmail.com>
References: <20200210104706.19186-1-patrickdepinguin@gmail.com>
 <20200210104706.19186-13-patrickdepinguin@gmail.com>
Message-ID: <CAB0FRsv9JjB-TMA_LjAtUg-xnygdWsY841R858xjOfAL6+fZeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 10 f?vr. 2020 ? 11:48, Thomas De Schampheleire <
patrickdepinguin@gmail.com> a ?crit :

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> This file was created by utils/scancpan while adding other packages but
> apparently not yet added in the repo.
>
>
HTML-Parser is a dependency of libwww-perl,
and already tested by
https://git.busybox.net/buildroot/tree/support/testing/tests/package/test_perl_libwww_perl.py#n39

Someone may think this additional test is redundant.

Fran?ois


> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  .../tests/package/test_perl_html_parser.py    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 support/testing/tests/package/test_perl_html_parser.py
>
> diff --git a/support/testing/tests/package/test_perl_html_parser.py
> b/support/testing/tests/package/test_perl_html_parser.py
> new file mode 100644
> index 0000000000..6431633482
> --- /dev/null
> +++ b/support/testing/tests/package/test_perl_html_parser.py
> @@ -0,0 +1,20 @@
> +from tests.package.test_perl import TestPerlBase
> +
> +
> +class TestPerlHTMLParser(TestPerlBase):
> +    """
> +    package:
> +        HTML-Parser   XS
> +    direct dependencies:
> +        HTML-Tagset
> +    """
> +
> +    config = TestPerlBase.config + \
> +        """
> +        BR2_PACKAGE_PERL=y
> +        BR2_PACKAGE_PERL_HTML_PARSER=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("HTML::Parser")
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200210/2a5b5e74/attachment.html>
