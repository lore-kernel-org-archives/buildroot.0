From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 12:44:02 +0100
Subject: [Buildroot] [PATCH] libsemanage: define installation location
 of semanage.conf for host
In-Reply-To: <20181109215730.30795-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 9 Nov 2018 22:57:30 +0100")
References: <20181109215730.30795-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h8g4ysfx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When /etc/selinux/semanage.conf does not exist, libsemanage tries to
 > overwrite it. For the target package, it works fine because $(DESTDIR)
 > is taken into account.

 > However, for the host package, $(DESTDIR) is empty, and the location
 > used for /etc/selinux/semanage.conf is not affected by $(PREFIX). This
 > causes host-libsemanage to try to install /etc/selinux/semanage.conf,
 > which obviously fails with:

 >   test -f /etc/selinux/semanage.conf || install -m 644 -D semanage.conf /etc/selinux/semanage.conf
 >   install: cannot create directory '/etc/selinux': Permission denied

 > To fix this, this commit passes DEFAULT_SEMANAGE_CONF_LOCATION in the
 > make options when building/installing host-libsemanage, providing a
 > path to semanage.conf that Buildroot can write to.

 > Fixes:

 >   http://autobuild.buildroot.net/results/cd27e3c66274622d0c3dd5a601a36efb1bc45011/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
