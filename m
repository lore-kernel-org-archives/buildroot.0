From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Mar 2014 23:07:07 -0300
Subject: [Buildroot] [PATCH v2] gstreamer1-imx: new package
In-Reply-To: <20140303205342.GF3380@free.fr>
References: <1393363488-5547-1-git-send-email-ps.report@gmx.net>
 <20140303205342.GF3380@free.fr>
Message-ID: <5315354B.5070805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2014 05:53 PM, Yann E. MORIN wrote:

Hi all.

>> +define GSTREAMER1_IMX_BUILD_CMDS
>> +       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
> 
> Waf is known to have lotta isue when cross-compiling. Is that really
> working correctly?
> 
> Fortunately, this is only supposed to ever be run for an ARM target, so
> maybe they were not really concerned of making it really cross-compile
> friendly, as long as it works in these specific comditions.

Waf makes no distinction between host and target tools.
That being said if the wscript doesn't want to execute cross-tests
(intended for the target) or need to build special host tools as part of
the build process, then it's possible it works.
Regards.
