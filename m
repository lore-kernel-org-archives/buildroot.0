From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 18:01:05 +0200
Subject: [Buildroot] [PATCH 5/7] support/testing: add test of BR2_CCACHE
 with an external toolchain
In-Reply-To: <20170709232123.30120-6-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-6-arnout@mind.be>
Message-ID: <20170710180105.44fa823a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 01:21:21 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We piggy-back on an existing test.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/testing/tests/toolchain/test_external.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> index afb4bb0b50..c315ef8055 100644
> --- a/support/testing/tests/toolchain/test_external.py
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -207,9 +207,13 @@ BR2_TOOLCHAIN_EXTERNAL_CXX=y
>          self.emulator.login()
>  
>  class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
> +    # On this test we piggy-back a test of BR2_CCACHE in combination
> +    # with an external toolchain.

I'm not sure I'm a big fan of "hijacking" an existing test to validate
ccache. Shouldn't we have a separate test for that, clearly identified
as being ccache related?

Could be a test that inherits from this one, and simply adds more
options. But at least in case of failure it will be clearly identified
as a CCache related test in the Gitlab CI results.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
