From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:28:48 +0200
Subject: [Buildroot] [PATCH v2] audit: do not remove file installed by
 netplug
In-Reply-To: <20180605020842.12761-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Mon, 4 Jun 2018 23:08:42 -0300")
References: <20180605020842.12761-1-casantos@datacom.com.br>
Message-ID: <87sh4imibz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > The package recipe uses a post-install hook to remove useless files from
 > $(TARGET_DIR)/etc/rc.d/init.d and $(TARGET_DIR)/etc/sysconfig. This may
 > damage packages that install useful files on those directories (such as
 > netplug, which installs $(TARGET_DIR)/etc/rc.d/init.d/netplugd).

 > In the future[1] we will reorganize the init scripts and possibly get
 > rid of /etc/rc.d and /etc/sysconfig but for the moment let's restrict
 > the file removal to those installed by audit.

 > 1. http://lists.busybox.net/pipermail/buildroot/2018-May/221549.html

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > Changes v1->v2
 >   - Remove file from /etc/rc.d/init.d/, not /etc/rc.d/

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
