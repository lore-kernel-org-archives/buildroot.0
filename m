From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 21 Nov 2017 21:18:20 +0100
Subject: [Buildroot] [PATCH v1] Fix makefile include order by using
 sort/wildcard.
In-Reply-To: <20171121191330.5621-1-ps.report@gmx.net>
References: <20171121191330.5621-1-ps.report@gmx.net>
Message-ID: <20171121201819.qlx2itbkqnc2sxsd@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Use ordered 'include $(sort $(wildcard ...))' instead of unordered
> direct 'include */*.mk'.

> Fixes [1] reported by Petr Vorel:

>   make: *** No rule to make target 'toolchain-external-custom', needed by '.../build/toolchain-external/.stamp_configured'.  Stop.

> [1] http://lists.busybox.net/pipermail/buildroot/2017-November/206969.html

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
Tested-by: Petr Vorel <petr.vorel@gmail.com>

Works as expected.

NOTE: I posted in original thread [1] which make version is affected by this behaviour.

Kind regards,
Petr

[1]: http://lists.busybox.net/pipermail/buildroot/2017-November/207453.html
