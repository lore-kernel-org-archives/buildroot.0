From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 23:06:58 +0100
Subject: [Buildroot] [PATCH 01/16] package/busybox: optional udhcpc
	script
In-Reply-To: <20150126222651.512e842f@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 26 Jan 2015 22:26:51 +0100")
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-2-git-send-email-maxtram95@gmail.com>
 <20150126222651.512e842f@free-electrons.com>
Message-ID: <87vbjtyz5p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Maxim Mikityanskiy,
 > On Mon, 19 Jan 2015 18:14:01 +0200, Maxim Mikityanskiy wrote:
 >> Create new config option BR2_PACKAGE_BUSYBOX_UDHCPC_SCRIPT to control
 >> whether to install optional udhcpc default.script. It is possible that
 >> udhcpc is not enabled in busybox config, so default.script is useless in
 >> that case.
 >> 
 >> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

 > Thanks for this patch. However, rather than using a new option, can we
 > instead simply test if udhcpc is enabled in the Busybox configuration?

Agreed, that would be a lot nicer.

>> +define BUSYBOX_PERMISSIONS
 >> +	/bin/busybox                     f 4755 0  0 - - - - -
 >> +endef
 >> +endif

 > I believe we can remove /usr/share/udhcpc/default.script entirely from
 > BUSYBOX_PERMISSIONS: it doesn't need any special permission or
 > ownership, so the default done by Buildroot will be fine in terms of
 > ownership, and in terms of permissions, 755 is already enforced by the
 > install command below.

Exactly.

-- 
Bye, Peter Korsgaard
