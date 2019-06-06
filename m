From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:37:21 +0200
Subject: [Buildroot] [PATCH v4] package/dosfstools: introduce custom
 install routine
In-Reply-To: <20190531194159.2566-1-mmayer@broadcom.com> (Markus Mayer's
 message of "Fri, 31 May 2019 12:41:59 -0700")
References: <20190531194159.2566-1-mmayer@broadcom.com>
Message-ID: <87imtig1xq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:

 > We can't use dosfstools' install target, because it'll install *all*
 > binaries, even the disabled ones. Also, we can't just delete dosfstools
 > binaries from the target directory after installing them, because other
 > packages (specifically Busybox) may provide tools of the same name, and
 > we may end up deleting those instead.

 > To avoid any issues, we create our own install routines, which only
 > copy the enabled binaries into the target location.

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
 > ---
 > Changes since v3:
 > - use $(INSTALL) -D -m 0755 $(@D)/src ...
 > - don't use post-install hooks
 > - instead call install macros from custom install target


Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
