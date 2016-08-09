From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 23:06:42 +0200
Subject: [Buildroot] [PATCH] libtasn1: add upstream build fix patch
In-Reply-To: <1470775776-18685-1-git-send-email-gustavo@zacarias.com.ar>
References: <1470775776-18685-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160809230642.21436629@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 17:49:36 -0300, Gustavo Zacarias wrote:
> Under certain circumstances the build will fail because some warnings
> are treated as errors, such as:
> 
> ./parser_aux.h:97:1: error: inlining failed in call to '_asn1_set_down':
> call is unlikely and code size would grow [-Werror=inline]
> ASN1.y:437:59: error: called from here [-Werror=inline]
> cc1: all warnings being treated as errors
> 
> Add upstream patch to address this.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

After discussing on IRC, this patch is not needed: the current version
of libtasn1, 4.8, has the gcc-warnings option disabled by default, so
it does not add -Werror.

Apparently, the problem starts with version 4.9, which Gustavo was
about to submit as a security fix. In this case --disable-gcc-warnings
should be used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
