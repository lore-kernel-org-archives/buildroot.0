From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:43:49 +0100
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: Generate package config
 if it is not specified
In-Reply-To: <20190317102736.51bd10fb@windsurf> (Thomas Petazzoni's message of
 "Sun, 17 Mar 2019 10:27:36 +0100")
References: <1551443622-29498-1-git-send-email-email@gmail.com>
 <20190317102736.51bd10fb@windsurf>
Message-ID: <87imw4tzxm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Vadim,
 > On Fri,  1 Mar 2019 14:33:42 +0200
 > Vadim Kochan <vadim4j@gmail.com> wrote:

 >> From: Vadim Kochan <vadim4j@gmail.com>
 >> 
 >> It is possible to generate one-line config for the package just by
 >> normalize it to the form:
 >> 
 >> BR2_PACKAGE_${pkg_replaced-to_and_uppercase}
 >> 
 >> it simplifes a bit of testing package where no additional config options
 >> are needed.
 >> 
 >> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
 >> ---
 >> utils/test-pkg | 17 ++++++++++++++++-
 >> 1 file changed, 16 insertions(+), 1 deletion(-)

 > Applied to master, thanks. I was initially a bit skeptical because if
 > the package has a dependency, your solution does not work very well,
 > and users could believe that the package is going to be tested while it
 > won't. But in fact in that case all tests are going to be "SKIPPED"
 > because the BR2_PACKAGE_FOO=y line is not in the final .config. This
 > will clearly tell the user that much not testing has happened. So I'm
 > fine with this, and therefore I applied.

While this isn't a bugfix, it seems quite safe and can be useful for
users - So I've committed it to 2019.02.x as well, thanks.

-- 
Bye, Peter Korsgaard
