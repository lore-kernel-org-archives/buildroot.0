From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 12:36:30 +0200
Subject: [Buildroot] Avoiding rebuild of $(TARGET_DIR)/usr/bin/ldd
In-Reply-To: <1185524742.12803.13.camel@elrond.sweden.atmel.com>
References: <1185524742.12803.13.camel@elrond.sweden.atmel.com>
Message-ID: <20070727103630.GB22789@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 27, 2007 at 10:25:42AM +0200, Ulf Samuelsson wrote:
>$(TARGET_DIR)/usr/bin/ldd gets regenerated each load.
>When I study the output of "make -d", it gets rebuilt
>because of 'gcc'.
>
>I did the following to get rid of the rebuild, but I am not
>sure it is correct.
>
>Comments?

this was added to fix
sed -i -e "/JLEVEL/d" .config
echo "BR2_JLEVEL=1" >> .config
make -j 128

(i.e. toplevel parallel builds)

If your change works (i.e. if there is a rule somewhere to build
$(TARGET_CROSS)gcc, which i don't know off-hand) then please go ahead
and commit.
