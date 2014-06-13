From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 19:55:44 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: test if "dot" exists in
 graph-build and <pkg>-graph-depends
In-Reply-To: <1402679208-8304-2-git-send-email-fabio.porcedda@gmail.com>
References: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
 <1402679208-8304-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140613195544.21c8a1c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 13 Jun 2014 19:06:48 +0200, Fabio Porcedda wrote:

> -graph-build: $(O)/build/build-time.log
> +graph-prerequisites:
> +	@dot -? >/dev/null 2>&1 || \
> +		(echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1)
> +
> +graph-build: $(O)/build/build-time.log graph-prerequisites

This is wrong: graph-build does not need the dot program, it's just a
Python script that uses matplotlib.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
