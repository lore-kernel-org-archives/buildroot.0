From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 20:55:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: adds target install of
 systemd unit files
In-Reply-To: <20201231173109.7d874dc2@windsurf> (Thomas Petazzoni's message of
 "Thu, 31 Dec 2020 17:31:09 +0100")
References: <20201215163610.12070-1-edmundo.ferreira@esa.int>
 <20201231154332.13ef7654@windsurf> <20201231173109.7d874dc2@windsurf>
Message-ID: <87h7nv6tvg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 31 Dec 2020 15:43:32 +0100
 > Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

 >> Hum, I've applied, but reading again distro/systemd/Makefile.am, it
 >> seems like manually copying those files is not needed. If you pass
 >> --enable-systemd, which we already do when BR2_PACKAGE_SYSTEMD=y. Isn't
 >> that working ?

 > I found why: we had a custom OPENVPN_INSTALL_TARGET_CMDS instead of
 > relying on the default "make install" behavior of the autotools-package
 > infra. So, I made a follow-up commit that drops this as well as the
 > custom systemd installation stuff, as "make install" does it all
 > properly.

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
