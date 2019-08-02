From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 17:36:15 +0200
Subject: [Buildroot] [PATCH] support/testing: improve test_luasyslog
In-Reply-To: <20190801204451.15116-1-francois.perrad@gadz.org>
References: <20190801204451.15116-1-francois.perrad@gadz.org>
Message-ID: <6ce0945d-3f68-dec0-ee7b-48db29ea7c64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/08/2019 22:44, Francois Perrad wrote:
> first, check the native part
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  support/testing/tests/package/test_luasyslog.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/support/testing/tests/package/test_luasyslog.py b/support/testing/tests/package/test_luasyslog.py
> index 4eb5402d0..158b95cb0 100644
> --- a/support/testing/tests/package/test_luasyslog.py
> +++ b/support/testing/tests/package/test_luasyslog.py
> @@ -10,6 +10,7 @@ class TestLuaLuasyslog(TestLuaBase):
>  
>      def test_run(self):
>          self.login()
> +        self.module_test("lsyslog")
>          self.module_test("logging.syslog")
>  
>  
> @@ -22,4 +23,5 @@ class TestLuajitLuasyslog(TestLuaBase):
>  
>      def test_run(self):
>          self.login()
> +        self.module_test("lsyslog")
>          self.module_test("logging.syslog")
> 
