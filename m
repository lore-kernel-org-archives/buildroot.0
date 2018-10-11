From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 20:48:08 +0200
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
In-Reply-To: <20180926025514.2092-6-ricardo.martincoski@gmail.com>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20180926025514.2092-6-ricardo.martincoski@gmail.com>
Message-ID: <20181011204808.1aff4cd1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Sep 2018 23:55:14 -0300, Ricardo Martincoski wrote:

> +TEST_SCRIPT = """
> +from twisted.internet import protocol, reactor, endpoints
> +class F(protocol.Factory):
> +    pass
> +endpoints.serverFromString(reactor, "tcp:1234").listen(F())
> +reactor.run()
> +"""

At some point, we will have to find a solution to store such
"artefacts" somewhere, instead of having them inline in their test
cases. I don't have a good idea about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
